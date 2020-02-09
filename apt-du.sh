#!/bin/bash
#
# Shows installed packages sorted by size

apt-du() {
	set -u

	if test "$#" -ne 0 && test "$1" == "-n"; then
		dpkg-query -Wf '${Installed-Size}\t${Package}\n' | sort -n | head -n "$2"
		exit
	fi

	dpkg-query -Wf '${Installed-Size}\t${Package}\n' | sort -n

}
