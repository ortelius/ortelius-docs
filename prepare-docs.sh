#!/usr/bin/env bash

set -euo pipefail

# -----------------------------
# Config
# -----------------------------
CONTENT_DIR="content/en/guides/userguide"

# 👇 List of repos to aggregate — first entry becomes the top-level section;
#    all others are nested as subsections beneath it.
REPOS=(
  "https://github.com/ortelius/pdvd-backend.git"
  "https://github.com/ortelius/pdvd-platform.git"
  "https://github.com/ortelius/pdvd-deployment-gke.git"
)

# -----------------------------
# Global weight counter
# Stored in a temp file so increments survive subshell boundaries (find|while pipes).
# -----------------------------
WEIGHT_FILE=$(mktemp)
echo 0 > "$WEIGHT_FILE"
trap 'rm -f "$WEIGHT_FILE"' EXIT

next_weight() {
  local w
  w=$(cat "$WEIGHT_FILE")
  w=$((w + 1))
  echo "$w" > "$WEIGHT_FILE"
  echo "$w"
}

# -----------------------------
# Function: inject front matter
# -----------------------------
inject_frontmatter() {
  local dir="$1"
  local find_depth=""
  # Pass "--max-depth 1" as second arg to restrict to top-level files only
  if [[ "${2:-}" == "--max-depth 1" ]]; then
    find_depth="-maxdepth 1"
  fi

  echo "👉 Injecting/normalizing front matter in $dir..."

  find "$dir" $find_depth -type f -name "*.md" | sort | while read -r file; do
    # Skip _index.md — its weight is assigned when it is created in process_repo
    if [[ "$(basename "$file")" == "_index.md" ]]; then
      continue
    fi

    filename=$(basename "$file" .md)

    # Use first H1 from file body as title, fall back to filename
    h1=$(grep -m 1 "^# " "$file" | sed 's/^# //')
    if [ -n "$h1" ]; then
      title="$h1"
    else
      title=$(echo "$filename" \
        | sed 's/-/ /g' \
        | sed 's/_/ /g' \
        | sed 's/\b\(.\)/\u\1/g')
    fi

    if head -n 1 "$file" | grep -q "^---"; then
      # Front matter exists — update title from H1 if we found one, add missing fields
      if [ -n "$h1" ]; then
        awk 'BEGIN{in_fm=0; done=0}
          NR==1 && /^---$/ { in_fm=1; print; next }
          in_fm && /^---$/ && !done { print "title: \"" title "\""; done=1; in_fm=0; print; next }
          in_fm && /^title:/ { next }
          { print }' title="$title" "$file" > "$file.tmp" && mv "$file.tmp" "$file"
      fi
      if ! grep -q "^linkTitle:" "$file"; then
        awk 'NR==1{print; next} /^---$/ && !done {print "linkTitle: \"" title "\""; done=1} {print}' \
          title="$title" "$file" > "$file.tmp" && mv "$file.tmp" "$file"
      fi
      if ! grep -q "^weight:" "$file"; then
        w=$(next_weight)
        awk 'NR==1{print; next} /^---$/ && !done {print "weight: " w; done=1} {print}' \
          w="$w" "$file" > "$file.tmp" && mv "$file.tmp" "$file"
      fi
      if ! grep -q "^description:" "$file"; then
        awk 'NR==1{print; next} /^---$/ && !done {print "description: >"; print "  " title; done=1} {print}' \
          title="$title" "$file" > "$file.tmp" && mv "$file.tmp" "$file"
      fi

    else
      # No front matter — prepend it with the next global weight
      w=$(next_weight)
      tmpfile=$(mktemp)
      {
        printf -- '---\ntitle: "%s"\nlinkTitle: "%s"\nweight: %s\ndescription: >\n  %s\n---\n\n' \
          "$title" "$title" "$w" "$title"
        cat "$file"
      } > "$tmpfile"
      mv "$tmpfile" "$file"
    fi
  done
}

# -----------------------------
# Main script
# -----------------------------
echo "👉 Cleaning previous generated content..."
rm -rf "$CONTENT_DIR"
mkdir -p "$CONTENT_DIR"

echo "👉 Processing repositories..."

# The first repo is the top-level section; all others nest under it as subsections.
TOP_REPO="${REPOS[0]}"
SUB_REPOS=("${REPOS[@]:1}")

