#!/bin/sh
#
# Shows installed packages
#
# Copyright (C) 2020 Cristian Ariza
#
# See LICENSE file for details

usage="crzutils v0.0.1
Copyright (C) 2020 Cristian Ariza

Usage: $(basename "$0") [OPTION]

Shows installed packages.

	--help    display this help and exit"

case "$1" in
"--help")
	printf '%s\n' "$usage"
	exit
	;;
esac

dpkg --get-selections | grep -v deinstall | cut -f1 | cut -d':' -f1 | sort
