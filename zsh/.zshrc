###
### Settings
###

export PATH="$HOME/.local/bin:$PATH:$HOME/bin:$HOME/.local/scripts"
export EDITOR=nvim
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

alias pbcopy='wl-copy'
alias pbpaste='wl-paste'
alias open='xdg-open'
alias so='source $HOME/.zshrc'
alias weather='curl wttr.in'

alias dc='docker compose'
alias v='nvim'
alias e='nvim'
alias p='pnpm'
alias t='tmux-open'
alias ports='sudo ss -tulnp'
alias s='kitten ssh'

# Cargo aliases
alias c='cargo'
alias cwt='cargo watch -c -x "clippy --all-targets" -x "nextest run"'
alias ct='cargo nextest run'
alias cc='cargo clippy'

# systemd aliases
alias sss='sudo systemctl status'
alias ssr='sudo systemctl restart'
alias sst='sudo systemctl stop'
alias k='systemctl --user restart kanata.service'

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
if command -v eza &> /dev/null; then
  alias ls='eza --icons -F'
  alias la='eza -la --icons -F'
  alias l='eza -lF --icons'
  alias ll='eza -lF --icons'
  alias tree='eza -TF --icons'
else
  alias ls='ls --color'
  alias la='ls -lAh'
  alias l='ls -lh'
  alias ll='ls -lh'
fi
if command -v bat &> /dev/null; then
  alias cat='bat'
fi

# Yt-dlp aliases
alias zik-dl='yt-dlp -f bestaudio --extract-audio --audio-format mp3 --audio-quality 0 -o "%(uploader)s - %(title)s.%(ext)s" --embed-thumbnail --add-metadata'

# LazyDocker
alias lzd='docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock -v /yourpath/config:/.config/jesseduffield/lazydocker lazyteam/lazydocker'

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
# zinit snippet OMZP::ssh
# zinit snippet OMZP::rust

# Load completions
autoload -U compinit && compinit
if [[ ":$FPATH:" != *":/home/pohl/.zsh/completions:"* ]]; then
  export FPATH="/home/pohl/.zsh/completions:$FPATH";
fi

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

# Yazi
function yy() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

# Cargo
source "$HOME/.cargo/env"

# pnpm
export PNPM_HOME="/home/pohl/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Deno
# If the path exists, load the Deno environment
if [ -e "$HOME/.deno/env" ]; then
  . "/home/pohl/.deno/env"
fi

# vim: ts=2 sts=2 sw=2 et
