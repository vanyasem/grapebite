#! /bin/sh

BINDIR="$(dirname "$(readlink -fn "$0")")"
source "$BINDIR/config.cfg"

if [ -f "$SAMPPATH/samp.exe" ]; then
	wine "$SAMPPATH/samp.exe"
else
	echo "SAMP doesn't appear to be installed or the path is incorrect!"
	echo "Launch grapebite to configure or install it"
fi
