#! /bin/sh 
# script by xpander

#source $(dirname "$0")/envsetup.sh

# Disable debugging
export WINEDEBUG=-all
#export WINEDEBUG=+loaddll
#export WINEDEBUG=fps

#wine "$BINDIR/_DXVK_prefix/drive_c/mod_sa.v4.4.2.0.SA-MP.v0.3.DL-R1.Setup.exe"
__GL_THREADED_OPTIMIZATIONS=1 LC_ALL=ru_RU.UTF-8 WINEESYNC=1 WINEDEBUG=-all wine "/mnt/windows/Games/GTA San Andreas-def/samp.exe"
