# Agent Instructions for Dotfiles Repository

This repository contains Astro's dotfiles and NixOS configurations, managed primarily with GNU Stow and Nix flakes.

## 🛠 Build, Lint, and Test Commands

### NixOS System
- **Rebuild System**: `sudo nixos-rebuild switch --flake .#<hostname>`
  - Hostnames: `hornet` (Desktop/Nvidia), `cornifer` (Server), `knight` (Laptop).
- **Update Flake**: `nix flake update`
- **Garbage Collection**: `sudo nix-collect-garbage -d`

### Package Management
- **User Packages (non-NixOS)**: `nix profile install --impure --file nixos/user-packages.nix` (if applicable).
- **Check Flake**: `nix flake check`

### Formatting & Linting
- **Nix**: `alejandra .` (Primary) or `nixpkgs-fmt .`
- **Lua (Neovim)**: `stylua .` (Uses config in `neovim/.config/nvim/.stylua.toml`)
- **Shell Scripts**: `shellcheck <file>`
- **Rust**: `cargo fmt` and `cargo clippy`

### Testing
- **Rust**: `cargo test`
- **Rust (Continuous)**: `bacon test` (Background checker configured in `rust/.config/bacon/`)

## 🎨 Code Style Guidelines

### General Project Structure
- **Tool-based Directories**: Each tool has its own top-level directory (e.g., `neovim/`, `zsh/`, `kitty/`).
- **GNU Stow**: Configuration files are nested within these directories as they would appear in `$HOME` (e.g., `neovim/.config/nvim/init.lua`).
- **Deployment**: Use `stow <directory>` to symlink files to the home directory.

### Nix Style (nixos/)
- **Formatting**: Always use `alejandra`.
- **Modularity**: Split configurations into logical modules in `nixos/modules/` (e.g., `audio.nix`, `nvidia.nix`).
- **Inputs**: Use `pkgs-unstable` for cutting-edge software (defined in `flake.nix`).
- **Imports**: Prefer absolute-looking relative paths (e.g., `./modules/audio.nix`).
- **Naming**: Hostnames follow a Hollow Knight theme (`hornet`, `cornifer`, `knight`).

### Lua Style (neovim/)
- **Indentation**: 2 spaces (configured in `.stylua.toml`).
- **Quotes**: Prefer single quotes (`AutoPreferSingle`).
- **Modular Config**:
  - `init.lua` is the entry point.
  - Plugin configurations are located in `lua/plugins/`.
  - LSP configurations are in `lua/plugins/lsp/`.
  - Core settings in `options.lua`, keybindings in `keymaps.lua`.
- **Plugin Manager**: Uses `lazy.nvim`.

### Shell Style (zsh/)
- **Location**: Zsh config resides in `.config/zsh/`.
- **Entry point**: `.zprofile` in the home directory (stowed from `zsh/.zprofile`) sources the main config.
- **Variables**: Use `device-specific.sh` for environment-specific tweaks.

### Rust Style
- Follow standard Rust idioms.
- Use `clippy` for linting.
- Configuration for `bacon` and `cargo` is kept in the `rust/` directory.

## 🤖 Agent Workflow Protocols

### 1. Modifying Configurations
- Before changing a configuration, identify which tool directory it belongs to.
- Ensure you are editing the file in the dotfiles repository, NOT the symlink in `$HOME`.
- After modifying, if the change requires a system update, run the appropriate `nixos-rebuild` command.
- If the tool is managed by Stow, ensure you are in the root of the dotfiles repo when running `stow <dir>`.

### 2. Adding New Tools
- Create a new directory for the tool.
- Mimic the structure expected by `stow` (usually starting with `.config/`).
- Update `README.md` to include the new directory in the `stow` example command.
- Add relevant formatting/linting rules to this `AGENTS.md` file if a new language is introduced.

### 3. NixOS Module Development
- When adding a new module in `nixos/modules/`:
  - Ensure it is included in `nixos/flake.nix` for the relevant hosts.
  - Use `lib.mkIf` if the module should be optional or host-specific.
  - Prefer using `pkgs-unstable` for desktop applications and CLI tools to get the latest versions.

### 4. Neovim Plugin Configuration
- Add new plugins to `neovim/.config/nvim/lua/lazy-plugins.lua` or create a new file in `neovim/.config/nvim/lua/plugins/`.
- If a plugin requires specific LSP setup, modify `neovim/.config/nvim/lua/plugins/lsp/lspconfig.lua`.
- Always check `.stylua.toml` before and after editing Lua files.

### 5. Error Handling & Validation
- In Nix, prefer descriptive error messages if using `assert` or `builtins.throw`.
- In Lua, use `pcall` when requiring optional modules or plugins that might not be loaded.
- ALWAYS run `alejandra` after editing Nix files to ensure consistency.
- ALWAYS run `stylua` after editing Neovim configuration.

### 6. Secrets & Safety
- **NEVER** commit secrets, API keys, or private SSH keys.
- Check `.gitignore` files in each subdirectory.
- Use `device-specific.sh` or NixOS `sops-nix`/`agenix` patterns (though not currently seen, assume they should be externalized).
- If you find a potential security risk, inform the user immediately.

## 🧩 External Rules
- No `.cursorrules` or `.github/copilot-instructions.md` found.
- Default to the styles defined in this document and existing code patterns.
- If a directory contains its own `.editorconfig` or linting config, those take precedence for that directory.

## 📝 Commit Messages
- Follow conventional commits if possible (e.g., `feat(nvim): add new plugin`, `fix(nixos): correct audio driver`).
- Keep descriptions concise and focused on the "why".

---
*This file is a living document for AI agents to maintain consistency in the Hallownest dotfiles.*
