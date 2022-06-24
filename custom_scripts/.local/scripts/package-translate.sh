#!/bin/bash
# Date: 2022/06/24
# Description: A table associating packages in arch with packages in other
# distros

export table_path="$HOME/Documents/translation-table.csv"
if ! [ -e "$table_path" ]; then
	error "Can't find the translation table"
fi

table_header=$(head -1 "$table_path")
IFS=', ' read -r -a headers_array <<< "$table_header"
table_elements=$(tail -n +2 "$table_path")

help() {
	echo "Usage: $0 [-hf] [-d distro] package"
	echo "    -h: show this help"
	echo "    -F: throw error if package conversion fails, skip otherwise"
	echo "    -f: the distro you want to translate from"
	echo "    -t: the distro you want to translate to"
	echo "    Select from:"
	for distro in "${headers_array[@]}"; do
		echo "    - $distro"
	done
	exit 1
}

error() { printf "%s\n" "$1" >&2; exit 1; }

if [ "$#" -lt 5 ]; then
	help
	error
fi

while getopts 'hFf:t:' OPTION; do
    case "$OPTION" in
		h) help ;;
		F) fail="true"
			# shift 1;
			;;
        f) distro_from="$OPTARG"
			# shift 2;
			;;
        t) distro_to="$OPTARG"
			# shift 2;
			;;
        *) help ;;
    esac
done

if [ "$fail" = "true" ]; then
	shift
fi

check_distro_valid () {
	for distro in "${headers_array[@]}"; do
		if [ "$distro" = "$1" ]; then
			return
		fi
	done
	error "$1 is not an available distro"
}

check_distro_valid "$distro_from"
check_distro_valid "$distro_to"

find_index () {
	value="$1"

	for i in "${!headers_array[@]}"; do
		if [[ "${headers_array[$i]}" = "${value}" ]]; then
			echo "${i}";
		fi
	done
}

find_index "$distro_from"
find_index "$distro_to"

for package in "$@"; do
	echo "$package"
done
