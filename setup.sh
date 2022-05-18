#!/bin/bash
# Date: 2022/04/08
# Description: Install my stow config

error() { printf "%s\n" "$1" >&2; exit 1; }

# Detect OS
case "$OSTYPE" in
	"linux-gnu"*) os="LINUX" ;;
	"darwin"*) os="OSX" ;;
	*) error "Could not properly detect OS: $OSTYPE" ;;
esac

install_package () {
	to_install=''
	for package in "$@"; do
		if ! [[ $(command -v "$package") ]]; then
			to_install="$to_install $package"
		fi
	done
	if ! [ "$to_install" = "" ]; then
		if [ "$installer" = "paru" ]; then
			paru -S $to_install
		elif [ "$installer" = "yay" ]; then
			yay -S $to_install
		elif [ "$installer" = "brew" ]; then
			brew install $to_install
		elif [ "$installer" = "apt" ]; then
			sudo apt install $to_install
		else
			error "Unrecognised installer: $installer"
		fi
	fi
}

install_installer () {
	echo "select installer: "
	echo "1. brew (macos)"
	echo "2. paru (regular arch linux)"
	echo "3. yay  (42)"
	echo "4. apt  (debian)"
	read -r -d '' -sn1 installer
	case "$installer" in
		"1") installer="brew";;
		"2") installer="paru";;
		"3") installer="yay";;
		"4") installer="apt";;
		*) error "This option does not exist";;
	esac
	if [ "$installer" = "paru" ]; then
		if [[ $(command -v paru) ]]; then
			echo "paru is already installed, skipping..."
		else
			echo "Installing paru, an AUR helper"
			sudo pacman -S --needed base-devel
			mkdir -p ~/.local/git/
			git clone https://aur.archlinux.org/paru.git ~/.local/git/paru
			(cd ~/.local/git/paru || error "cd problem"; makepkg -si)
		fi
		paru
	elif [ "$installer" = "brew" ]; then
		if [[ $(command -v brew) ]]; then
			echo "brew is already installed, skipping..."
		else
			echo "Installing homebrew, the missing home package manager"
			/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
		fi
		brew update && brew upgrade
	elif [ "$installer" = "yay" ]; then
		yay -Syu
	elif [ "$installer" = "apt" ]; then
		sudo apt update && sudo apt upgrade
	else
		error "Unrecognised installer: $installer"
	fi
}

select_software () {
	program_list=''
	index=0
	for program in */; do
		program=${program/\//}
		status="on"
		index=$((index + 1))
		program_list="$program_list $program $index $status"
	done
	selected_software=$(dialog --checklist 'checklist' 20 70 50 \
		$program_list \
		3>&1 1>&2 2>&3 3>&1) || error "cancelled by user"
	clear
}

stowicism() {
	install_package stow
	stow -D */
	for program in "$selected_software"; do
		case "$program" in
			"alacritty") install_package alacritty;;
			"custom_scripts") mkdir -p "$HOME/.local/" ;;
			"neovim")
				install_package neovim python3 python3-pip ripgrep
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
		stow $program
	done
}

install() {
	install_installer
	install_package dialog
	select_software
	stowicism
}

install
