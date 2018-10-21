#! /bin/sh

BINDIR="$(dirname "$(readlink -fn "$0")")"
WINEPREFIX="$HOME/.wine"

cat << EOF > /tmp/fontsmoothing
REGEDIT4

[HKEY_CURRENT_USER\Control Panel\Desktop]
"FontSmoothing"="2"
"FontSmoothingOrientation"=dword:00000001
"FontSmoothingType"=dword:00000002
"FontSmoothingGamma"=dword:00000578
EOF

wine regedit /tmp/fontsmoothing 2> /dev/null

cp $BINDIR/setup/Fonts/* $WINEPREFIX/drive_c/windows/Fonts/
