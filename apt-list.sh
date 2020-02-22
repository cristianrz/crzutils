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

while getopts "hd" c; do
	case "$c" in
	d)
		dpkg-query -Wf '${Installed-Size}\t${Package}\n' | awk "$awkcmd" | sort -h
		exit 0
		;;
	*)
		printf '%s\n' "$usage"
		exit 1
		;;
	esac
done

dpkg --get-selections | grep -v deinstall | cut -f1 | cut -d':' -f1 | sort
