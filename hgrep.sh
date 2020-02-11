#!/bin/sh
#
# Searches on the history
#
# Copyright (C) 2020 Cristian Ariza
#
# See LICENSE file for details

usage="crzutils v0.0.1
Copyright (C) 2020 Cristian Ariza

Usage: $(basename "$0") [OPTION]... [PATTERN]

Searches on the history.

	    --help    display this help and exit"

if test "$#" -eq 0; then
	printf '%s\n' "$usage"
	exit 1
fi

if test "$1" = "--help"; then
	printf '%s\n' "$usage"
	exit
fi

head -n -1 "$HISTFILE" | cut -d" " -f 2- | grep -i "$@"
