#!/bin/bash
# Date: 2024/01/30
# Description: This is a regular cd, except it renames the pane in zellij
# This is a function, because otherwise the caller's pwd doesn't change

# Set to anything other than `true` to toggle
CRZ_PWD=true
CRZ_GIT=false

cd_rename_zellij() {
	if ! command -v zellij &>/dev/null || [ "$#" -gt 1 ]; then
		cd "$@" || return
		return
	fi

	cd "$@" || return

	zellij_pane_name=""
	if [ "$CRZ_PWD" = "true" ]; then
		zellij_pane_name="$zellij_pane_name${PWD/\/home\/pohl/~}"
	fi

	if [ "$CRZ_GIT" = "true" ]; then
		git_branch=$(git branch --show-current 2>/dev/null)

		if ! [ "$zellij_pane_name" = "" ] && ! [ "$git_branch" = "" ]; then
			zellij_pane_name="$zellij_pane_name - "
		fi
		if ! [ "$git_branch" = "" ]; then
			zellij_pane_name="${zellij_pane_name}B: $git_branch"
			# zellij_pane_name="${zellij_pane_name}: $git_branch" # Once this is supported
		fi
	fi
	zellij action rename-pane "$zellij_pane_name"
}
