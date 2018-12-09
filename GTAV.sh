#! /bin/sh

BINDIR="$(dirname "$(readlink -fn "$0")")"
source "$BINDIR/config.cfg"

if [ -f "$GTAVPATH/GTAVLauncher.exe" ]; then
	wine "$GTAVPATH/GTAVLauncher.exe"
else
	echo "GTA V doesn't appear to be installed or the path is incorrect!"
	echo "Launch grapebite to configure or install it"
fi
