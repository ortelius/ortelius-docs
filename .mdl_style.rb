# enable all rules
all

# Inline HTML
exclude_rule 'MD033'

# Line length
exclude_rule 'MD013'

# ignoring for Docsy frontmatter
# First line in file should be a top level header
exclude_rule 'MD041'
# First header should be a top level header
exclude_rule 'MD002'

# Multiple consecutive blank lines
exclude_rule 'MD012'

# ignoring because it will be hard to rename 50 headers called Examples into unique values
# Multiple headers with the same content
exclude_rule 'MD024'
