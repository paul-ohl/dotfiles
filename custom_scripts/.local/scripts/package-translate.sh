#!/bin/sh
# Date: 2022/06/24
# Description: A table associating packages in arch with packages in other
# distros

help() {
	echo "Usage: $0 [-h] [-d distro] package"
	echo "    -h: show this help"
	echo "    -d: the distro you want to translate to, select from"
	echo "        - arch"
	echo "        - debian"
	echo "        - ubuntu"
	exit 1
}

error() { printf "%s\n" "$1" >&2; exit 1; }

while getopts 'hd:' OPTION; do
    case "$OPTION" in
		h) help ;;
        d) distro="$OPTARG" ;;
        *) help ;;
    esac
done

echo "$@"
