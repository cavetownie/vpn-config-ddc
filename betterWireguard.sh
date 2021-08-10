#!/bin/bash

echo "$(tput setaf 1 && tput bold)  _____      _               __  __           _                _         _"
echo "$(tput setaf 1 && tput bold) / ____|    | |             |  \/  |         | |              | |       | |"
echo "$(tput setaf 1 && tput bold)| |    _   _| |__   ___ _ __| \  / | ___  ___| |_ ___ _ __ ___| | ____ _| |__   ___ _ __ _ __   ___"
echo "$(tput setaf 1 && tput bold)| |   | | | | '_ \ / _ \ '__| |\/| |/ _ \/ __| __/ _ \ '__/ __| |/ / _' | '_ \ / _ \ '__| '_ \ / _ \ "
echo "$(tput setaf 1 && tput bold)| |___| |_| | |_) |  __/ |  | |  | |  __/\__ \ ||  __/ |  \__ \   < (_| | |_) |  __/ |  | | | |  __/"
echo "$(tput setaf 1 && tput bold) \_____\__, |_.__/ \___|_|  |_|  |_|\___||___/\__\___|_|  |___/_|\_\__,_|_.__/ \___|_|  |_| |_|\___|"
echo "$(tput setaf 1 && tput bold)        __/ |  $(tput setaf 7)made by $(tput setaf 6)Cave $(tput setaf 7)<3"$(tput sgr0)
echo "$(tput setaf 1 && tput bold)       |___/   $(tput setaf 7)graphics by $(tput setaf 6)Phiko"$(tput sgr0)
echo -en "\n\n"
echo "$(tput setaf 2 && tput bold)Tutorial(1): chmod +x betterWireguard.sh"
echo "$(tput setaf 2 && tput bold)Tutorial(2): cd to betterWireguards location"
echo "$(tput setaf 2 && tput bold)Tutorial(3): Make sure that both your shellscript and betterWireguard is in the current directory"
echo "$(tput setaf 2 && tput bold)Tutorial(4): ./betterWireguard"
echo "$(tput setaf 2 && tput bold)Tutorial(5): Enter the complete filename of config file (fx conn_0.conf)"


echo -en "$(tput setaf 3 && tput bold)\n\nCave <3 and Phiko - Held og lykke til alle\n"


echo -en "$(tput setaf 7 && tput bold)\nNote that the config file must be in the same directory as the shellscript\n"
read -p "Name of your config file from event page: " confFile

CONFSTRIP="$(basename $confFile .conf)"

if [ ! -f $confFile ];
then 
    echo "$(tput setaf 2 && tput bold)Go in and download the connection file."
    echo "$(tput setaf 2 && tput bold)On: $(tput setaf 1) https://vpntest.haaukins.com/info"
else 
    sudo apt-get update -y
    ln -s /usr/bin/resolvectl /usr/local/bin/resolvconf
    sudo apt-get install -y wireguard && sudo apt-get install -y resolvconf
    sudo cp $confFile /etc/wireguard
    if (sudo wg-quick up $CONFSTRIP 2>&1 | grep "tun"); then
            sudo sh -c "cd /etc/wireguard; sed -i \"/DNS = 1.1.1.1/d\" $confFile"
            sudo wg-quick up $CONFSTRIP
    fi
    sudo wg
fi
