#!/bin/sh
#
# Copyright (C) 2020 Cristian Ariza
#
# See LICENSE file for details
#
# apt-deps: find dependencies of a package

usage="usage: $(basename "$0") [-c] [-n level] [package]
find dependencies of a package

	-c  only returns the number of dependencies
	-n  specifies how deep $(basename "$0") will search"

awkcode='/Breaks/ { next; }
/Replaces/ { next; }
/Conflicts/ { next; }
/\|/ { next; }
/</ { next; }
{ if(NR==1) { next; }; print $NF }'

go_through() {
	{
		printf '%s\n' "$1"
		for i in $1; do
			apt-cache depends "$i" | awk "$awkcode"
		done
	} | uniq
}

n=1
count=false
while getopts "cn:" c; do
	case "$c" in
	c) count=true ;;
	n) n="$OPTARG" ;;
	*)
		printf '%s\n' "$usage" >&2
		exit 1
		;;
	esac
done
shift "$((OPTIND - 1))"

pkg="$1" && shift
pkglist="$pkg"

i=0
while [ "$i" -lt "$n" ]; do
	pkglist="$(go_through "$pkglist")" || exit 1
	i="$((i + 1))"
done

pkglist="$(echo "$pkglist" | grep -v "$pkg")"

case "$count" in
true) echo "$pkglist" | sed 1d | wc -l ;;
false) echo "$pkglist" ;;
esac
