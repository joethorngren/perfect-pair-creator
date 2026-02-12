# Perfect Pair for Cursor

Bring the perfect pair programming partner to Cursor IDE! This custom rules configuration gives you a witty, agile-minded coding partner who knows your references and isn't afraid to push back.

## Installation

### Option 1: Modern Format (Recommended for 2026)

The modern `.cursor/rules/` format is more flexible and version-control friendly.

```bash
# From your project root
mkdir -p .cursor/rules
cp cursor-versions/modern/.cursor/rules/perfect-pair.mdc .cursor/rules/
```

Cursor will automatically detect and apply the rules!

### Option 2: Legacy Format (Still Supported)

The legacy `.cursorrules` file is simpler but less flexible.

```bash
# From your project root
cp cursor-versions/legacy/.cursorrules .cursorrules
```

## What You Get

A pair programming partner who:
- Makes references to Arrested Development, Breaking Bad, The Wire, Seinfeld, and more
- Pushes back constructively when you're about to make a mistake
- Points out future complexity before it bites you
- Keeps things agile and iterative
- Can playfully roast you when you say something silly
- Actually has personality (not just "As your AI assistant...")

## Customization

Want to personalize it with YOUR favorite shows and references? Here's how:

### Quick Customization

1. **Open the file** (`.cursorrules` or `.cursor/rules/perfect-pair.mdc`)
2. **Find the "Make Smart References" section**
3. **Replace the shows with your favorites:**

```markdown
### Make Smart References (When Appropriate)
When the moment calls for it, draw from the shared library:
- **Your Favorite Show**: When to use it and what it's good for
- **Another Show**: Context for references
- **A Comedian**: What style of humor/insight they bring
```

4. **Add examples in the roasting section:**

```markdown
Examples:
- User: "Let's just rewrite everything"
  You: "[Reference to YOUR show] Let's think smaller..."
```

### Advanced Customization

Want to tune the style even more? Adjust these sections:

**Roast Level** - In the "When to (Gently) Roast" section:
- Add more examples for heavier roasting
- Remove examples for lighter touch

**Push-back Intensity** - In the "When to Push Back" section:
- Add/remove conditions based on your preference
- Adjust the tone of the framework ("constructively" vs "aggressively")

**Agile Intensity** - In the "Agile Mindset in Practice" section:
- Add more strict rules for hardcore agile
- Make it more flexible for relaxed approach

**Formality** - In "Communication Style":
- Adjust "Talk like a peer" to "Talk professionally" or "Talk like a best friend"
- Change the Daily Show reference to match your preferred tone

## Examples of What This Looks Like

**Before (Generic AI):**
> "I'll implement the login functionality with JWT authentication. Let me create the authentication middleware first."

**After (Perfect Pair):**
> "Okay, so JWT auth - solid choice. Before we go full Heisenberg on this and build a perfect system, let's start with the basics. We'll do the middleware first, but fair warning: we're gonna need to think about token refresh soon or we'll have angry users faster than you can say 'I am the one who knocks.' Want to stub that out now or handle it in the next iteration?"

## File Structure

```
.cursor/
└── rules/
    └── perfect-pair.mdc    # Your custom rules
```

Or for legacy:

```
.cursorrules               # Your custom rules (project root)
```

## Tips

1. **Start with the provided version** - It's already tuned with good examples
2. **Add your favorites gradually** - No need to replace everything at once
3. **Test it out** - Try a few coding sessions and see what resonates
4. **Iterate** - Just like code, your rules can evolve
5. **Version control it** - Commit your `.cursor` folder to share with your team

## Sharing with Your Team

The modern format (`.cursor/rules/`) is perfect for team sharing:

```bash
# Add to git
git add .cursor/rules/
git commit -m "Add perfect-pair cursor rules"
git push
```

Now your whole team can code with the same witty partner!

## Pro Tips

### Multiple Personalities

Create different rule files for different contexts:

```
.cursor/
└── rules/
    ├── perfect-pair.mdc        # Default partner
    ├── serious-mode.mdc        # For production debugging
    └── experimental.mdc        # For exploration
```

Use `alwaysApply: false` and specific `globs` to control when each activates:

```yaml
---
description: Experimental coding style for prototypes
alwaysApply: false
globs: ["experimental/**/*.ts", "prototypes/**/*"]
---
```

### Context-Specific Rules

Want different behavior for different files?

```yaml
---
description: Extra careful for auth-related code
globs: ["**/auth/**/*", "**/security/**/*"]
alwaysApply: false
---

# Security-Focused Pair

When working on authentication and security:
- Triple-check for vulnerabilities
- Reference OWASP top 10
- No jokes about "it's probably fine"
- Paranoid level: Maximum
```

## Troubleshooting

**Rules not applying?**
- Make sure the file is in the right location
- Check that frontmatter is valid YAML (for modern format)
- Restart Cursor

**Too many references?**
- Adjust the section to say "Use references sparingly"
- Remove some examples

**Not enough personality?**
- Add more examples to the "Tone Examples" section
- Increase the roasting examples
- Make the language more casual

## Need Help?

Check out these resources about Cursor rules:
- [Cursor Rules Documentation](https://docs.cursor.com)
- [awesome-cursorrules](https://github.com/PatrickJS/awesome-cursorrules)
- [.cursorrules.com](https://dotcursorrules.com)

## License

MIT - Make it your own!

---

Created because coding should be fun, and your AI partner should get your jokes. Now go forth and write some code that doesn't suck! 🚀
