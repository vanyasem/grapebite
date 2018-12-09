#! /bin/sh

BINDIR="$(dirname "$(readlink -fn "$0")")"
source "$BINDIR/env.cfg"
if [ ! -f "$BINDIR/config.cfg" ]; then
	echo -e "It appears that it's your first time running grapebite"
	echo -e "${YEL}Please, take your time to configure it${STD}"
	read -p "Press enter to continue to the editor"
	sudo cp "$BINDIR/config.cfg.sample" "$BINDIR/config.cfg"
	sudoedit "$BINDIR/config.cfg" 2> /dev/null | edit "$BINDIR/config.cfg"
fi
source "$BINDIR/config.cfg"

set -e
set -u

show_menus() {
	echo -e "${PRP}~~~~~~~~~~~"
	echo " grapebite"
	echo -e "~~~~~~~~~~~${STD}"
	echo "1. Install grapebite"
	echo "2. Uninstall grapebite"
	echo "3. Configure grapebite"
	echo -e "${GRY} ---- ${STD}"
	echo "4. Install software"
	echo "5. Update Origin"
	echo "6. Delete icons and mime"
	echo -e "${GRY} ---- ${STD}"
	echo "7. Exit"
}

install() {
	if [ -f "$WINEPREFIX/grapebite" ]; then
		echo -e "${YEL}grapebite appears to be already installed${STD}"
		read -p "Force install? (Y/n)? " result
		if [ "$result" = "n" ]; then
			return
		fi
	fi
	wineserver -k || true

	echo "DPI 192, Win 7 (set to XP for Social Club), Drives, disable nvapi / nvapi64"
	#echo "Enable GTK, d3d9 override"
	winecfg

	# DotNet 4.0 installation 64-bit prefix:
	# echo "DPI 192, Win XP, Drives"
	#winecfg && wineserver -k
	#wine "$BINDIR/setup/dotNetFx40_Full_x86_x64.exe" /q && wineserver -k
	#echo "Win 7, mscoree to native"
	#winecfg && wineserver -k
	#wine "$BINDIR/setup/NDP471-KB4033342-x86-x64-AllOS-ENU.exe" /q && wineserver -k

	rm -r "$WINEPREFIX/drive_c/users/$USER/Temp" || true
	ln -s /tmp/ "$WINEPREFIX/drive_c/users/$USER/Temp" || true

	wine "$BINDIR/setup/VulkanSDK-1.1.82.1-Installer.exe" && wineserver -k
	setup_dxvk32
	setup_dxvk64
	winetricks nocrashdialog

	touch "$WINEPREFIX/grapebite"

	echo -e "${GRN}Done!${STD}"
}

uninstall() {
	echo -e "${RED}This will wipe your Wine prefix!${STD}"
	read -p "Are you sure? (y/N)? " result
	if [ "$result" = "y" ]; then
		wineserver -k || true
		rm -r "${WINEPREFIX:?}/*"
		rm -r "${WINEPREFIX:?}/.*"
		"$BINDIR/removemenu.sh"
		echo -e "${GRN}Done!${STD}"
	else
		echo -e "${YEL}No action was taken${STD}"
	fi
}

update_origin() {
	if [ ! -f "$ORIGINPATH/updateorigin.sh" ]; then
		wget "https://raw.githubusercontent.com/DrDoctor13/wine-origin-updater/master/updateorigin.sh" -O "$ORIGINPATH/updateorigin.sh" && update_origin
	fi
	"$ORIGINPATH/updateorigin.sh"
}

remove_menu() {
	rm -rfv ~/.local/share/applications/wine/ || true
	rm -v ~/.config/menus/applications-merged/wine* || true
	rm -v ~/.local/share/mime/packages/x-wine* || true
	rm -v ~/.local/share/applications/wine-extension* || true
	rm -v ~/.local/share/icons/hicolor/*/*/application-x-wine-extension* || true
	rm -v ~/.local/share/mime/application/x-wine-extension* || true
	echo -e "${GRN}Done!${STD}"
}

read_options() {
	local choice
	read -p "Select an option: " choice
	case $choice in
		1) install ;;
		2) uninstall ;;
		3) sudoedit "$BINDIR/config.cfg" 2> /dev/null | edit "$BINDIR/config.cfg" ;;
		4) "$BINDIR/install.sh" ;;
		5) update_origin ;;
		#6) remove_menu && "$BINDIR/setupicons.sh" ;;
		6) remove_menu ;;

		7) exit 0 ;;
		*) echo -e "${RED}Invalid option selected${STD}" && read_options
	esac
	sleep 1.5
	echo -e
	show_menus
	read_options
}

show_menus
read_options
