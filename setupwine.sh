#! /bin/sh

BINDIR="$(dirname "$(readlink -fn "$0")")"

export WINEDEBUG=-all

wineserver -k

rm -r $HOME/.wine/*
rm -r $HOME/.wine/.*

$BINDIR/removemenu.sh
$BINDIR/setupicons.sh

echo "DPI 192, Win XP, Drives"
#winecfg && wineserver -k
#wine "$BINDIR/setup/dotNetFx40_Full_x86_x64.exe" /q && wineserver -k
echo "Win 7, mscoree to native"
winecfg && wineserver -k
#wine "$BINDIR/setup/NDP471-KB4033342-x86-x64-AllOS-ENU.exe" /q && wineserver -k

$BINDIR/setuptmp.sh

# Install stuff with wine
wine "$BINDIR/setup/VulkanSDK-1.1.82.1-Installer.exe" && wineserver -k

setup_dxvk32
setup_dxvk64
winetricks nocrashdialog

echo "Enable GTK, d3d9 override, disable nvapi / nvapi64 (set XP for Social Club)"
winecfg
