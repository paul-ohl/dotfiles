###
### Settings
###

export PATH="$HOME/.local/bin:$PATH:$HOME/.local/scripts"
export LESSHISTFILE='-' # Less doesn't save history

#colors enabling
autoload -U colors && colors
export CLICOLOR=1
export LS_COLORS=$LS_COLORS:'di=1;32:'

# zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Set vi mode
set -o vi

# Keybindings
bindkey '^R' history-incremental-search-backward
bindkey '^H' backward-kill-word

# Change prompt: The hostname and the current directory
PS1="%m:%1~ > "

# Setup cross-session history
HISTSIZE=5000
HISTFILE=~/.local/share/zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

###
### Aliases
###

alias so='source $HOME/.zshrc'
alias p='pnpm'

alias dc='docker compose'
alias v='vim'
alias e='vim'
alias ports='sudo ss -tulnp'

# systemd aliases
alias sss='sudo systemctl status'
alias ssr='sudo systemctl restart'
alias sst='sudo systemctl stop'

# git aliases
alias lg='lazygit'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gck='git checkout'
alias gb='git branch'
alias gp='git push'
alias gl='git pull'
alias glog='git log --oneline --decorate --graph'
alias gloga='git log --oneline --decorate --graph --all'
alias gr='git rebase'
alias gri='git rebase --interactive'
alias g-='git switch -'

# aliases depending on Rust tools
if command -v exa &> /dev/null; then
  alias ls='exa -F --icons'
  alias la='exa -Fla --icons'
  alias l='exa -lF --icons'
  alias ll='exa -Fl --icons'
  alias tree='exa -FT --icons'
else
  alias ls='ls --color'
  alias la='ls -lAh'
  alias l='ls -lh'
  alias ll='ls -lh'
fi
if command -v bat &> /dev/null; then
  alias cat='bat'
fi

###
### Custom utils
###

# Load device-specific config
if ! [ -e "$HOME/.device-specific.sh" ]; then
  touch "$HOME/.device-specific.sh" 
fi
source "$HOME/.device-specific.sh"

###
### Plugins
###

# Zinit bootstrapping
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [[ ! -d "$ZINIT_HOME" ]]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

zinit light zsh-users/zsh-syntax-highlighting

zinit light zsh-users/zsh-completions

# Snippets
zinit snippet OMZP::sudo

# Load completions
autoload -U compinit && compinit

zinit cdreplay -q

###
### Tools integrations
###

# fzf
if command -v fzf &> /dev/null; then
  eval "$(fzf --zsh)"
else
  echo "fzf not found, skipping integration"
fi

# vim: ts=2 sts=2 sw=2 et
