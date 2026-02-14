#!/bin/bash
# Deploy script - syncs generated style to Claude Code and Cursor

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
GENERATED_DIR="$ROOT_DIR/generated"
SOURCE_FILE="$GENERATED_DIR/perfect-pair-current.md"

echo "🚀 Deploying Perfect Pair style..."

# Check if source exists
if [ ! -f "$SOURCE_FILE" ]; then
    echo "❌ Error: $SOURCE_FILE not found. Run ./build.sh first!"
    exit 1
fi

# Deploy to Claude Code plugin
CLAUDE_PLUGIN_BASE="$HOME/.claude/plugins/user/perfect-pair-output-style"
echo "📦 Deploying to Claude Code..."

# Create plugin directory structure
mkdir -p "$CLAUDE_PLUGIN_BASE/.claude-plugin"
mkdir -p "$CLAUDE_PLUGIN_BASE/hooks"
mkdir -p "$CLAUDE_PLUGIN_BASE/hooks-handlers"

# Write plugin manifest
cat > "$CLAUDE_PLUGIN_BASE/.claude-plugin/plugin.json" << 'PLUGIN_JSON'
{
  "name": "perfect-pair-output-style",
  "description": "Your perfect pair programming partner with references to The Office, Parks & Rec, Arrested Development, Chappelle Show, Key & Peele, SNL, and more",
  "version": "1.0.0",
  "author": {
    "name": "oh_henry"
  },
  "hooks": "./hooks/hooks.json"
}
PLUGIN_JSON

# Write hooks config
cat > "$CLAUDE_PLUGIN_BASE/hooks/hooks.json" << 'HOOKS_JSON'
{
  "description": "Perfect Pair output style hook",
  "hooks": {
    "SessionStart": [
      {
        "type": "command",
        "command": "${CLAUDE_PLUGIN_ROOT}/hooks-handlers/session-start.sh"
      }
    ]
  }
}
HOOKS_JSON

# Update the session-start.sh script with new content
cat > "$CLAUDE_PLUGIN_BASE/hooks-handlers/session-start.sh" << 'SCRIPT_START'
#!/bin/bash

cat <<'EOF'
SCRIPT_START

# Append the content (skipping the first line "# Perfect Pair...")
tail -n +2 "$SOURCE_FILE" >> "$CLAUDE_PLUGIN_BASE/hooks-handlers/session-start.sh"

cat >> "$CLAUDE_PLUGIN_BASE/hooks-handlers/session-start.sh" << 'SCRIPT_END'
EOF
SCRIPT_END

chmod +x "$CLAUDE_PLUGIN_BASE/hooks-handlers/session-start.sh"
echo "   ✅ Claude Code plugin updated"

# Deploy to Cursor (global) — 3-file split
CURSOR_GLOBAL_DIR="$HOME/.cursor/rules"
mkdir -p "$CURSOR_GLOBAL_DIR"

echo "📦 Deploying to Cursor (global, 3-file split)..."

# Remove old monolith if present
if [ -f "$CURSOR_GLOBAL_DIR/perfect-pair.mdc" ]; then
    rm "$CURSOR_GLOBAL_DIR/perfect-pair.mdc"
    echo "   🗑️  Removed old perfect-pair.mdc monolith"
fi

# Remove stow symlinks before writing real files
for f in perfect-pair-core.mdc perfect-pair-references.mdc perfect-pair-agile.mdc; do
    [ -L "$CURSOR_GLOBAL_DIR/$f" ] && rm "$CURSOR_GLOBAL_DIR/$f"
done

# --- perfect-pair-core.mdc ---
# Title + intro + Core Philosophy + Technical Approach + condensed Remember
cat > "$CURSOR_GLOBAL_DIR/perfect-pair-core.mdc" << 'FRONTMATTER'
---
description: Core pair programming philosophy and technical approach
alwaysApply: true
---

FRONTMATTER

# Title + intro + Core Philosophy (start through before ## Communication Style)
awk '/^## Communication Style/{exit} {print}' "$SOURCE_FILE" \
    >> "$CURSOR_GLOBAL_DIR/perfect-pair-core.mdc"

# Technical Approach section (## Technical Approach through before ## Tone Examples)
awk '/^## Technical Approach/{found=1} found{if(/^## Tone Examples/)exit; print}' "$SOURCE_FILE" \
    >> "$CURSOR_GLOBAL_DIR/perfect-pair-core.mdc"

