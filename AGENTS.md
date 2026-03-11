# Agent Instructions for Dotfiles Repository

This repository contains Astro's dotfiles, managed with GNU Stow. Each top-level
directory corresponds to one tool and mirrors the structure expected under `$HOME`.

## Build, Lint, and Test Commands

### Lua (Neovim)
- **Format**: `stylua .` — run from `neovim/` or the repo root
- **Single file**: `stylua neovim/.config/nvim/lua/plugins/harpoon.lua`
- Config lives in `neovim/.config/nvim/.stylua.toml`

### Shell Scripts
- **Lint single script**: `shellcheck custom_scripts/.local/scripts/<name>`
- **Lint all scripts**: `shellcheck custom_scripts/.local/scripts/*`
- No autofix available; all fixes are manual

### No top-level build system
There is no `Makefile`, `justfile`, or `package.json` at the repo root.
Formatting and linting are per-language as above.

---

## Deploying with Stow

Run from the repo root:
```sh
stow alacritty custom_scripts git hyprland kanata kitty neovim rust zellij zsh
```
Each argument is a top-level directory. Stow creates symlinks in `$HOME`.
Never edit files via their `$HOME` symlink path — always edit in the dotfiles repo.

Never run stow commands, but suggest them to the user.

---

## Code Style Guidelines

### Lua (neovim/)

**Formatting** — enforced by `.stylua.toml`:
- Indent: 2 spaces
- Column width: 160
- Quotes: single preferred (`AutoPreferSingle`)
- `call_parentheses = "None"`: omit parens on single-arg calls
  - Write `require 'foo'`, not `require('foo')`
  - Write `vim.cmd 'set wrap'`, not `vim.cmd('set wrap')`

**Module structure**:
- Every plugin file lives in `lua/plugins/` and returns a lazy.nvim spec table
- Use `opts = { ... }` for simple plugin setup; `config = function() ... end` only when
  side effects beyond `setup()` are needed (keymaps, autocommands, etc.)
- Lazy-load aggressively: prefer `event`, `cmd`, `ft`, or `keys` over eager loading
- Group LSP-adjacent plugins under `lua/plugins/lsp/`; `lsp/init.lua` aggregates them

**Imports**:
```lua
-- Correct (no parens, single quotes)
local telescope = require 'telescope'
local actions = require 'telescope.actions'

-- Wrong
local telescope = require("telescope")
```

**Keymaps**:
- Use a local `map()` helper inside `config` functions rather than calling
  `vim.keymap.set` directly everywhere
- Always include a `desc` field; use `[B]racket` notation for highlighting:
  `desc = '[G]o to [D]efinition'`

**Autocommands**:
```lua
local group = vim.api.nvim_create_augroup('MyGroup', { clear = true })
vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
  group = group,
  callback = function() ... end,
})
```

**Error handling**: wrap optional/missing modules with `pcall`:
```lua
local ok, mod = pcall(require, 'optional-module')
if ok then mod.setup() end
```

**Modeline**: every Lua file ends with:
```lua
-- vim: ts=2 sts=2 sw=2 et
```

**After editing any Lua file**: always run `stylua .` before committing.

---

### Shell Scripts (custom_scripts/, zsh/)

**Shebang choice**:
- Default to `#!/bin/sh` (POSIX) for simple scripts
- Use `#!/usr/bin/env bash` only when arrays, `[[ ]]`, or other bashisms are required

**Safety header for bash scripts**:
```sh
#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'
```

**File header**:
```sh
#!/bin/sh
# Date: YYYY/MM/DD
# Description: one-line summary
```

**Quoting**: always double-quote variable expansions (`"$var"`, `"$@"`, `"$1"`)

**Tool guards** — check before use:
```sh
command -v fzf 1>/dev/null 2>/dev/null || { echo "fzf not found"; exit 1; }
```

**Error helpers** in complex scripts — define `die()` / `err()` functions:
```sh
die() { echo "[ERROR] $*" >&2; exit 1; }
```

