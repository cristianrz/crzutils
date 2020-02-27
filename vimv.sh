#!/bin/sh

set -eu

TMP="$(mktemp)"
trap 'rm "$TMP"' EXIT

n_before="$(ls -1 | wc -l)"

"${EDITOR-vi}" "$TMP"

LS="$(ls -1)"
n="$(echo "$LS" | tee "$TMP" | wc -l)"

if [ "$n_before" != "$n" ]; then
	echo Files changed during edit. Exiting.
	exit 1
fi

i=1
while [ "$i" -lt "$n" ]; do
	before="$(echo "$LS" | sed -n "$i"p)"
	after="$(sed -n "$i"p "$TMP")"

	if [ "$before" != "$after" ]; then
		mv -v "$before" "$after"
	fi

	i="$((i+1))"
done
