#!/bin/bash
#
# Similar to what ps aux | grep would do
pid() { ps -ef | grep -E "PID|$1" | grep -v 'grep'; }
