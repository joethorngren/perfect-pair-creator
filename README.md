# Perfect Pair Creator

A personalized pair programming partner for Cursor IDE and Claude Code - witty, agile-minded, and knows your cultural references.

## What This Does

Creates a custom programming partner that acts like your ideal pair, complete with:
- References to YOUR favorite shows, movies, and comedians (The Office, Parks & Rec, Arrested Development, Chappelle Show, Key & Peele, SNL, and more)
- The right balance of support vs. push-back for your style
- Playful roasting (as much or as little as you want)
- Agile-minded thinking tuned to your preferences
- A communication style that matches your vibe

## Supported Editors

- ✅ **Cursor IDE** - Ready-to-use `.cursor/rules/` format + interactive skill (Cursor 2.4+)
- ✅ **Claude Code** - Interactive skill that generates custom output styles

## Installation

### For Cursor IDE (Recommended)

**See [`cursor-versions/CURSOR-README.md`](cursor-versions/CURSOR-README.md) for detailed instructions!**

Quick start:

```bash
# From your project root
mkdir -p .cursor/rules
cp cursor-versions/modern/.cursor/rules/perfect-pair.mdc .cursor/rules/
```

That's it! Cursor will automatically apply the rules.

### For Claude Code

```bash
# Copy the skill to your Claude skills directory
cp -r skills/create-perfect-pair ~/.claude/skills/
```

## Usage

### Cursor IDE

Once installed, the rules apply automatically! Your AI partner will:
- Make witty references to The Office, Parks & Rec, Arrested Development, Chappelle Show, Key & Peele, and more
- Push back constructively when needed
- Keep you thinking agile
- Actually have personality

**Want to customize with YOUR favorites?** See [`cursor-versions/CUSTOMIZATION-TEMPLATE.md`](cursor-versions/CUSTOMIZATION-TEMPLATE.md)

**For Cursor 2.4+:** Use the interactive skill - see [CURSOR-SKILLS-README.md](cursor-versions/CURSOR-SKILLS-README.md)

### Claude Code

Once installed, invoke the skill with:

```
/create-perfect-pair
```

Or just ask Claude:
- "Help me create a perfect pair style"
- "I want to personalize my programming partner"
- "Create a custom output style for me"

The skill will guide you through:

1. **Listing your favorites** - TV shows, movies, comedians, other influences
2. **Choosing your style** - Roast level, push-back intensity, agile mindset, formality
3. **Generating your custom style** - A complete `.md` file tailored to you
4. **Installing it** - Instructions on where to save and how to use it

Takes about 5 minutes, and you can refine it anytime!

## 🎭 Example Styles

We've included **5 pre-made styles** with different personalities:

1. **Original Perfect Pair** - Sharp wit, mix of comedy styles (The Office, Parks & Rec, Arrested Development, Chappelle Show, Key & Peele)
2. **Office Comedy Fan** - Supportive, wholesome (The Office, Parks & Rec, Brooklyn Nine-Nine)
3. **Sci-Fi Philosopher** - Logical, thoughtful (Star Trek, Doctor Who, The Expanse)
4. **British Wit** - Dry, clever (IT Crowd, Monty Python, Blackadder)
5. **Minimalist Zen** - Focused, no fluff (no references, pure clarity)

**See all examples:** [`cursor-versions/modern/.cursor/rules/examples/`](cursor-versions/modern/.cursor/rules/examples/)

Try different styles to find your perfect match, or use them as inspiration for your own!

## Example

See `skills/create-perfect-pair/examples/sample-perfect-pair.md` for an example of what a generated style looks like.

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
├── README.md                                  # This file
├── plugin.json                                # Plugin metadata for Claude Code
├── cursor-versions/                           # Cursor IDE versions
│   ├── CURSOR-README.md                       # Cursor setup guide
│   ├── CURSOR-SKILLS-README.md                # Cursor 2.4+ skills guide
│   ├── CUSTOMIZATION-TEMPLATE.md              # Manual customization template
│   ├── modern/
│   │   └── .cursor/rules/
│   │       ├── perfect-pair.mdc               # Main style
│   │       └── examples/                      # 4 additional example styles
│   │           ├── office-comedy-fan.mdc
│   │           ├── sci-fi-philosopher.mdc
│   │           ├── british-wit.mdc
│   │           └── minimalist-zen.mdc
│   └── skills/                                # Cursor 2.4+ skill
│       └── create-perfect-pair/
│           ├── SKILL.md
│           ├── templates/
│           └── examples/
└── skills/                                    # Claude Code skill
    └── create-perfect-pair/
        ├── SKILL.md
        ├── templates/
        └── examples/
```

## Requirements

**For Cursor:**
- Cursor IDE (any version for pre-made rules, 2.4+ for interactive skill)
- No other requirements!

**For Claude Code:**
- Claude Code CLI
- Basic familiarity with output styles (or just follow the instructions!)

## Contributing

Have ideas for improving the generator? PRs welcome!

Ideas for enhancements:
- Additional style templates (minimalist, verbose, emoji-heavy, etc.)
- More configuration options
- Pre-made style packs for common preferences
- Community-contributed example styles

## License

MIT - Use it, share it, make it your own!

## Credits

Created because coding should be fun, and your programming partner should get your jokes.

Inspired by every dev who's ever said "I've made a huge mistake" while looking at their git diff.
