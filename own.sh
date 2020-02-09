#!/bin/sh
#
# Chowns a folder to yourself
own() { chown -R "$(whoami)":"$(whoami)" "$@"; }
