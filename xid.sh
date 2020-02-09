#!/bin/sh
#
# Shows the PID of a window. Works like xkill

xid() {
	xprop _NET_WM_PID | sed "s/_NET_WM_PID(CARDINAL) = //" | ps "$(cat)"
}
