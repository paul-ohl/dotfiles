# AGENTS.md

## Overview
This is the configuration directory for Hyprland, a dynamic tiling Wayland compositor. The primary file is `hyprland.conf`, which defines the window manager's behavior, monitors, keybindings, autostart programs, and visual settings.

## Project Structure
- `hyprland.conf`: The main Hyprland configuration file.
- `TODO.md`: A list of pending tasks or planned configurations for this setup.

## Code Style Guidelines
- **Variables:** Defined using the `$` syntax with spaces around the equals sign (e.g., `$terminal = kitty`).
- **Directives:** Properties are typically assigned directly (e.g., `monitor=,preferred,auto,auto`) or using spaces for execution (e.g., `exec-once = ...`).
- **Comments:** Use `#` for line comments.
- **Sections:** Configurations are grouped visually using padded block comment headers (e.g., `### MONITORS ###`).

## Architecture Notes
- **Modularity:** While currently a monolithic file, the config supports splitting into multiple files using the `source = ...` directive (e.g., `source = ~/.config/hypr/myColors.conf`). If the configuration grows complex, new AI-assisted work should consider modularizing settings like keybindings, window rules, or animations into separate included files.