**Prefer**: `printf` over `echo -e`; `read -r` over `read`

**After editing scripts**: run `shellcheck` on the file.

---

### Zsh Config (zsh/)

- Env vars and PATH modifications belong in `.zprofile` (login shell, POSIX `sh`)
- Interactive settings, aliases, and functions belong in `.config/zsh/.zshrc`
- Follow XDG base directory spec (`$XDG_CONFIG_HOME`, `$XDG_DATA_HOME`, etc.)
- Guard aliases behind `command -v` checks so the config works on machines
  without every tool installed
- Use zinit with `wait lucid` for deferred plugin loading

---

### Rust (rust/)

- Follow standard Rust idioms; run `clippy` and fix all warnings before committing
- The global Cargo config in `rust/.cargo/config.toml` is stowed to `~/.cargo/config.toml`
  and applies to all Rust projects on the machine — edit with care

---

## Agent Workflow Protocols

### Modifying Configurations
1. Identify the tool directory the file belongs to
2. Edit the file in the dotfiles repo, never via its `$HOME` symlink
3. Run the appropriate formatter/linter for the language after editing
4. If the stow symlink doesn't exist yet, run `stow <dir>` from the repo root

### Adding a New Tool
1. Create a new top-level directory
2. Nest files as they would appear under `$HOME` (e.g., `newtool/.config/newtool/config`)
3. Add the directory name to the `stow` command in `README.md`
4. Add formatting/linting commands to this file if a new language is introduced

### Neovim Plugin Configuration
1. Create a new file in `lua/plugins/` (or `lua/plugins/lsp/` for LSP-adjacent plugins)
2. Return a valid lazy.nvim spec table
3. Register it in `lazy-plugins.lua` via `require 'plugins.name'`
4. Run `stylua .` from the repo root after any Lua edits

### OpenCode Configuration (opencode/)

The goal is **full portability**: cloning this repo on a new machine and running
`stow opencode` should give the same OpenCode capabilities as any other machine.

**What belongs in the repo** (`opencode/.config/opencode/`):
- `opencode.json` — MCP servers, plugin declarations, and global settings
- `commands/*.md` — slash commands
- `skills/*/SKILL.md` — all skills and their supporting files
- `vibeguard.config.json` — vibeguard redaction patterns (no secrets; `keywords` stays empty)

**What must not be committed**:
- `node_modules/`, `package.json`, `bun.lock` — OpenCode manages these at runtime; they are gitignored at the repo root
- `__pycache__/`, `*.pyc` — Python bytecode from skill scripts; also gitignored
- `.env` — machine-specific secrets; never commit

**When adding a skill**:
- Always place it under `opencode/.config/opencode/skills/<name>/SKILL.md`
- Never use `~/.agents/skills/` — that directory is not tracked
- Neither `npx skilo-cli` nor `npx skills` support a `--path` flag, so the install workflow is:
  1. Install with the CLI (writes to `~/.agents/skills/`)
  2. Copy the result into the repo: `cp -r ~/.config/opencode/skills/<name> ~/dotfiles/opencode/.config/opencode/skills/`
  3. Alternatively, skip the CLI and write/copy the `SKILL.md` directly into the repo path

**When adding a slash command**:
- Place it under `opencode/.config/opencode/commands/<name>.md`
- If the command has complex logic, extract it into a skill and load that skill from the command

### Secrets & Safety
- **Never** commit secrets, API keys, tokens, or private SSH keys
- Sensitive per-machine values belong in `device-specific.sh` (not tracked)
- If a potential secret is found in tracked files, flag it immediately

---

## Commit Messages

Follow [Conventional Commits](https://www.conventionalcommits.org/) with a scope
matching the tool directory when relevant:

```
feat(nvim): add harpoon quick-nav keymaps
fix(zsh): correct PATH ordering for cargo binaries
chore(kanata): update thumb cluster layer
docs: improve AGENTS.md with shell style guidelines
```

Keep the subject line under 72 characters, imperative mood, no trailing period.
