#!/bin/bash
# Date: 2022/04/08
# Description: Install my stow config

# Variables
export os=""
export selected_software=""

error() { printf "%s\n" "$1" >&2; exit 1; }

detect_os () {
	case "$OSTYPE" in
		"linux-gnu"*) os="LINUX" ;;
		"darwin"*) os="OSX" ;;
		*) error "Could not properly detect OS: $OSTYPE" ;;
	esac
	if [ "$os" = "LINUX" ]; then
		installer="error"
		while [ "$installer" = "error" ]; do
			echo "select your distro: "
			echo "1. arch linux"
			echo "2. ubuntu"
			echo "3. debian"
			echo "4. kali linux (you're definitely a hacker)"
			read -r -d '' -sn1 installer
			case "$installer" in
				"1") installer="paru";;
				"2") installer="yay";;
				"3") installer="apt";;
				"4") error "Haha, nerd";;
				*) echo "This option does not exist"
					installer="error"
					;;
			esac
		done
	fi
}

install_package () {
	to_install=()
	for package in "$@"; do
		case "$package" in
			'nvim') to_install+=("neovim") ;;
			'openssh') ;;
			*) to_install+=("$package") ;;
		esac
		
		
	done
	if ! [ ${#to_install[@]} = 0 ]; then
		if [ "$installer" = "paru" ]; then
			paru -S "${to_install[@]}"
		elif [ "$installer" = "yay" ]; then
			yay -S "${to_install[@]}"
		elif [ "$installer" = "brew" ]; then
			brew install "${to_install[@]}"
		elif [ "$installer" = "apt" ]; then
			sudo apt install "${to_install[@]}"
		else
			error "Unrecognised installer: $installer"
		fi
	fi
}

install_installer () {
	if [ "$os" == "OSX" ]; then
		installer="brew"
		if [[ $(command -v brew) ]]; then
			echo "brew is already installed, skipping..."
		else
			echo "Installing homebrew, the missing home package manager"
			/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
		fi
	fi
	echo "Installing pacapt for easier commands on multiple OS"
	sudo wget -O /usr/local/bin/pacapt https://github.com/icy/pacapt/raw/ng/pacapt > /dev/null
	sudo chmod 755 /usr/local/bin/pacapt > /dev/null
	echo "===================== Updating ======================"
	pacapt -Syu
}

setup_github () {
	install_package git openssh
	if ! [ -e "$HOME/.ssh/id_rsa" ]; then
		ssh-keygen
	fi
	echo "ssh public key will be copied to your clipboard, paste it in github"
	read -r -d '' -sn1
	if [ "$os" = "LINUX" ]; then
		xclip -selection c < "$HOME/.ssh/id_rsa.pub"
		xdg-open "https://github.com/settings/keys"
	fi
	echo "Press any key to continue."
	read -r -d '' -sn1
}

select_software () {
	program_list=()
	index=0
	for program in */; do
		program=${program/\//}
		status="on"
		index=$((index + 1))
		program_list+=("$program")
		program_list+=("$index")	
		program_list+=("$status")	
	done
	selected_software=$(dialog --checklist 'checklist' 20 70 50 \
		"${program_list[@]}" \
		3>&1 1>&2 2>&3 3>&1) || error "cancelled by user"
	clear
}

stowicism() {
	install_package stow
	stow -D ./*glob*
	for program in $selected_software; do
		case "$program" in
			"alacritty") install_package alacritty;;
			"custom_scripts") mkdir -p "$HOME/.local/" ;;
			"neovim")
				install_package neovim python3 python3-pip ripgrep bear
				python3 -m pip install --user --upgrade pynvim
				nvim --headless
				;;
			"picom") install_package picom;;
			"qutebrowser") install_package qutebrowser;;
			"xmonad") install_package xmonad xmonad-contrib;;
			"zathura") install_package zathura;;
			"zsh")
				install_package zsh
				echo "Change default shell to zsh? (yn)"
				read -r -d '' -sn1 change_shell
				if [ "$change_shell" = "y" ]; then
					chsh -s /usr/bin/zsh
				fi
				;;
		esac
		stow "$program"
	done
}

install() {
	detect_os
	install_installer
	if ! [ -e "$HOME/dotfiles/" ]; then
		setup_github
		git clone git@github.com:paul-ohl/dotfiles.git "#HOME/dotfiles"
	fi
	(cd "$HOME/dotfiles/" || error "Could not access $HOME/dotfiles/ directory"
	install_package dialog
	select_software
	stowicism)
}

install
