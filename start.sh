#!/bin/sh
#
# Starts a command in the background
#
# Copyright (C) 2020 Cristian Ariza
#
# See LICENSE file for details

usage="crzutils v0.0.1
Copyright (C) 2020 Cristian Ariza

Usage: $0 [OPTION]... [COMMAND]

Starts a COMMAND in the background.

	    --help    display this help and exit"

if test "$#" -eq 0; then
	printf '%s\n' "$usage"
	exit 1
fi

if test "$1" = "--help"; then
	printf '%s\n' "$usage"
	exit
fi

exec nohup "$@" > /dev/null 2>&1 &
