# I WANT: plugins: git, zsh-autosuggestions, docker, docker-compose

###
### Settings
###

export PATH="$HOME/.local/bin:$PATH:$HOME/.local/scripts"
export EDITOR=nvim
export LESSHISTFILE='-' # Less doesn't save history

#colors enabling
autoload -U colors && colors
export CLICOLOR=1
export LS_COLORS=$LS_COLORS:'di=1;32:'

zstyle ':completion:*' menu select

# Set vi mode
set -o vi

# Keybindings
bindkey '^R' history-incremental-search-backward
bindkey '^H' backward-kill-word

# Setting locales, I know I shouldn't do it there
LANG="en_US.UTF-8"
LC_COLLATE="en_US.UTF-8"
LC_CTYPE="en_US.UTF-8"
LC_MESSAGES="en_US.UTF-8"
LC_MONETARY="fr_FR.UTF-8"
LC_NUMERIC="fr_FR.UTF-8"
LC_TIME="fr_FR.UTF-8"
LC_ALL="en_US.UTF-8"

# Change prompt
PS1="%1~ > "

###
### Aliases
###

alias pbcopy='wl-copy'
alias pbpaste='wl-paste'
alias open='xdg-open'
alias so='source $HOME/.zshrc'
alias weather='curl wttr.in'

alias dc='docker compose'
alias v='nvim'
alias e='nvim'
alias getssh='cat ~/.ssh/id_rsa.pub | pbcopy && echo "public ssh key copied"'

# DNF aliases
alias di='sudo dnf install'
alias ds='sudo dnf search'
alias du='sudo dnf update -y'

# Cargo aliases
alias c='cargo'
alias cwt='cargo watch -c -x "nextest run"'
alias ct='cargo nextest run'
alias cc='cargo clippy'

# systemd aliases
alias sss='sudo systemctl status'
alias ssr='sudo systemctl restart'
alias sst='sudo systemctl stop'

# git aliases
alias gcl='. gcl'
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

# quick folders
eval "alias $(grep -v "^#" "$HOME/.config/zsh/foldersrc" \
  | awk '{print $1 "=\"cd " $2 " && ls\" "}' \
  | tr "\"\n" "' ")"

# Load device-specific config
if ! [ -e "$HOME/.device-specific.sh" ]; then
  touch "$HOME/.device-specific.sh" 
fi
source "$HOME/.device-specific.sh"

###
### Tools integrations
###

# Yazi
function yy() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

# zsh syntax highlighting
zshsh_directory="$HOME/.local/git/zsh-syntax-highlighting"
if ! [ -e "$zshsh_directory/zsh-syntax-highlighting.zsh" ]; then
  mkdir -p "$zshsh_directory"
  git clone --depth 1 --recurse-submodules --shallow-submodules https://github.com/zsh-users/zsh-syntax-highlighting.git "$zshsh_directory"
fi
source "$zshsh_directory"/zsh-syntax-highlighting.zsh

# Cargo
source "$HOME/.cargo/env"

# pnpm
export PNPM_HOME="/home/pohl/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# vim: ts=2 sts=2 sw=2 et
