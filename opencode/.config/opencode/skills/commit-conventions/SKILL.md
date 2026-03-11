---
name: commit-conventions
description: Conventional Commits reference for generating well-formed commit messages. Load when composing commit messages or reviewing commit history.
---

# Commit Conventions

Reference for writing well-formed commit messages following the Conventional Commits specification.

## Format

```
<type>(<scope>): <description>

[optional body]

[optional footer(s)]
```

### Subject line rules

- **Max 72 characters** total (type + scope + description)
- **Imperative mood**: "add feature" not "adds feature" or "added feature"
- **Lowercase**: everything after the colon is lowercase
- **No trailing period**
- Scope is optional but encouraged for multi-module repos

## Types

| Type       | When to use                                                        |
|------------|--------------------------------------------------------------------|
| `feat`     | Introduces a new feature                                           |
| `fix`      | Patches a bug                                                      |
| `docs`     | Documentation only changes                                         |
| `style`    | Formatting, whitespace — no logic change                           |
| `refactor` | Code change that neither fixes a bug nor adds a feature            |
| `perf`     | Performance improvement                                            |
| `test`     | Adding or correcting tests                                         |
| `chore`    | Maintenance: deps, build scripts, tooling — no production code     |
| `ci`       | CI/CD configuration changes                                        |
| `build`    | Build system or external dependency changes                        |
| `revert`   | Reverts a previous commit                                          |
| `wip`      | Work-in-progress checkpoint — skips all checks, not for main      |

## Scope

Use the name of the directory, module, or tool most affected:

```
feat(auth): add oauth2 login flow
fix(api): handle null response from upstream
chore(deps): bump vitest to 2.1.0
docs(nvim): document harpoon keymaps
```

For dotfiles repos with tool directories, use the tool name as scope:
`nvim`, `zsh`, `kitty`, `hyprland`, `kanata`, `git`, `alacritty`, etc.

## Body (optional)

Separate from subject with a blank line. Use when:
- The *why* is non-obvious
- There are notable side-effects
- Multiple things changed but one commit is justified

Wrap at 72 characters.

## Footer (optional)

```
BREAKING CHANGE: <description>
Fixes #<issue>
Refs #<issue>
```

## Examples

```
feat(nvim): add telescope live grep keymap

Adds <leader>sg to search across all project files using ripgrep.
Replaces the previous manual :grep workflow.

fix(zsh): correct PATH ordering so cargo bin takes priority

chore(kanata): update thumb cluster to add hyper layer

docs: add AGENTS.md with lua and shell style guidelines

refactor(nvim): extract lsp keymaps into dedicated setup function

wip: rough pass at git workflow command — not ready for review
```

## Atomicity

Each commit should represent one logical change. If `git diff --cached` shows
unrelated changes:
1. Use `git add -p` to stage only related hunks
2. Commit the first logical unit
3. Stage and commit the remainder separately

## Sensitive data gate

Before every commit, verify staged files do not contain:
- API keys, tokens, or secrets
- `.env` files or credential files
- Private SSH keys

If detected, unstage the file and warn the user before proceeding.
