#!/bin/bash
#
# Prompts the user for a logout option

ask() {
	printf '> ' && read -r response

	case "$response" in
	1) systemctl poweroff ;;
	2) systemctl restart ;;
	3) systemctl suspend ;;
	4) openbox --exit ;;
	0) exit ;;
	*)
		echo "Unknown option '$response'"
		ask
		;;
	esac
}

bye() {
	cat << 'EOF'
What do you want to do?
1) poweroff
2) reboot
3) suspend
4) logout
0) nothing
EOF

	ask
}
