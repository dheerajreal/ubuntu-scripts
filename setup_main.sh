#!/bin/bash
#check version with -v or --version
VERSION="1.2"
if [[ ($1 == -v) || ($1 == --version) ]]; then
	echo "Version $VERSION"
	exit
fi

#check sudo privileges
sudo echo ""
if [[ $? != 0 ]]; then
	echo "Please run this script as admin"
	exit 1
fi

#defining various functions
displayHeader() {
	sleep 0.5
	echo "############################################################################"
	echo "----------------------------Welcome to myscript!---------------------------"
	echo "############################################################################"
	sleep 0.5
	echo ""
}

executeCommands() {
	commands=("$@")
	for i in "${commands[@]}"; do
		echo ""
		echo "Executing: $i"
		echo ""
		sleep 0.5
		eval $i
	done
	echo ""
	echo "EXECUTED!"
	read -n 1 -s -r -p "Press any key to continue..."
	echo ""
}

askUserYesOrNo() {
	while true; do
		read -p "$1 [y or n]: " decision
		case ${decision} in
		[Yy]*)
			return 1
			break
			;;
		[Nn]*)
			return 0
			break
			;;
		esac
	done
}

executeAptInstall() {
	commands=("$@")
	for i in "${commands[@]}"; do
		echo ""
		echo "Installing: $i"
		echo ""
		sleep 0.5
		sudo apt install $i -y
	done
	echo ""
	echo "EXECUTED!"
	read -n 1 -s -r -p "Press any key to continue..."
	echo ""
}

########################################################################
#execution begins here
########################################################################
displayHeader

askUserYesOrNo "Asking yes or no ?"
if [[ $? == 1 ]]; then echo "hello"; fi

echo "done"
