#! /bin/sh

BINDIR="$(dirname "$(readlink -fn "$0")")"
source "$BINDIR/env.cfg"
source "$BINDIR/config.cfg"

mkdir -p "$CACHEDIR/setup"

show_menus() {
	echo -e "${PRP}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo " Select what you wish to install"
	echo -e "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~${STD}"
	echo "1. Steam"
	echo "2. GTA V"
	echo "3. Origin"
	echo "4. Battle.net"
	echo "5. World of Tanks RU"
	echo "6. SAMP"
	echo -e "${GRY} ---- ${STD}"
	echo "7. Exit"
}

read_options() {
	local choice
	read -p "Select an option: " choice
	case $choice in
		1) install="$CACHEDIR/setup/SteamSetup.exe"
		if [ ! -f "$install" ]; then
			wget "https://steamcdn-a.akamaihd.net/client/installer/SteamSetup.exe" -O "$install"
		fi ;;
		2) install="$CACHEDIR/setup/GTAV_Setup_Tool.exe"
		if [ ! -f "$install" ]; then
			echo -e "${YEL}Please, download Social Club manually and place the exe in $CACHEDIR/setup/GTAV_Setup_Tool.exe${STD}"
			echo "Download link: https://socialclub.rockstargames.com/activate"
			sleep 1.5
			echo -e
			show_menus
			read_options
		fi ;;
		3) install="$CACHEDIR/setup/OriginThinSetup.exe"
		if [ ! -f "$install" ]; then
			wget "https://download.dm.origin.com/origin/live/OriginSetup.exe" -O "$install"
		fi ;;
		4) install="$CACHEDIR/setup/Battle.net-Setup.exe"
		if [ ! -f "$install" ]; then
			wget "https://eu.battle.net/download/getInstaller?os=win&installer=Battle.net-Setup.exe" -O "$install"
		fi ;;
		5) install="$CACHEDIR/setup/WoT_internet_install_ru.exe"
		if [ ! -f "$install" ]; then
			wget "https://wot.gcdn.co/ru/files/WoT_internet_install_ru.exe" -O "$install"
		fi ;;
		6) install="$CACHEDIR/setup/sa-mp-0.3.7-R3-1-install.exe"
		if [ ! -f "$install" ]; then
			wget "http://files.sa-mp.com/sa-mp-0.3.7-R3-1-install.exe" -O "$install"
		fi ;;

		7) exit 0 ;;
		*) echo -e "${RED}Invalid option selected...${STD}" && read_options
	esac

	wine "$install"
	echo -e "${GRN}Done!${STD}"

	sleep 1.5
	echo -e
	show_menus
	read_options
}

show_menus
read_options