# Condensed Remember (replaces original 13-line section)
cat >> "$CURSOR_GLOBAL_DIR/perfect-pair-core.mdc" << 'REMEMBER'
## Remember

You're the pair programmer who has their back but won't let them walk into a mess, makes the work enjoyable, thinks ahead, and keeps things moving with agile pragmatism. Now let's write some code that doesn't suck.
REMEMBER

# Validate core extraction
CORE_LINES=$(wc -l < "$CURSOR_GLOBAL_DIR/perfect-pair-core.mdc")
if [ "$CORE_LINES" -lt 35 ]; then
    echo "❌ Error: perfect-pair-core.mdc has only $CORE_LINES lines (expected 35+)."
    echo "   Section headers in generated output may have changed."
    exit 1
fi

# --- perfect-pair-references.mdc ---
# Communication Style + references + push back + roast (trimmed to 2 examples)
cat > "$CURSOR_GLOBAL_DIR/perfect-pair-references.mdc" << 'FRONTMATTER'
---
description: Communication style, references, and when to push back or roast
alwaysApply: true
---

FRONTMATTER

# Extract Communication Style section, keeping only first 2 roast examples
# example_count only increments after "Examples:" line to avoid false matches
awk '
/^## Communication Style/{found=1}
found {
    if (/^## Agile Mindset/) exit
    if (/^Examples:/) in_examples=1
    if (in_examples && /^- User:/) example_count++
    if (in_examples && example_count > 2) next
    print
}
' "$SOURCE_FILE" >> "$CURSOR_GLOBAL_DIR/perfect-pair-references.mdc"

# Validate references extraction
REF_LINES=$(wc -l < "$CURSOR_GLOBAL_DIR/perfect-pair-references.mdc")
if [ "$REF_LINES" -lt 25 ]; then
    echo "❌ Error: perfect-pair-references.mdc has only $REF_LINES lines (expected 25+)."
    echo "   Section headers in generated output may have changed."
    exit 1
fi

# --- perfect-pair-agile.mdc ---
# Agile Mindset in Practice
cat > "$CURSOR_GLOBAL_DIR/perfect-pair-agile.mdc" << 'FRONTMATTER'
---
description: Agile mindset - MVPs, iteration, and pragmatic development
alwaysApply: true
---

FRONTMATTER

awk '/^## Agile Mindset/{found=1} found{if(/^## Technical Approach/)exit; print}' "$SOURCE_FILE" \
    >> "$CURSOR_GLOBAL_DIR/perfect-pair-agile.mdc"

# Validate agile extraction
AGILE_LINES=$(wc -l < "$CURSOR_GLOBAL_DIR/perfect-pair-agile.mdc")
if [ "$AGILE_LINES" -lt 12 ]; then
    echo "❌ Error: perfect-pair-agile.mdc has only $AGILE_LINES lines (expected 12+)."
    echo "   Section headers in generated output may have changed."
    exit 1
fi

echo "   ✅ Cursor global rules updated (3-file split)"

# Also update repo version for reference/sharing
CURSOR_REPO_DIR="$ROOT_DIR/cursor-versions/modern/.cursor/rules"
if [ -d "$CURSOR_REPO_DIR" ]; then
    rm -f "$CURSOR_REPO_DIR/perfect-pair.mdc"
    cp "$CURSOR_GLOBAL_DIR/perfect-pair-core.mdc" "$CURSOR_REPO_DIR/"
    cp "$CURSOR_GLOBAL_DIR/perfect-pair-references.mdc" "$CURSOR_REPO_DIR/"
    cp "$CURSOR_GLOBAL_DIR/perfect-pair-agile.mdc" "$CURSOR_REPO_DIR/"
    echo "   ✅ Repo version updated (3-file split)"
fi

echo ""
echo "✨ Deployment complete!"
echo ""
echo "📍 Deployed to:"
echo "   - Claude Code: ~/.claude/plugins/user/perfect-pair-output-style/"
echo "   - Cursor: ~/.cursor/rules/perfect-pair-{core,references,agile}.mdc (global)"
echo ""
echo "💡 Next steps:"
echo "   - Restart Claude Code to see changes"
echo "   - Cursor will automatically use the global rules in all projects"
echo "   - Override per-project: Create <project>/.cursor/rules/ with custom rules"
