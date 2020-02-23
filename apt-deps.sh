#!/bin/sh
#
# apt-deps: find dependencies of a package
# Copyright (C) 2020 Cristian Ariza
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

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
			apt-cache depends "$i" | awk -f depends.awk
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
