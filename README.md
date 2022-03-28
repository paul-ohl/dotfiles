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

### General Linux

know your battery: `/sys/class/power_supply/BAT0/capacity`

### Nvim

Finish OpenDirectoryInTab, tab renaming

browse custom directories easily, improve on OpenDirectoryInTab -> create custom
pickers easily in Telescope

look into :h terminal-debug, or find a plugin that could do something similar

Replace tab rename plugin with lualine

Lazy loading in paq

create a 'window movement mode': hjkl to select windows, HJKL to move windows,
-=<> to increase/decrease width/height

Finish bootstrapping, everything must load on startup

if it ever gets useful: [Notifications](https://github.com/rcarriga/nvim-notify)

Edit a file from the terminal inside vim.

*help*:

```vimscript
:let $IN_NEOVIM = "yes"
:terminal
$ env | grep NEOVIM
IN_NEOVIM=yes
```

### Custom Scripts

improve getos: -d option to know the linux distribution used (use `lsb_release -is`)

notif: will select the right utility depending on the OS to put up a notification

updatr: check if all necessary software is installed and install it if not
