#!/bin/bash

UTILS="apt-du bye droidmnt extract git-cloc nsa-name open-term \
own pid search start vimv xid yt-music"
VERSION="v0.0.1"

main() {
	cmd="$(basename "$0")"

	if ! contains "$UTILS" "$cmd"; then
		if test "$#" -eq 0 || test "$1" = "--help"; then
			printusg
		elif test "$1" = "--list"; then
			printlist
		elif contains "$UTILS" "$1"; then
			cmd="$1"
			shift
		else
			printf '%s: applet not found\n' "$cmd" >&2
			exit 1
		fi
	fi

	eval "$cmd $*"
}

printusg() {
	printf "crzutils %s multi-call shell script." "$VERSION"
	cat << 'EOF'
(C) Cristian Ariza

Usage: crzutils [function [arguments]...]
   or: crzutils --list

Currently defined functions:
EOF
	printf '\t%s\n' "$UTILS"
	exit 1
}

printlist() {
	printf '%s\n' "$UTILS" | sed 's/ /\n/g'
	exit 0
}

contains() {
	case "$1" in
	*"$2"*) return 0 ;;
	"$2"*) return 0 ;;
	*"$2") return 0 ;;
	*) return 1 ;;
	esac
}

main "$@"
