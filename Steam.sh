#! /bin/sh

BINDIR="$(dirname "$(readlink -fn "$0")")"
source "$BINDIR/config.cfg"

if [ -f "$STEAMPATH/Steam.exe" ]; then
	cd "$STEAMPATH"
	wine Steam.exe -no-browser
else
	echo "Steam doesn't appear to be installed or the path is incorrect!"
	echo "Launch grapebite to configure or install it"
fi
