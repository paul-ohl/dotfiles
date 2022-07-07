#!/bin/sh
# Date: 2022/06/24
# Description: Presents a fzf prompt to the user to switch taskwarrior context

context_list=$(task context list | tail +4 | awk '{print $1}' | grep -v write)
context_list="none\n${context_list}"
fzf_result=$(echo "$context_list" | fzf)

if ! [ "$fzf_result" = "" ]; then
	task context "$fzf_result"
fi
