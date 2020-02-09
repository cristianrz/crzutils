#!/bin/bash
#
# Lists the current directory's files in Vim, so you can edit it and save to rename them

FILENAMES_FILE="$(mktemp --tmpdir vimv.XXX)"
declare -r FILENAMES_FILE

trap '{ rm -f "${FILENAMES_FILE}" ; }' EXIT

if [ $# -ne 0 ]; then
	src=("$@")
else
	# shellcheck disable=SC2016
	IFS=$'\r\n' GLOBIGNORE='*' command eval 'src=($(ls))'
fi

for ((i = 0; i < ${#src[@]}; ++i)); do
	echo "${src[i]}" >> "${FILENAMES_FILE}"
done

${EDITOR:-vi} "${FILENAMES_FILE}"

#shellcheck disable=SC2016
IFS=$'\r\n' GLOBIGNORE='*' command eval 'dest=($(cat "${FILENAMES_FILE}"))'

count=0
for ((i = 0; i < ${#src[@]}; ++i)); do
	# shellcheck disable=SC2154
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

echo "$count" files renamed.
