#!/bin/sh
# Date: 2024/04/25
# Description: Select the keyboard input file for kmonad

destination_link='/home/pohl/.config/kmonad/kbd-input'

if ! command -v fzf 1> /dev/null 2> /dev/null; then
	echo "Install fzf for this script to work"
	exit 1
fi

answer=$(/bin/ls /dev/input/by-path/ | grep "k" | fzf)

if [ -z "$answer" ]; then
	answer=$(/bin/ls /dev/input/by-path/ | fzf)
fi

if [ -n "$answer" ]; then
	if [ -e "$destination_link" ]; then
		rm "$destination_link"
	fi
	ln -s "/dev/input/by-path/$answer" "$destination_link" && echo "Linked to $destination_link"

	echo "Want to reload systemctl?"
	printf "[y/n]: "
	read -n1 user_confirmation
	echo ""
	user_confirmation=$(echo "$user_confirmation" | tr '[:upper:]' '[:lower:]')
	if [ "$user_confirmation" = 'y' ]; then
		echo "Reloading"
		sudo systemctl restart kmonad
		sleep 2
		sudo systemctl status kmonad
	fi
else
	echo "No input given!"
fi

