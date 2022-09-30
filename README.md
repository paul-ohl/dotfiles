# My dotfiles

Managed with GNU stow

## How to use

Each software is in their own directory.
Use [stow](https://www.gnu.org/software/stow/) to create the simlinks.

The `setup.sh` script is tailored to my config, use at your own risk.
(But it should work pretty well)

---

## Todo for my dotfiles

### Nvim

[Hydra](https://github.com/anuvyklack/hydra.nvim)

Use ccls instead of clangd? Would have to manage it myself instead of with mason

### Linux general

display a warning to turn off speakers before computer shutdown.
`zenity --warning --text="Turn off the speakers"`

### Custom Scripts

notif: will select the right utility depending on the OS to put up a notification
