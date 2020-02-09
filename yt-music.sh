#!/bin/bash
#
# If argument is passed, download audio from youtube to the Music directory.
# Otherwise, open VLC on the Music directory.

yt-music() {
	case "$#" in
	0) vlc -L -Z ~/Music/ > /dev/null 2>&1 &;;
	*)
		cd ~/Music || exit
		youtube-dl -x "$1"
		;;
	esac
}
