#!/bin/sh
#
# Mounts an android phone that has an FTP server

set -x

DIR="$HOME"/android
IP="$(echo "$1" | cut -d':' -f 1)"
PORT="$(echo "$1" | cut -d':' -f 2)"

mkdir -p "$DIR"
sshfs "$IP":/storage/emulated/0 "$DIR" -p "$PORT"
