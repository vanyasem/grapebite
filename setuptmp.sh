#! /bin/sh

WINEPREFIX="$HOME/.wine"

rm -r $WINEPREFIX/drive_c/users/$USER/Temp
ln -s /tmp/ $WINEPREFIX/drive_c/users/$USER/Temp
