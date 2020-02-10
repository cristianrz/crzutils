#!/bin/sh
#
# Shows the process name of a window. Works like xkill
#
# Copyright (C) 2020 Cristian Ariza
#
# See LICENSE file for details

usage="crzutils v0.0.1
Copyright (C) 2020 Cristian Ariza

Usage: $0 [OPTION]

Shows the process name of a window. Works like xkill.

	    --help    display this help and exit"

if test "$1" = "--help"; then
	printf '%s\n' "$usage"
	exit
fi

cat /proc/"$(xprop | awk '/PID/ {print $3}')"/cmdline
echo
