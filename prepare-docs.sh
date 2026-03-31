#!/usr/bin/env bash

set -euo pipefail

# -----------------------------
# Config
# -----------------------------
CONTENT_DIR="content/en/guides/userguide"

# 👇 List of repos to aggregate
REPOS=(
  "https://github.com/ortelius/pdvd-backend.git"
  "https://github.com/ortelius/pdvd-platform.git"
  "https://github.com/ortelius/pdvd-deployment-gke.git"
)

# -----------------------------
# Function: inject front matter
# -----------------------------
inject_frontmatter() {
  local dir="$1"

  echo "👉 Injecting/normalizing front matter in $dir..."

  find "$dir" -type f -name "*.md" | while read -r file; do
    # Skip _index.md
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
      if ! grep -q "^description:" "$file"; then
        awk 'NR==1{print; next} /^---$/ && !done {print "description: >"; print "  " title; done=1} {print}' \
          title="$title" "$file" > "$file.tmp" && mv "$file.tmp" "$file"
      fi

    else
      # No front matter — prepend it
      tmpfile=$(mktemp)
      {
        printf -- '---\ntitle: "%s"\nlinkTitle: "%s"\nweight: 10\ndescription: >\n  %s\n---\n\n' \
          "$title" "$title" "$title"
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

repo_index=0
for repo in "${REPOS[@]}"; do
  repo_index=$((repo_index + 1))
  name=$(basename "$repo" .git)
  raw_section=""

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
  section=$(echo "$raw_section" | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | tr -dc 'a-z0-9-')
  section_dir="$CONTENT_DIR/$section"

  echo "  → $name (section: $raw_section)"

  # Skip if no docs or README
  if [ ! -d "/tmp/$name/docs" ] && [ ! -f "/tmp/$name/README.md" ]; then
    echo "    ⚠️ No /docs or README.md, skipping"
    continue
  fi

  mkdir -p "$section_dir"

  # -----------------------------
  # Make README.md the main page (_index.md)
  # -----------------------------
  if [ -f "/tmp/$name/README.md" ]; then
    title=$(echo "$raw_section" | sed 's/-/ /g' | sed 's/\b\(.\)/\u\1/g')
    cp "/tmp/$name/README.md" "$section_dir/_index.md"
    # Strip the first H1 from body (front matter title handles it)
    sed -i '0,/^# /{/^# /d}' "$section_dir/_index.md"
    # Only prepend front matter if the README has none
    if ! head -n 1 "$section_dir/_index.md" | grep -q "^---"; then
      tmpfile=$(mktemp)
      cat <<EOF > "$tmpfile"
---
title: "$title"
linkTitle: "$title"
weight: $repo_index
---
EOF
      cat "$section_dir/_index.md" >> "$tmpfile"
      mv "$tmpfile" "$section_dir/_index.md"
    fi
  else
    # If no README, create minimal _index.md
    title=$(echo "$raw_section" | sed 's/-/ /g' | sed 's/\b\(.\)/\u\1/g')
    cat <<EOF > "$section_dir/_index.md"
---
title: "$title"
weight: $repo_index
---
EOF
  fi

  # -----------------------------
  # Copy docs/*.md files
  # -----------------------------
  if [ -d "/tmp/$name/docs" ]; then
    cp -r "/tmp/$name/docs/"* "$section_dir/" 2>/dev/null || true
  fi

  # Fix links: strip docs/ prefix since files are moved up to section root
  find "$section_dir" -type f -name "*.md" | while read -r file; do
    sed -i 's|(docs/|(|g' "$file"
    perl -i -pe 's|\(([^):]*)\.md\)|(${1}/)|g' "$file"
  done

  # Normalize filenames (optional)
  find "$section_dir" -depth -name "*.md" | while read -r file; do
    new=$(echo "$file" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')
    if [ "$file" != "$new" ]; then
      mv "$file" "$new"
    fi
  done

  # Remove manual Table of Contents sections (Hugo generates its own)
  find "$section_dir" -type f -name "*.md" | while read -r file; do
    awk '
      /^## Table of Contents$/ { skip=1; next }
      skip && /^---$/ { skip=0; next }
      skip && /^## / { skip=0 }
      skip { next }
      { print }
    ' "$file" > "$file.tmp" && mv "$file.tmp" "$file"
  done

  # Inject front matter for all non-_index.md pages
  inject_frontmatter "$section_dir"

done

echo "✅ Docs prepared in ./$CONTENT_DIR"