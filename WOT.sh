#! /bin/sh 
# script by xpander

#source $(dirname "$0")/envsetup.sh

# Disable debugging
export WINEDEBUG=-all

# Vulkan stuff
export DXVK_DEBUG_LAYERS=0
export DXVK_HUD=devinfo,fps

# Start Steam in prefix
#WINEESYNC=1 wine "/mnt/windows/Games/World_of_Tanks_RU/wgc_api.exe"
wine "/mnt/windows/Games/World_of_Tanks_RU/WoTLauncher.exe"
