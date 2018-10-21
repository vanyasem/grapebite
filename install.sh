#! /bin/sh
# script by xpander

BINDIR="$(dirname "$(readlink -fn "$0")")"

# Disable debugging
export WINEDEBUG=-all

# Things you want to install
#install="$BINDIR/setup/SteamSetup.exe"
#install="$BINDIR/setup/VulkanSDK-1.1.82.1-Installer.exe"
#install="$BINDIR/setup/Social-Club-v1.1.5.8-Setup.exe"
install="$BINDIR/setup/OriginThinSetup.exe"

# Install stuff with wine
wine $install
