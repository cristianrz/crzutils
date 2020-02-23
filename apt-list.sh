#!/bin/sh
#
# Shows installed packages sorted by size
#
# Copyright (C) 2020 Cristian Ariza
#
# See LICENSE file for details

usage="crzutils v0.0.1
Copyright (C) 2020 Cristian Ariza

Usage: $(basename "$0") [OPTION]

Shows installed packages.

	-h  display this help and exit
	-d  print disk usage"

awkcmd='function human(x,u){
	if(x > 1073741824 ) { printf "%i%s",x/1000000000,"T" }
	else if(x > 1048576) { printf "%i%s",x/1000000,"G" }
	else if(x > 1024) { printf "%i%s",x/1000,"M" }
	else { printf "%i%s",x,"K" }
}

{ print human($1),$2; }'

human=false
disk=false
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

case "$#" in
0) ;;
*) pkg="$1" && shift ;;
esac

case "$disk" in
false)
	pkgs="$(dpkg --get-selections | grep -v deinstall | cut -f1 | cut -d':' -f1 | sort)"
	;;
true)
	pkgs="$(dpkg-query -Wf '${Installed-Size}\t${Package}\n')"

	case "$pkg" in
	"") pkgs="$(echo "$pkgs" | sort -n)" ;;
	*) pkgs="$(echo "$pkgs" | grep "$pkg")" ;;
	esac

	case "$human" in
	true) pkgs="$(echo "$pkgs" | awk "$awkcmd")" ;;
	esac
	;;
esac

printf '%s\n' "$pkgs"
