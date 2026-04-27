# My neovim config!

## Introduction

This config was built from
[nvim-kickstart](https://github.com/dam9000/kickstart-modular.nvim)
(Specifically the modular version).

I think it's an amazing starting point for beginners and experienced users
alike! I strongly recommend.

## Installation

### Install Neovim

Kickstart.nvim targets *only* the latest
['stable'](https://github.com/neovim/neovim/releases/tag/stable) and latest
['nightly'](https://github.com/neovim/neovim/releases/tag/nightly) of Neovim.
If you are experiencing issues, please make sure you have the latest versions.

### Install External Dependencies

For this config you'll need:
- Basic utils: `git`, `make`, `unzip`, C Compiler (`gcc`)
- [ripgrep](https://github.com/BurntSushi/ripgrep#installation)
- A [Nerd Font](https://www.nerdfonts.com/)
  - I personnaly use
    [Mononoki](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Mononoki.zip)
- Language Setup:
  - If you want to write Typescript, you need `npm`
  - If you want to write Golang, you will need `go`
  - etc.

### Post Installation

Start Neovim

```sh
nvim
```

That's it! Lazy will install all the plugins you have. Use `:Lazy` to view
current plugin status. Hit `q` to close the window.

Read through the `init.lua` file in your configuration folder for more
information about extending and exploring Neovim.

## Usage

My neovim config is tailored to my use, so of course almost nothing is standard
(except maybe hjkl).

### File structure:

```
 ./
├──  init.lua  <- The entry point, contains nothing but imports
└──  lua/
   ├──  bootstrap.lua <- To bootstrap lazy.nvim, you'll never need to change this
   ├──  custom/ <- My custom functions, see `## Custom functions`
   ├──  keymaps.lua <- All the *general* keymaps are stored here, but not the plugin-specific ones.
   ├──  options.lua <- All the nvim options are set here
   ├──  lazy-plugins.lua <- Lazy configuration, plugin imports and one-line plugins
   └──  plugins/ <- All the plugins that need more than one line to configure are stored here
```

Generally, take a look around and it should be easy to customize things to your
liking.

## Custom functions

I have a few custom functions for stuff that doesn't mandate installing a
plugin.

### [Development tools](./lua/custom/development_tools.lua)

This comes from [TJ's config](https://github.com/tjdevries/config.nvim)

There are 3 functions in there:

#### `P`: prints debug information about anything you pass into it.

example (in the command line):
```
:lua Thing={'one', 'two'}
:lua print(Thing)         => This will output: 'table: 0x7f82a0aa95c0'
:lua P(Thing)             => This will output: '{ "one", "two" }'
```

#### `RELOAD`: reloads a module

When you are developing a neovim module, it is incredibly annoying to have to
quit and restart neovim every time in order to empty the cache and allow the
plugin to be reloaded. This function does it for you.

But you generally won't need to directly use this function because of the next one:

#### `R`: reloads and requires a module

`R` allows you to automatically empty the cache for that module, and that
require it in one single function. This allows you to save a lot of time when
developping a plugin.

### [Go to Error or Hint](./lua/custom/goto_error_then_hint.lua)

This plugin provides a function that is meant to be used in a
[keymap](./lua/keymaps.lua). What it does is when you want to go to a
diagnostic in the file, it will first select the error messages, and only when
there are no errors left in the file, the warnings.

### [Marp](./lua/custom/marp.lua)

Dependency: [marp-cli](https://github.com/marp-team/marp-cli)

This is under development at the moment, but what it does is launch a marp
server and open the current file in a new firefox window.

`StartMarp`: Starts the server and opens the window
`StopMarp`: Stops the server
