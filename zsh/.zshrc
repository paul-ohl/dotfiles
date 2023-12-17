# Path stuff...
export PATH="$HOME/.local/bin:$PATH:$HOME/.local/scripts/"
# Rust
source "$HOME/.cargo/env"

# OS specific actions
OS=`getos`
if [ "$OS" = "LINUX" ]; then # Linux specific
	# setxkbmap -option caps:escape > /dev/null
	# setxkbmap -option 'caps:ctrl_modifier'
	# xcape -e 'Caps_Lock=Escape' -t 100

	# cool aliases
	alias pbcopy='xclip -selection clipboard'
	alias pbpaste='xclip -selection clipboard -o'
	alias open='xdg-open'
	# alias bat='cat /sys/class/power_supply/BAT0/capacity /sys/class/power_supply/BAT0/status'
	# Swallowing aliases
	if [ -e "$HOME/.local/bin/devour" ]; then
		alias sxiv='devour sxiv'
		alias zathura='devour zathura'
		alias firefox='devour firefox'
		alias xdg-open='devour xdg-open'
	fi

elif [ "$OS" = "OSX" ]; then # Macos specific
	# autocompletion
	if type brew &>/dev/null; then
		FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
		autoload -Uz compinit
		compinit
	fi

	# cool aliases
	alias dfh='df -h | grep disk1s5'
	alias parle='say -v Thomas'
fi

#colors enabling
autoload -U colors && colors
export CLICOLOR=1
export LS_COLORS=$LS_COLORS:'di=1;32:'

#Autocompletion
zstyle ':completion:*' menu select
#zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|?=** r:|?=**'
zmodload zsh/complist

# Set vi mode
set -o vi

# Cool aliases
alias so='source $HOME/.zshrc'
alias vi='/usr/bin/vim'
alias vim='nvim'
alias v='nvim'
alias getssh='cat ~/.ssh/id_rsa.pub | pbcopy && echo "public ssh key copied"'
alias weather='curl wttr.in'

# systemd aliases
alias ssg='sudo systemctl start'
alias sss='sudo systemctl status'
alias ssr='sudo systemctl restart'
alias sst='sudo systemctl stop'

# aliases depending on Rust tools
if command -v exa &> /dev/null; then
	alias ls='exa -F --icons'
	alias la='exa -Fla --icons'
	alias l='exa -lF --icons'
	alias ll='exa -Fl --icons'
	alias tree='exa -FT --icons'
else
	alias la='ls -lA'
	alias l='ls -l'
	alias ll='ls -l'
fi
if command -v bat &> /dev/null; then
	alias cat='bat'
fi

# quick folders
eval "alias $(grep -v "^#" $HOME/.config/zsh/foldersrc \
		| awk '{print $1 "=\"cd " $2 " && ls\" "}' \
		| tr "\"\n" "' ")"

# git aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gck='git checkout'
alias gb='git branch'
alias gcl='git clone'
alias gp='git push'
alias gl='git pull'
alias glog='git log --oneline --decorate --graph'
alias gloga='git log --oneline --decorate --graph --all'
alias gr='git rebase'
alias gri='git rebase --interactive'
alias g-='git switch -'

# mkcd action
mkcd() {
	if [ "$#" -gt 1 ]; then
		mkdir "$@"
	else
		mkdir "$@" && cd "$@"
	fi
}
alias mkdir='mkcd'

# zsh syntax highlighting
zshsh_directory="$HOME/.local/git/zsh-syntax-highlighting"
if ! [ -e "$zshsh_directory/zsh-syntax-highlighting.zsh" ]; then
	mkdir -p "$zshsh_directory"
	git clone --depth 1 --recurse-submodules --shallow-submodules https://github.com/zsh-users/zsh-syntax-highlighting.git "$zshsh_directory"
fi
source "$zshsh_directory"/zsh-syntax-highlighting.zsh

# General env
export EDITOR=nvim
export MAIL="paul.lv.ohl@gmail.com"
export LESSHISTFILE='-' # Less doesn't save history

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

# Load device-specific config
if [ -e "$HOME/.device-specific.sh" ]; then
	source "$HOME/.device-specific.sh"
else
	touch "$HOME/.device-specific.sh" 
fi

bindkey '^R' history-incremental-search-backward
