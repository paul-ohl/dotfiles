# My dotfiles

Managed with GNU stow

## Installation

Install with GNU stow:

Clone this repository anywhere (I clone it in `~/dotfiles/`), cd into it,
and `gnu stow *`!

---

## Todo for my dotfiles

## Even more general

Something to manage my favorite packages, updates and all, it's annoying
to have to install everything everytime I have an issue at 42, plus I want to
reset my mac. It will have to manage:
	- packages from brew (macos and 42 computers) or pacman (arch)
	- plugins for vim
	- nerd fonts!

It needs to have minimal dependencies, as little as possible.

I will have to make a front end for vim, I'm sure it's going to be tons of fun.

notify when not used for over a week

### General Linux

Go back to awk for folders, but find a more elegant way of doing it, folder.cfg
is trash.

find how to have default apps for stuff like pdf, images, etc.

configure zathura using Luke's config

### Alacritty

[make it swallow](https://www.youtube.com/watch?v=mBNLzHcUtTo)

General configuration, check the bindings.

### Nvim

browse custom directories easily, improve on OpenDirectoryInTab -> create custom
pickers easily in Telescope

look into :h terminal-debug, or find a plugin that could do something similar

Finish bootstrapping, everything must load on startup

if it ever gets useful: [Notifications](https://github.com/rcarriga/nvim-notify)

### Custom Scripts

improve getos: -d option to know the linux distribution used (use `lsb_release -is`)

notif: will select the right utility depending on the OS to put up a notification

updatr: check if all necessary software is installed and install it if not
