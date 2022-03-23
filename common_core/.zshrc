# Path stuff...
export PATH="$HOME/.brew/bin:/usr/local/sbin:$PATH:$HOME/.config/custom_scripts/:$HOME/.config/coc/extensions/coc-clangd-data/install/13.0.0/clangd_13.0.0/bin/"

# OS specific actions
OS=`getos`
if [ "$OS" = "LINUX" ]; then # Linux specific
	setxkbmap -option caps:escape > /dev/null

	# cool aliases
	alias getssh='cat ~/.ssh/id_rsa.pub | xclip -selection clipboard && echo "public ssh key copied"'
	alias ls='ls --color'
elif [ "$OS" = "OSX" ]; then # Macos specific
	# autocompletion
	if type brew &>/dev/null; then
		FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
		autoload -Uz compinit
		compinit
	fi

	# cool alias
	alias getssh='cat ~/.ssh/id_rsa.pub | pbcopy && echo "public ssh key copied"'
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

# Makefile aliases
# alias make='make -j -Otarget'
alias m='make run'
alias mdb='make debug'
alias mf='make fclean'

# quick folders
eval $(awk '{print "alias " $1 "=\"cd " $2 " && ls\" "}' $HOME/.config/custom_scripts/folders.cfg | tr "\"" "'")

# git aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gcl='git clone'
alias gp='git push'

# zsh syntax highlighting
source ~/.config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# auto install vim plug if necessary
if ! [ -e "${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/plug.vim" ]; then
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi

export LC_ALL=C
export EDITOR=nvim
export MAIL="pohl@student.42.fr"
export CFGNVIM="$HOME/.config/nvim/init.vim"

# Load Homebrew config script
if [ -e "$HOME/.brewconfig.zsh" ]; then
	source $HOME/.brewconfig.zsh
fi
