#!/bin/sh
#
# Chowns a folder to yourself
#
# Copyright (C) 2020 Cristian Ariza
#
# See LICENSE file for details

usage="crzutils v0.0.1
Copyright (C) 2020 Cristian Ariza

Usage: $0 [OPTION]... [FILE]...

Chowns a folder to yourself.

	    --help    display this help and exit"

if test "$#" -eq 0; then
	printf '%s\n' "$usage"
	exit 1
fi

if test "$1" = "--help"; then
	printf '%s\n' "$usage"
	exit
fi

exec chown -R "$USER":"$USER" "$@"
