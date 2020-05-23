#!/bin/sh
#
# Starts a command in the background
#
# Copyright (C) 2020 Cristian Ariza
#
# See LICENSE file for details

usage="crzutils v0.0.1
Copyright (C) 2020 Cristian Ariza

Usage: $(basename "$0") [OPTION]... [COMMAND]

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

if ! command -v "$1" >/dev/null 2>&1; then
	printf "start: no such command '%s'" "$1" >&2
	exit 1
fi

nohup "$@" >/dev/null 2>&1 &