# -----------------------------
# Helper: process a single repo's docs into a target directory
# -----------------------------
process_repo() {
  local repo="$1"
  local target_dir="$2"
  local is_top="$3"   # "true" if this is the top-level repo

  local name
  name=$(basename "$repo" .git)
  local raw_section=""

  # Clone or update repo into /tmp to avoid polluting the doc repo
  if [ ! -d "/tmp/$name" ]; then
    git clone --depth 1 "$repo" "/tmp/$name"
  else
    (cd "/tmp/$name" && git pull --ff-only)
  fi

  # Derive section name from first H1 in README, fall back to repo name
  if [ -f "/tmp/$name/README.md" ]; then
    raw_section=$(grep -m 1 "^# " "/tmp/$name/README.md" | sed 's/^# //')
  fi
  if [ -z "${raw_section}" ]; then
    raw_section="$name"
  fi

  echo "  → $name (section: $raw_section, dir: $target_dir)"

  # Skip if no docs or README
  if [ ! -d "/tmp/$name/docs" ] && [ ! -f "/tmp/$name/README.md" ]; then
    echo "    ⚠️ No /docs or README.md, skipping"
    return
  fi

  mkdir -p "$target_dir"

  # -----------------------------
  # Make README.md the main page (_index.md) — consumes one weight slot
  # -----------------------------
  local title
  title=$(echo "$raw_section" | sed 's/-/ /g' | sed 's/\b\(.\)/\u\1/g')
  local w
  w=$(next_weight)

  if [ -f "/tmp/$name/README.md" ]; then
    cp "/tmp/$name/README.md" "$target_dir/_index.md"
    # Strip the first H1 from body (front matter title handles it)
    sed -i '0,/^# /{/^# /d}' "$target_dir/_index.md"
    # Only prepend front matter if the README has none
    if ! head -n 1 "$target_dir/_index.md" | grep -q "^---"; then
      tmpfile=$(mktemp)
      cat <<EOF > "$tmpfile"
---
title: "$title"
linkTitle: "$title"
weight: $w
---
EOF
      cat "$target_dir/_index.md" >> "$tmpfile"
      mv "$tmpfile" "$target_dir/_index.md"
    fi
  else
    # If no README, create minimal _index.md
    cat <<EOF > "$target_dir/_index.md"
---
title: "$title"
weight: $w
---
EOF
  fi

  # -----------------------------
  # Copy docs/*.md files
  # -----------------------------
  if [ -d "/tmp/$name/docs" ]; then
    cp -r "/tmp/$name/docs/"* "$target_dir/" 2>/dev/null || true
  fi

  # Fix links: strip docs/ prefix since files are moved up to section root
  find "$target_dir" -type f -name "*.md" | while read -r file; do
    sed -i 's|(docs/|(|g' "$file"
    perl -i -pe 's|\(([^):]*)\.md\)|(${1}/)|g' "$file"
  done

  # Normalize filenames (optional)
  find "$target_dir" -depth -name "*.md" | while read -r file; do
    new=$(echo "$file" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')
    if [ "$file" != "$new" ]; then
      mv "$file" "$new"
    fi
  done

  # Remove manual Table of Contents sections (Hugo generates its own)
  find "$target_dir" -type f -name "*.md" | while read -r file; do
    awk '
      /^## Table of Contents$/ { skip=1; next }
      skip && /^---$/ { skip=0; next }
      skip && /^## / { skip=0 }
      skip { next }
      { print }
    ' "$file" > "$file.tmp" && mv "$file.tmp" "$file"
  done

  # Inject front matter for all non-_index.md pages.
  # For the top-level repo, restrict to top-level files only (not subsection subdirs).
  if [ "$is_top" = "true" ]; then
    inject_frontmatter "$target_dir" "--max-depth 1"
  else
    inject_frontmatter "$target_dir"
  fi
}

# Process the top-level repo directly into CONTENT_DIR
process_repo "$TOP_REPO" "$CONTENT_DIR" "true"

# Process the remaining repos as subsections nested under CONTENT_DIR
for repo in "${SUB_REPOS[@]}"; do
  name=$(basename "$repo" .git)
  raw_section=""

  # Peek at README for section name (repo may already be cloned)
  if [ -d "/tmp/$name" ] && [ -f "/tmp/$name/README.md" ]; then
    raw_section=$(grep -m 1 "^# " "/tmp/$name/README.md" | sed 's/^# //')
  fi
  if [ -z "${raw_section}" ]; then
    raw_section="$name"
  fi
  section=$(echo "$raw_section" | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | tr -dc 'a-z0-9-')

  process_repo "$repo" "$CONTENT_DIR/$section" "false"
done

echo "✅ Docs prepared in ./$CONTENT_DIR"