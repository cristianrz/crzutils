#!/bin/bash
#
# starts a command in the background

start() {
	nohup "$@" > /dev/null 2>&1 &
}
