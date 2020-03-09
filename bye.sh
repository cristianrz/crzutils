#!/bin/sh
#
# Copyright (C) 2020 Cristian Ariza
# See LICENSE file for details
#
# Prompts the user for a logout option

ask() {
	printf '> ' && read -r response

	case "$response" in
	1) exec systemctl poweroff ;;
	2) exec systemctl restart ;;
	3) exec systemctl suspend ;;
	4) exec openbox --exit ;;
	0) exit ;;
	*)
		echo "Unknown option '$response'"
		ask
		;;
	esac
}

usage="crzutils v0.0.1
Copyright (C) 2020 Cristian Ariza

Usage: $(basename "$0")
Prompts the user for a logout option.

	--help  display this help and exit"

case "$1" in
"--help")
	printf '%s\n' "$usage"
	exit
	;;
esac

cat <<'EOF'
What do you want to do?
1) poweroff
2) reboot
3) suspend
4) logout
0) nothing

EOF

ask
