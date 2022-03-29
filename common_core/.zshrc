# Path stuff...
export PATH="$HOME/.brew/bin:/usr/local/sbin:$PATH:$HOME/.config/custom_scripts/:$HOME/.config/coc/extensions/coc-clangd-data/install/13.0.0/clangd_13.0.0/bin/"

# OS specific actions
OS=`getos`
if [ "$OS" = "LINUX" ]; then # Linux specific
	setxkbmap -option caps:escape > /dev/null

	# cool aliases
	alias ls='ls --color'
	alias pbcopy='xclip -selection clipboard'
	alias pbpaste='xclip -selection clipboard -o'
	alias bat='cat /sys/class/power_supply/BAT0/capacity /sys/class/power_supply/BAT0/status'
elif [ "$OS" = "OSX" ]; then # Macos specific
	# autocompletion
	if type brew &>/dev/null; then
		FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
		autoload -Uz compinit
		compinit
	fi

	# cool aliases
	alias parle='say -v Thomas'
fi

#colors enabling
autoload -U colors && colors
export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad

#Autocompletion
zstyle ':completion:*' menu select
zmodload zsh/complist

# Set vi mode
set -o vi

# Change prompt
PS1="%1~ > "

# Cool aliases
alias so='source $HOME/.zshrc'
alias vim='nvim'
alias vi='/usr/bin/vim'
alias norm='norminette . | grep -v OK'
alias la='ls -la'
alias l='ls -l'
alias getssh='cat ~/.ssh/id_rsa.pub | pbcopy && echo "public ssh key copied"'

# Makefile aliases
# alias make='make -j -Otarget'
alias m='make run'
alias mdb='make debug'
alias mf='make fclean'

# quick folders
# eval $(awk '{print "alias " $1 "=\"cd " $2 " && ls\" "}' $HOME/.config/custom_scripts/folders.cfg | tr "\"" "'")
eval "alias" $(jq -r ".folders | map(.shortcut + \"='cd \" + .path + \" && ls'\")" ~/dotfiles/config.tpl.json | tr -d '"[],')

# git aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gcl='git clone'
alias gp='git push'

# zsh syntax highlighting
source ~/.config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export LC_ALL=C
export EDITOR=nvim
export MAIL="paul.lv.ohl@gmail.com"
export CFGNVIM="$HOME/.config/nvim/init.vim"

# Load Homebrew config script
if [ -e "$HOME/.brewconfig.zsh" ]; then
	source $HOME/.brewconfig.zsh
fi
