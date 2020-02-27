#!/bin/sh
#
# Shows installed packages sorted by size
#
# Copyright (C) 2020 Cristian Ariza
#
# See LICENSE file for details

usage="crzutils v0.0.1
Copyright (C) 2020 Cristian Ariza

Usage: $(basename "$0") [-dh]
Shows installed packages.

	-d  print disk usage
	-h  print sizes in human readable form"

awkcmd='function human(x,u){
	if(x > 1073741824 ) { printf "%i%s",x/1000000000,"T" }
	else if(x > 1048576) { printf "%i%s",x/1000000,"G" }
	else if(x > 1024) { printf "%i%s",x/1000,"M" }
	else { printf "%i%s",x,"K" }
}

{ print human($1),$2; }'

disk=false
human=false
pkg=
while getopts "hd" c; do
	case "$c" in
	h) human=true ;;
	d) disk=true ;;
	*)
		printf '%s\n' "$usage"
		exit 1
		;;
	esac
done
shift "$((OPTIND - 1))"

if [ "$#" -gt 0 ]; then
	pkg="$1" && shift
fi

case "$disk" in
false)
	dpkg --get-selections | awk '
		/deinstall/ {}
		{ gsub(/:*/,"",$1); print $1; }'	
	;;
true)
	cmd="dpkg-query -Wf '\${Installed-Size}\t\${Package}\n'"

	case "$pkg" in
	"") cmd="$cmd | sort -n" ;;
	*) cmd="$cmd | grep $pkg" ;;
	esac

	if "$human"; then
		cmd="$cmd | awk '$awkcmd'" ;;
	fi

	eval "$cmd"
	;;
esac

