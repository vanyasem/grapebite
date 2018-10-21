#! /bin/sh

APPS="$HOME/.local/share/applications/wine"
MENUS="$HOME/.config/menus/applications-merged"

mkdir -p $APPS
mkdir -p $MENUS

cat << EOF > $APPS/wine-uninstaller.desktop
[Desktop Entry]
Name=Uninstall Wine Software
Comment=Uninstall Windows applications for Wine
Exec=wine uninstaller
Terminal=false
Type=Application
Icon=wine-uninstaller
Categories=Wine;
EOF

cat << EOF > $APPS/wine-winecfg.desktop
[Desktop Entry]
Name=Configure Wine
Comment=Change Wine options
Exec=winecfg
Terminal=false
Icon=wine-winecfg
Type=Application
Categories=Wine;
EOF

cat << EOF > $APPS/wine-explorer.desktop
[Desktop Entry]
Name=Explorer
Comment=File Manager
Exec=wine explorer
Terminal=false
Icon=wine-explorer
Type=Application
Categories=Wine;
EOF

cat << EOF > $APPS/wine-iexplore.desktop
[Desktop Entry]
Name=Internet Explorer
Comment=Web Browser
Exec=wine iexplore
Terminal=false
Icon=wine-iexplore
Type=Application
Categories=Wine;
EOF

cat << EOF > $APPS/wine-control.desktop
[Desktop Entry]
Name=Control Panel
Comment=Change Wine system settings
Exec=wine control
Terminal=false
Icon=wine-control
Type=Application
Categories=Wine;
EOF

cat << EOF > $APPS/wine-cmd.desktop
[Desktop Entry]
Name=CMD
Comment=Command Prompt
Exec=wine start cmd
Terminal=false
Icon=wine-cmd
Type=Application
Categories=Wine;
EOF

cat << EOF > $APPS/wine-wordpad.desktop
[Desktop Entry]
Name=Wordpad
Comment=Word Processor
Exec=wine wordpad
Terminal=false
Icon=wine-wordpad
Type=Application
Categories=Wine;
EOF

cat << EOF > $APPS/wine-winver.desktop
[Desktop Entry]
Name=About Wine
Comment=Information about Wine
Exec=wine winver
Terminal=false
Icon=wine-winver
Type=Application
Categories=Wine;
EOF

cat << EOF > $APPS/wine-winemine.desktop
[Desktop Entry]
Name=Minesweeper
Comment=Classic Minesweeper game
Exec=wine winemine
Terminal=false
Icon=wine-winemine
Type=Application
Categories=Wine;
EOF

cat << EOF > $APPS/wine-taskmgr.desktop
[Desktop Entry]
Name=Task Manager
Comment=Manage Wine processes
Exec=wine taskmgr
Terminal=false
Icon=wine-taskmgr
Type=Application
Categories=Wine;
EOF

cat << EOF > $APPS/wine-winefile.desktop
[Desktop Entry]
Name=File
Comment=Advanced File Manager
Exec=wine winefile
Terminal=false
Icon=wine-winefile
Type=Application
Categories=Wine;
EOF

cat << EOF > $MENUS/wine.menu
<!DOCTYPE Menu PUBLIC "-//freedesktop//DTD Menu 1.0//EN"
"http://www.freedesktop.org/standards/menu-spec/menu-1.0.dtd">
<Menu>
  <Name>Applications</Name>
  <Menu>
    <Name>wine-wine</Name>
    <Directory>wine-wine.directory</Directory>
    <Include>
      <Category>Wine</Category>
    </Include>
  </Menu>
</Menu>
EOF
