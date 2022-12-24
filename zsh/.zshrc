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
	alias ls='ls --color'
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
export LSCOLORS=Exfxcxdxbxegedabagacad

#Autocompletion
#zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|?=** r:|?=**'
zmodload zsh/complist

# Set vi mode
set -o vi

# Change prompt
PS1="%1~ > "

# Cool aliases
alias so='source $HOME/.zshrc'
alias vi='/usr/bin/vim'
alias vim='nvim'
alias la='ls -lA'
alias l='ls -l'
alias ll='ls -l'
alias getssh='cat ~/.ssh/id_rsa.pub | pbcopy && echo "public ssh key copied"'
alias wiki='nvim -c ":VimwikiIndex"'
alias w='nvim -c ":VimwikiIndex"'
alias flashkbd='$HOME/Documents/dev/qmk-fast-flasher/qmk_fast_flasher.sh'

# Makefile aliases
# alias make='make -j -Otarget'
alias m='make run'
alias mdb='make debug'
alias mf='make fclean'

# quick folders
eval "alias $(grep -v "^#" $HOME/.config/zsh/foldersrc \
		| awk '{print $1 "=\"cd " $2 " && ls\" "}' \
		| tr "\"\n" "' ")"

# git aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gcl='git clone'
alias gp='git push'

# zsh syntax highlighting
source ~/.local/git/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# General env
export EDITOR=nvim
export MAIL="paul.lv.ohl@gmail.com"
export CFGNVIM="$HOME/.config/nvim/init.vim"
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
