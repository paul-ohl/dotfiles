# My dotfiles

Managed with GNU stow

## How to use

Each software is in it's own directory. Use stow to create the simlinks.

---

## Todo for my dotfiles

### stow Setup

Something to manage my favorite packages, updates and all, it's annoying
to have to install everything everytime I have an issue at 42, plus I want to
reset my mac. It will have to manage:
	- packages from brew (macos and 42 computers) or pacman (arch)
	- binaries from git repositories, npm and pip
	- plugins for vim
	- nerd fonts!

Manage favorite folders as well, should be able to customize it per machine

I will have to make a front end for vim, I'm sure it's going to be tons of fun.

notify when not used for over a week

### Xmonad

Just grab dt's config...

Keepassxc as a scratchpad

Software shortcuts: w for qutebrowser, p for keepass

window gaps ffs

### Alacritty

General configuration, check the bindings.

### Nvim

browse custom directories easily, improve on OpenDirectoryInTab -> create custom
pickers easily in Telescope

more convenient remaps for termdebug

if it ever gets useful: [Notifications](https://github.com/rcarriga/nvim-notify)

### Custom Scripts

improve getos: -d option to know the linux distribution used (use `lsb_release -is`)

notif: will select the right utility depending on the OS to put up a notification
