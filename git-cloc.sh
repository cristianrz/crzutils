#!/bin/sh
#
# Check lines of code of a remote git repo

git clone --depth 1 "$1" temp-linecount-repo &&
	printf "('temp-linecount-repo' will be deleted automatically)\n\n\n" &&
	cloc temp-linecount-repo &&
	rm -rf temp-linecount-repo
