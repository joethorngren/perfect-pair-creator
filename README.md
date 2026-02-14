# Perfect Pair Creator

A personalized pair programming partner for Cursor IDE and Claude Code - witty, agile-minded, and knows your cultural references.

## What This Does

Creates a custom programming partner that acts like your ideal pair, complete with:
- References to YOUR favorite shows, movies, and comedians (The Office, Parks & Rec, Arrested Development, Chappelle Show, Key & Peele, SNL, and more)
- The right balance of support vs. push-back for your style
- Playful roasting (as much or as little as you want)
- Agile-minded thinking tuned to your preferences
- A communication style that matches your vibe

## 🚀 Quick Start

### 1. Clone the Repo

```bash
git clone https://github.com/joethorngren/perfect-pair-creator.git
cd perfect-pair-creator
```

### 2. Deploy to Your Editors

```bash
# Build from source + deploy to Cursor and Claude Code
./scripts/sync.sh
```

That's it! Perfect Pair is now active in:
- ✅ **Cursor** — 3 rules in `~/.cursor/rules/perfect-pair-{core,references,agile}.mdc`
- ✅ **Claude Code** — plugin in `~/.claude/plugins/user/perfect-pair-output-style/`

### First Time on a New Machine?

```bash
git clone https://github.com/joethorngren/perfect-pair-creator.git
cd perfect-pair-creator
./scripts/sync.sh   # builds + deploys everything
```

Requirements: bash, git. No other dependencies.
Restart Claude Code after the first deploy. Cursor picks up rules automatically.

### 3. Customize Your References

```bash
# Edit your reference library
open source/references.yaml  # or use any editor

# Add your favorite shows to core or rotating_pool

# Sync changes everywhere
./scripts/sync.sh
```

## 📚 Documentation

- **[WORKFLOW.md](WORKFLOW.md)** - Daily workflow guide
- **[CURSOR-README.md](cursor-versions/CURSOR-README.md)** - Cursor-specific details
- **[CURSOR-SKILLS-README.md](cursor-versions/CURSOR-SKILLS-README.md)** - Cursor 2.4+ interactive skill

## 🎯 How It Works

### Single Source of Truth

All your references live in one place:

```
source/references.yaml
```

Edit this file to add/remove shows, then run `./scripts/sync.sh` to deploy everywhere.

### Reference Library System

```yaml
core:
  # Always included - your absolute favorites
  - name: "The Office"
    usage: "Awkward code moments"
    examples: ["Michael Scott's 'that's what she said'"]

rotating_pool:
  # Rotates in/out to manage context
  - name: "Community"
    usage: "Meta discussions"
    examples: ["Cool cool cool"]
```

**Current**: All core + 5 rotating refs active (9 total)
**Future**: Smart rotation when library grows beyond 15-20 refs

### Build & Deploy

```bash
./scripts/sync.sh
```

This:
1. Reads `source/references.yaml`
2. Generates complete style from template
3. Deploys to Cursor global rules
4. Deploys to Claude Code plugin
5. Updates repo version for sharing

## 🎭 Example Styles

We've included **5 pre-made styles** with different personalities:

1. **Original Perfect Pair** - Sharp wit, mix of comedy styles
2. **Office Comedy Fan** - Supportive, wholesome
3. **Sci-Fi Philosopher** - Logical, thoughtful
4. **British Wit** - Dry, clever
5. **Minimalist Zen** - Focused, no fluff

See all: [`cursor-versions/modern/.cursor/rules/examples/`](cursor-versions/modern/.cursor/rules/examples/)

## ✏️ Adding References

### Method 1: Edit YAML Directly (Recommended)

```bash
# Edit the file
open source/references.yaml

# Add your show to core or rotating_pool

# Sync
./scripts/sync.sh
```

### Method 2: Use the Interactive Skill (Coming Soon)

```bash
# Claude Code
/add-reference

# Answer questions, it updates references.yaml for you
```

## 📁 File Structure

```
perfect-pair-creator/
├── source/
│   ├── references.yaml              # ✏️  Your reference library (EDIT THIS)
│   └── perfect-pair-base.md         # Template
├── scripts/
│   ├── sync.sh                      # 🚀 Main command (build + deploy)
│   ├── build.sh                     # Generate from references
│   └── deploy.sh                    # Deploy to platforms
├── generated/
│   └── perfect-pair-current.md      # Auto-generated output
├── cursor-versions/
│   └── modern/.cursor/rules/        # Cursor formats
└── skills/
    └── create-perfect-pair/         # Claude Code skill
```

## 🔄 Reference Rotation (Coming Soon)

As your library grows, we'll automatically rotate references to manage context:

- Keep 4-5 core favorites always active
- Rotate 5 others weekly from the pool
- Smart rotation based on usage patterns
- Keep context under control

## 💡 Common Workflows

### Daily: Add a New Show

```bash
# 1. Edit
open source/references.yaml
# Add "Community" to rotating_pool

# 2. Sync
./scripts/sync.sh

# Done! New references available everywhere
```

### Weekly: Update Rotating Refs (Future)

```bash
./scripts/rotate.sh
```

### Share with Team

```bash
git add source/references.yaml
git commit -m "Added Community and 30 Rock"
git push

# Team pulls and syncs
git pull && ./scripts/sync.sh
```

## 🎯 Installation Details

### Cursor (Global)

Deploys 3 files to `~/.cursor/rules/`:
- `perfect-pair-core.mdc` — philosophy + technical approach
- `perfect-pair-references.mdc` — communication style + references
- `perfect-pair-agile.mdc` — agile mindset
- Works in all projects automatically
- Can override per-project if needed

### Claude Code (Plugin)

Deploys to `~/.claude/plugins/user/perfect-pair-output-style/`
- Applies to all sessions via SessionStart hook
- Restart Claude Code to see changes

## 🛠️ Requirements

- Bash (for scripts)
- Git (for cloning/updates)
- Cursor IDE (any version)
- Claude Code CLI (for Claude Code support)

## 🤝 Contributing

Have ideas? PRs welcome!

Ideas:
- Smart rotation implementation
- Usage tracking
- More pre-made styles
- Integration with other AI tools

## 📄 License

MIT - Use it, share it, make it your own!

## 🙏 Credits

Created because coding should be fun, and your programming partner should get your jokes.

Inspired by every dev who's ever said "I've made a huge mistake" while looking at their git diff.

---

**Quick Links:**
- [Workflow Guide](WORKFLOW.md)
- [Cursor Setup](cursor-versions/CURSOR-README.md)
- [GitHub Repo](https://github.com/joethorngren/perfect-pair-creator)
