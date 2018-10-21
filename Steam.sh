#! /bin/sh 
# script by xpander

#source $(dirname "$0")/envsetup.sh

# Disable debugging
export WINEDEBUG=-all

# Vulkan stuff
export DXVK_DEBUG_LAYERS=0
export DXVK_HUD=devinfo,fps

# Start Steam in prefix
cd "/mnt/windows/Program Files (x86)/Steam/"
WINEESYNC=1 LC_ALL=ru_RU.UTF-8 wine Steam.exe -no-browser
