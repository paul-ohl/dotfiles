# My dotfiles

Managed with GNU stow

## How to use

Each software is in their own directory.
Use [stow](https://www.gnu.org/software/stow/) to create the simlinks.

The `setup.sh` script is tailored to my config, use at your own risk.
(But it should work pretty well)

---

## Todo for my dotfiles

### stow Setup
Ansible setup
- packages from brew (macOS and 42 computers) or pacman (arch)
- binaries from git repositories, npm and pip
- plugins for vim
- nerd fonts!

Manage favorite folders as well, should be able to customize it per machine

I will have to make a front end for vim, I'm sure it's going to be tons of fun.

notify when not used for over a week

### Xmonad

Keepassxc as a scratchpad

Software shortcuts: w for qutebrowser, p for keepass

window gaps ffs

### Alacritty

General configuration, check the bindings.

### Nvim

Look into [überzug](https://github.com/seebye/ueberzug) and this
[Telescope picker](https://github.com/nvim-telescope/telescope-media-files.nvim)
for linux.

browse custom directories easily, improve on OpenDirectoryInTab -> create custom
pickers easily in Telescope

more convenient remaps for termdebug

if it ever gets useful: [Notifications](https://github.com/rcarriga/nvim-notify)

### Custom Scripts

notif: will select the right utility depending on the OS to put up a notification
