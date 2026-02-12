# Perfect Pair Creator

A personalized pair programming partner for Claude Code and Cursor IDE - witty, agile-minded, and knows your cultural references.

## What This Does

Creates a custom programming partner that acts like your ideal pair, complete with:
- References to YOUR favorite shows, movies, and comedians
- The right balance of support vs. push-back for your style
- Playful roasting (as much or as little as you want)
- Agile-minded thinking tuned to your preferences
- A communication style that matches your vibe

## Supported Editors

- ✅ **Claude Code** - Interactive skill that generates custom output styles
- ✅ **Cursor IDE** - Ready-to-use `.cursorrules` and `.cursor/rules/` formats

## Installation

### For Claude Code

#### Option 1: Local Skill (Recommended for personal use)

### Option 1: Local Skill (Recommended for personal use)

```bash
# Copy the skill to your Claude skills directory
cp -r perfect-pair-creator/skills/create-perfect-pair ~/.claude/skills/
```

#### Option 2: Plugin (For sharing or organization)

```bash
# Copy the entire plugin to your plugins directory
cp -r perfect-pair-creator ~/.claude/plugins/user/
```

### For Cursor IDE

**See [`cursor-versions/CURSOR-README.md`](cursor-versions/CURSOR-README.md) for detailed instructions!**

Quick start:

#### Modern Format (Recommended)
```bash
# From your project root
mkdir -p .cursor/rules
cp cursor-versions/modern/.cursor/rules/perfect-pair.mdc .cursor/rules/
```

#### Legacy Format
```bash
# From your project root
cp cursor-versions/legacy/.cursorrules .cursorrules
```

## Usage

### Claude Code

Once installed, invoke the skill with:

```
/create-perfect-pair
```

Or just ask Claude:
- "Help me create a perfect pair style"
- "I want to personalize my programming partner"
- "Create a custom output style for me"

## The Process

The skill will guide you through:

1. **Listing your favorites** - TV shows, movies, comedians, other influences
2. **Choosing your style** - Roast level, push-back intensity, agile mindset, formality
3. **Generating your custom style** - A complete `.md` file tailored to you
4. **Installing it** - Instructions on where to save and how to use it

Takes about 5 minutes, and you can refine it anytime!

### Cursor IDE

Once installed, the rules apply automatically! Your AI partner will:
- Make witty references to Arrested Development, Breaking Bad, The Wire, and more
- Push back constructively when needed
- Keep you thinking agile
- Actually have personality

**Want to customize with YOUR favorites?** See [`cursor-versions/CUSTOMIZATION-TEMPLATE.md`](cursor-versions/CUSTOMIZATION-TEMPLATE.md)

## Example

See `skills/create-perfect-pair/examples/sample-perfect-pair.md` for an example of what a generated style looks like (this one is based on Arrested Development, Breaking Bad, The Wire, Seinfeld, and various comedy icons).

## Customization After Creation

Your generated style is just a markdown file - you can:
- Edit it anytime to add new references
- Adjust tone and communication style
- Share it with others (they can adapt it to their preferences)
- Version control it with your dotfiles
- Create multiple variations for different contexts

## File Structure

```
perfect-pair-creator/
├── README.md                          # This file
├── plugin.json                        # Plugin metadata for Claude Code
├── skills/                            # Claude Code skill
│   └── create-perfect-pair/
│       ├── SKILL.md                   # Interactive generator
│       ├── templates/
│       │   └── perfect-pair-template.md
│       └── examples/
│           └── sample-perfect-pair.md
└── cursor-versions/                   # Cursor IDE versions
    ├── CURSOR-README.md               # Cursor-specific docs
    ├── CUSTOMIZATION-TEMPLATE.md      # How to personalize
    ├── legacy/
    │   └── .cursorrules               # Legacy format
    └── modern/
        └── .cursor/rules/
            └── perfect-pair.mdc       # Modern format
```

## Requirements

**For Claude Code:**
- Claude Code CLI
- Basic familiarity with output styles (or just follow the instructions!)

**For Cursor:**
- Cursor IDE (2026+ for modern format, any version for legacy)
- No other requirements!

## Contributing

Have ideas for improving the generator? PRs welcome!

Ideas for enhancements:
- Additional style templates (minimalist, verbose, emoji-heavy, etc.)
- More configuration options
- Integration with other Claude Code features
- Pre-made style packs for common preferences

## License

MIT - Use it, share it, make it your own!

## Credits

Created because coding should be fun, and your programming partner should get your jokes.

Inspired by every dev who's ever said "I've made a huge mistake" while looking at their git diff.
