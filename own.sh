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

Chowns a FILE to yourself.

	    --help    display this help and exit"

if test "$#" -eq 0; then
	printf '%s\n' "$usage"
	exit 1
fi

case "$1" in
"-"*)
	printf '%s\n' "$usage"
	exit 1
	;;
esac

exec chown -R "$USER":"$USER" "$@"
