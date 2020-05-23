#!/bin/sh
#
# Searches for files containing $1 and hides stderr
#
# Copyright (C) 2020 Cristian Ariza
#
# See LICENSE file for details

usage="crzutils v0.0.1
Copyright (C) 2020 Cristian Ariza

Usage: $(basename "$0") [OPTION]... [PATTERN]

Searches for files containing PATTERN and hides stderr.

	    --help    display this help and exit"

if [ "$#" -eq 0 ] || [ "$1" = "--help" ]; then
	printf '%s\n' "$usage"
	exit
fi

exec find . -iname "*$1*" 2>/dev/null
