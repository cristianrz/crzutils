#!/bin/bash
#
# Lists the current directory's files in Vim, so you can edit it and save to
# rename them
#
# Copyright 2017 Thameera Senanayaka
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this software and associated documentation files (the "Software"), to deal in
# the Software without restriction, including without limitation the rights to
# use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
# the Software, and to permit persons to whom the Software is furnished to do so,
# subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
# FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
# COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
# IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
# CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

usage="crzutils v0.0.1 (C) 2020 Cristian Ariza
vimv (C) 2017 Thameera Senanayaka

Usage: $(basename "$0") [OPTION]

Lists the current directory's files in Vim, so you can edit it and save to
rename them

	    --help    display this help and exit"

if test "$1" = "--help"; then
	printf '%s\n' "$usage"
	exit
fi

FILENAMES_FILE="$(mktemp -d)"

trap '{ rm -f "${FILENAMES_FILE}" ; }' EXIT

IFS='\r\n' GLOBIGNORE='*' command eval 'src=($(ls))'

for ((i = 0; i < ${#src[@]}; ++i)); do
	echo "${src[i]}" >> "${FILENAMES_FILE}"
done

vim "${FILENAMES_FILE}"

IFS=$'\r\n' GLOBIGNORE='*' command eval 'dest=($(cat "${FILENAMES_FILE}"))'

count=0
for ((i = 0; i < ${#src[@]}; ++i)); do

	if [ "${src[i]}" != "${dest[i]}" ]; then

		mkdir -p "$(dirname "${dest[i]}")"

		if git ls-files --error-unmatch "${src[i]}" > /dev/null 2>&1; then
			git mv "${src[i]}" "${dest[i]}"
		else
			mv "${src[i]}" "${dest[i]}"
		fi

		((count++))
	fi

done

printf '%s files renamed\n' "$count"
