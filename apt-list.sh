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

while getopts "hd" c; do
	case "$c" in
	d)
		dpkg-query -Wf '${Installed-Size}\t${Package}\n' | sort -n
		exit 0
		;;
	*)
		printf '%s\n' "$usage"
		exit 1
		;;
	esac
done

dpkg --get-selections | grep -v deinstall | cut -f1 | cut -d':' -f1 | sort
