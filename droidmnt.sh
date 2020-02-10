#!/bin/sh
#
# Mounts an android phone that has an FTP server
#
# Copyright (C) 2020 Cristian Ariza
#
# See LICENSE file for details

usage="crzutils v0.0.1
Copyright (C) 2020 Cristian Ariza

Usage: $0 [OPTION] [IP] [PORT]
Mounts an android phone that has an FTP server.

	--help    display this help and exit"

case "$1" in
"--help")
	printf '%s\n' "$usage"
	exit
	;;
esac

DIR="$HOME"/android

if test "$#" -lt 2; then
	printf '%s\n' "$usage"
	exit 1
fi

mkdir -p "$DIR"
exec sshfs "$1":/storage/emulated/0 "$DIR" -p "$2"
