#!/bin/bash
#
# Checks if connected to mullvad

amimullvad() {
	curl -s https://am.i.mullvad.net/connected
}
