# My dotfiles

Managed with GNU stow

## Installation

Install with GNU stow:

Clone this repository anywhere (I clone it in `~/dotfiles/`), cd into it,
and `gnu stow *`!

---

## Todo for my dotfiles

### General Linux

### Nvim

[Netrw](https://neovim.io/doc/user/pi_netrw.html) or I'd like to browse custom
directories easily.

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


/sys/class/power_supply/BAT0/capacity
