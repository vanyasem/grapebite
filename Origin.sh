#! /bin/sh

BINDIR="$(dirname "$(readlink -fn "$0")")"
source "$BINDIR/config.cfg"

if [ -f "$ORIGINPATH/Origin.exe" ]; then
	wine "$ORIGINPATH/Origin.exe"
else
	echo "Origin doesn't appear to be installed or the path is incorrect!"
	echo "Launch grapebite to configure or install it"
fi
