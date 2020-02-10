#!/bin/sh
#
# Shows the PID of a window. Works like xkill
#
# Copyright (C) 2020 Cristian Ariza
#
# See LICENSE file for details

usage="crzutils v0.0.1
Copyright (C) 2020 Cristian Ariza

Usage: $0 [OPTION]

Shows the PID of a window. Works like xkill.

	    --help    display this help and exit"

if test "$1" = "--help"; then
	printf '%s\n' "$usage"
	exit
fi

xprop _NET_WM_PID | sed "s/_NET_WM_PID(CARDINAL) = //" | ps "$(cat)"
