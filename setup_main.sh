#!/bin/bash
#check version with -v or --version
VERSION="1.0"; if [[ ( $1 = -v ) || ( $1 = --version ) ]]; then  echo "Version $VERSION"; exit; fi

#check sudo privileges
sudo echo "" ; if [[ $? != 0 ]]; then echo "Please run this script as admin" ; exit 1 ; fi

#defining various functions
displayHeader() {
	sleep 0.5
        echo "############################################################################"
        echo "############################################################################"
	    echo "----------------------------Welcome to myscript!---------------------------"
        echo "############################################################################"
        echo "############################################################################"
	sleep 0.5;
	echo ""
}

executeCommands() {
	commands=("$@")
	for i in "${commands[@]}"
	do
	    echo "";
	    echo "Executing: $i";
	    echo "";
	    sleep 0.5;
	    eval $i;
	done
	echo "";
	echo "EXECUTED!";
	read -n 1 -s -r -p "Press any key to continue...";
	echo "";
}

askUserYesOrNo (){ 
	while true; do
		read -p "$1 [y or n]: " decision
		case ${decision} in
			[Yy]* ) return 1; break;;
			[Nn]* ) return 0; break;;
		esac
	done	
}


executeAptInstall() {
	commands=("$@")
	for i in "${commands[@]}"
	do
	    echo "";
	    echo "Installing: $i";
	    echo "";
	    sleep 0.5;
	    sudo apt install $i -y;
	done
	echo "";
	echo "EXECUTED!";
	read -n 1 -s -r -p "Press any key to continue...";
	echo "";
}



updateAndUpgrade() {
    declare -a commands=(
		"sudo apt update"
		"sudo apt upgrade -y"
        "sudo apt autoremove -y")
	executeCommands "${commands[@]}";
}

dpkgerrorcheck() {
    declare -a commands=(
		"sudo apt --fix-broken install"
		"sudo dpkg --configure -a")
	executeCommands "${commands[@]}";
}

installPackage() {
    declare -a commands=(
    ffmpeg
    gimp
	baobab
	neofetch
    chromium-browser
    vlc
    smplayer
    synaptic
    preload
    gdebi
    tlp 
    qbittorrent
    mypaint
    gpicview
    gufw
    nautilus-admin
    )
	executeAptInstall "${commands[@]}"; sudo tlp start  
}

