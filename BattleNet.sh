#! /bin/sh

BINDIR="$(dirname "$(readlink -fn "$0")")"
source "$BINDIR/config.cfg"

if [ -f "$BATTLENETPATH/Battle.net.exe" ]; then
	wine "$BATTLENETPATH/Battle.net.exe"
else
	echo "Battle.net doesn't appear to be installed or the path is incorrect!"
	echo "Launch grapebite to configure or install it"
fi
