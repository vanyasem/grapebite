#! /bin/sh

BINDIR="$(dirname "$(readlink -fn "$0")")"
source "$BINDIR/config.cfg"

if [ -f "$WOTPATH/WoTLauncher.exe" ]; then
	wine "$WOTPATH/WoTLauncher.exe"
else
	echo "WOT doesn't appear to be installed or the path is incorrect!"
	echo "Launch grapebite to configure or install it"
fi
