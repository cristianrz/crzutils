#!/bin/sh
#
# If a terminal is open, raise it. Otherwise, open a new one.

TERMINAL="sakura"

if pgrep "$TERMINAL"; then
	wmctrl -a "$TERMINAL"
else
	"$TERMINAL" &
fi

unset TERMINAL
