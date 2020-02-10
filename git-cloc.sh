#!/bin/sh
#
# Check lines of code of a remote git repo
#
# Copyright (C) 2020 Cristian Ariza
#
# See LICENSE file for details

cleanup() {
	rm -rf "$DIR"
}

trap cleanup EXIT

usage="crzutils v0.0.1
Copyright (C) 2020 Cristian Ariza

Usage: $0 [OPTION] [URL]
Check lines of code of a remote git repo.

	--help    display this help and exit"

case "$1" in
"--help")
	printf '%s\n' "$usage"
	exit
	;;
esac

if test "$#" -ne 1; then
	printf '%s\n' "$usage"
	exit 1
fi

DIR="$(mktemp -d)"

git clone --depth 1 "$1" "$DIR"
printf "'%s' will be deleted automatically\\n" "$DIR"
exec cloc "$DIR"
