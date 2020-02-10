#!/bin/sh
#
# Shows installed packages sorted by size
#
# Copyright (C) 2020 Cristian Ariza
#
# See LICENSE file for details

usage="crzutils v0.0.1
Copyright (C) 2020 Cristian Ariza

Usage: $0 [OPTION]

Shows installed packages sorted by size.

	--help    display this help and exit"

case "$1" in
"--help")
	printf '%s\n' "$usage"
	exit
	;;
esac

dpkg-query -Wf '${Installed-Size}\t${Package}\n' | sort -n
