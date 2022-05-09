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
		elif [ "$installer" = "brew" ]; then
			brew install $to_install
		else
			error "Unrecognised installer: $installer"
		fi
	fi
}

install_installer () {
	if [ "$os" = "OSX" ]; then
		installer="brew"
	else
		echo "select installer: "
		echo "1. brew (42 linux)"
		echo "2. paru (arch linux)"
		read -r -d '' -sn1 installer
		case "$installer" in
			"1") installer="brew";;
			"2") installer="paru";;
			*) error "This option does not exist";;
		esac
	fi
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
	elif [ "$installer" = "brew" ]; then
		if [[ $(command -v brew) ]]; then
			echo "brew is already installed, skipping..."
		else
			echo "Installing homebrew, the missing home package manager"
			# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
			error "You're probably at 42, go fetch the command to install brew"
		fi
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
			# TODO: Write your custom executions here!
			"custom_scripts") mkdir "$HOME/.local/" ;;
		esac
		stow "$program"
	done
}

install() {
	install_installer
	install_package dialog
	select_software
	stowicism
	error "Now you need to install packages for the software selected"
}

install
