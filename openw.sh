#!/bin/bash
#
# If a window is open, raise it. Otherwise, open a new one.
#
# Copyright (C) 2020 Cristian Ariza
#
# See LICENSE file for details

usage="crzutils v0.0.1
Copyright (C) 2020 Cristian Ariza

Usage: $(basename "$0") [OPTION]...

If a window is open, raise it. Otherwise, open a new one.

	    --help    display this help and exit"

case "$1" in
"--help")
	printf '%s\n' "$usage"
	exit
	;;
esac

WINDOW="$1"

if pgrep "$WINDOW"; then
	exec wmctrl -a "$WINDOW"
else
	exec "$WINDOW" &
fi
