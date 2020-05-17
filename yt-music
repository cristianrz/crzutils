#!/bin/bash
#
# If argument is passed, download audio from youtube to the Music directory.
# Otherwise, open VLC on the Music directory.
#
# Copyright (C) 2020 Cristian Ariza
#
# See LICENSE file for details

usage="crzutils v0.0.1
Copyright (C) 2020 Cristian Ariza

Usage: $(basename "$0") [OPTION] [URL]
If argument is passed, downloads audio from youtube to the Music directory.
Otherwise, opens VLC on the Music directory.

	--help    display this help and exit"

case "$1" in
"--help")
	printf '%s\n' "$usage"
	exit
	;;
esac

MUSICDIR="$HOME"/Music

case "$#" in
0)
	exec vlc -L -Z "$MUSICDIR" >/dev/null 2>&1 &
	;;
*)
	cd "$MUSICDIR" || exit 1
	exec youtube-dl -x "$1"
	;;
esac
