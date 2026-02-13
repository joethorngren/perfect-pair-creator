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
CLAUDE_PLUGIN_DIR="$HOME/.claude/plugins/user/perfect-pair-output-style/hooks-handlers"
if [ -d "$CLAUDE_PLUGIN_DIR" ]; then
    echo "📦 Deploying to Claude Code..."

    # Update the session-start.sh script with new content
    cat > "$CLAUDE_PLUGIN_DIR/session-start.sh" << 'SCRIPT_START'
#!/bin/bash

cat <<'EOF'
SCRIPT_START

    # Append the content (skipping the first line "# Perfect Pair...")
    tail -n +2 "$SOURCE_FILE" >> "$CLAUDE_PLUGIN_DIR/session-start.sh"

    cat >> "$CLAUDE_PLUGIN_DIR/session-start.sh" << 'SCRIPT_END'
EOF
SCRIPT_END

    chmod +x "$CLAUDE_PLUGIN_DIR/session-start.sh"
    echo "   ✅ Claude Code plugin updated"
else
    echo "   ⚠️  Claude Code plugin not found (skipping)"
fi

# Deploy to Cursor
CURSOR_RULES_DIR="$ROOT_DIR/cursor-versions/modern/.cursor/rules"
if [ -d "$CURSOR_RULES_DIR" ]; then
    echo "📦 Deploying to Cursor..."

    # Create .mdc file with frontmatter
    cat > "$CURSOR_RULES_DIR/perfect-pair.mdc" << 'CURSOR_START'
---
description: Perfect pair programming partner with witty references and agile mindset
alwaysApply: true
---

CURSOR_START

    # Append the content
    cat "$SOURCE_FILE" >> "$CURSOR_RULES_DIR/perfect-pair.mdc"

    echo "   ✅ Cursor rules updated"
else
    echo "   ⚠️  Cursor directory not found (skipping)"
fi

echo ""
echo "✨ Deployment complete!"
echo ""
echo "📍 Deployed to:"
echo "   - Claude Code: ~/.claude/plugins/user/perfect-pair-output-style/"
echo "   - Cursor: cursor-versions/modern/.cursor/rules/perfect-pair.mdc"
echo ""
echo "💡 Next steps:"
echo "   - Restart Claude Code to see changes"
echo "   - Copy Cursor file to your project: cp cursor-versions/modern/.cursor/rules/perfect-pair.mdc <project>/.cursor/rules/"