uninstallPackage() {
    #uninstall according to this file
    #https://people.canonical.com/~ubuntu-archive/seeds/ubuntu.bionic/desktop.minimal-remove
    declare -a commands=(
		"sudo apt remove example-content ubuntu-web-launchers"
		"sudo apt remove aisleriot gnome-mahjongg gnome-mines gnome-sudoku branding-ubuntu"
		"sudo apt remove thunderbird thunderbird-gnome-support transmission-gtk gnome-todo baobab rhythmbox cheese vino shotwell totem usb-creator-gtk deja-dup gnome-calendar remmina simple-scan"
		"sudo apt remove libreoffice-style-breeze libreoffice-gnome libreoffice-writer libreoffice-calc libreoffice-impress libreoffice-math libreoffice-ogltrans libreoffice-pdfimport"
		"sudo apt remove libreoffice-style-galaxy libreoffice-style-tango libraptor2-0 librasqal3 librevenge-0.0-0nlibrhythmbox-core10 libtotem0 libvisio-0.1-1 libwpd-0.10-10 libwpg-0.3-3 libwps-0.4-4 libyajl2 python3-uno rhythmbox-data rhythmbox-plugin-alternative-toolbar rhythmbox-plugins remmina-common remmina-plugin-rdp remmina-plugin-secret remmina-plugin-vnc duplicity seahorse-daemon shotwell-common totem-common totem-plugins transmission-common cheese-common  gnome-todo-common libgnome-todo gnome-video-effects libcheese-gtk25 libcheese8 uno-libs3 ure zeitgeist-core hunspell-de-at-frami"
        "sudo apt remove hunspell-de-ch-frami hunspell-de-de-frami hunspell-en-au hunspell-en-ca hunspell-en-gb hunspell-en-za hunspell-es hunspell-fr hunspell-fr-classical hunspell-it hunspell-pt-br hunspell-pt-pt hunspell-ru hyphen-de hyphen-en-ca hyphen-en-gb hyphen-en-us hyphen-fr hyphen-hr hyphen-it hyphen-pl hyphen-pt-br hyphen-pt-pt hyphen-ru mythes-de mythes-de-ch mythes-en-au mythes-en-us mythes-fr mythes-it mythes-pt-pt mythes-ru "
		"sudo apt remove gir1.2-rb-3.0 gir1.2-totem-1.0 gir1.2-totemplparser-1.0 guile-2.0-libs libabw-0.1-1 libavahi-ui-gtk3-0 libdmapsharing-3.0-2 libexttextcat-2.0-0 libexttextcat-data libfreehand-0.1-1 libgnome-games-support-1-3 libgnome-games-support-common libgom-1.0-0 libgrilo-0.3-0 liblangtag-common liblangtag1 libmessaging-menu0 libmhash2 libminiupnpc10 libmwaw-0.3-3 libmythes-1.2-0 libnatpmp1 libneon27-gnutls liborcus-0.13-0 libpagemaker-0.0-0 librdf0 libreoffice-avmedia-backend-gstreamer libreoffice-base-core libreoffice-common libreoffice-core libreoffice-draw libreoffice-gtk3 libreoffice-style-elementary"
		"sudo apt remove libreoffice-l10n-en-gb libreoffice-l10n-es libreoffice-l10n-zh-cn libreoffice-l10n-zh-tw libreoffice-l10n-pt libreoffice-l10n-pt-br libreoffice-l10n-de libreoffice-l10n-fr libreoffice-l10n-it libreoffice-l10n-ru libreoffice-l10n-en-za libreoffice-help-en-gb libreoffice-help-es libreoffice-help-zh-cn libreoffice-help-zh-tw libreoffice-help-pt libreoffice-help-pt-br libreoffice-help-de libreoffice-help-fr libreoffice-help-it libreoffice-help-ru libreoffice-help-en-us thunderbird-locale-en thunderbird-locale-en-gb thunderbird-locale-en-us thunderbird-locale-es thunderbird-locale-es-ar thunderbird-locale-es-es thunderbird-locale-zh-cn thunderbird-locale-zh-hans thunderbird-locale-zh-hant thunderbird-locale-zh-tw thunderbird-locale-pt thunderbird-locale-pt-br thunderbird-locale-pt-pt thunderbird-locale-de thunderbird-locale-fr thunderbird-locale-it thunderbird-locale-ru"
        "sudo apt autoremove")
	executeCommands "${commands[@]}";
}

installGnomeExtensions() {
    declare -a commands=(
    gnome-tweaks
    gnome-shell-extensions
    chrome-gnome-shell 
    gnome-shell-extension-dash-to-panel 
    gnome-shell-extension-no-annoyance
    gnome-shell-extension-dashtodock
    gnome-shell-extension-remove-dropdown-arrows
    )
	executeAptInstall "${commands[@]}";
}

installProgrammerTools(){
    declare -a commands=(
    tree
    tilix
    git
    gitg
    gcc 
	build-essential
	geany 
	nodejs
    ruby
    ruby-full
    python3-pip
    python3-tk
    virtualenv
    default-jdk
    )
	executeAptInstall "${commands[@]}";
}
########################################################################
#execution begins here
########################################################################
displayHeader

askUserYesOrNo "Check for package management errors ?";
if [[ $? == 1 ]]; then dpkgerrorcheck; fi ;

askUserYesOrNo "Remove unnecessary preinstalled apps ?";
if [[ $? == 1 ]]; then uninstallPackage; fi ;

askUserYesOrNo "Perform an update of all packages ?";
if [[ $? == 1 ]]; then updateAndUpgrade; fi ;

askUserYesOrNo "Install new apps ?";
if [[ $? == 1 ]]; then installPackage; fi ;

askUserYesOrNo "Install Gnome shell extensions ?";
if [[ $? == 1 ]]; then installGnomeExtensions; fi ;

askUserYesOrNo "Install programming tools ?";
if [[ $? == 1 ]]; then installProgrammerTools; fi ;


echo "done"





