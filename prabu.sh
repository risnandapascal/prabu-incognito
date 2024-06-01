#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

# privacy tools
source sources/privacy_tools/change_hostname
source sources/privacy_tools/change_timezone
source sources/privacy_tools/default_dns
source sources/privacy_tools/manage_mac
source sources/privacy_tools/manage_metadata
source sources/privacy_tools/run_riseup_vpn
source sources/privacy_tools/shadow_service

# security tools
source sources/security_tools/check_file_integrity
source sources/security_tools/generate_password
source sources/security_tools/manage_firewall
source sources/security_tools/monitor_traffic
source sources/security_tools/rkhunter
source sources/security_tools/display_error_message

main_menu() {
    while true; do
        clear
        echo "***************************************************************"
        echo "*                       ____    _______                       *"
        echo "*                      /    \  |       \                      *"
        echo "*                     |  ()  | | PRIVACY!                     *"
        echo "*                      \____/  |_______/                      *"
        echo "*                                                             *"
        echo "*              PRABU INCOGNITO - Author by rical              *"
        echo "*                    Powered by Bismillah                     *"
        echo "*                                                             *"
        echo "*      https://github.com/risnandapascal/prabu-incognito/     *"
        echo "*                                                             *"
        echo "***************************************************************"
        echo ""
        echo -e "${GREEN}[!] 'All human beings have three lives: public, private, and secret' [!]${NC}"
        echo ""
        echo -e "${GREEN}[1] Privacy Tools${NC}"
        echo -e "${GREEN}[2] Security Tools${NC}"
        echo -e "${GREEN}[3] Exit${NC}"

        read -p "$(echo -e "${YELLOW}[?] Enter your choice: ${NC}")" choice

        case $choice in
            1)  privacy_menu ;;
            2)  security_menu ;;
            3)  echo -e "${GREEN}[*] bye.${NC}"
                exit 0 ;;
            *)  echo -e "${RED}[!] Choose the available option.${NC}" ;;
        esac

        read -p "$(echo -e "${GREEN}[*] Press [Enter] to return to the main menu...${NC}")"
    done
}


# Privacy menu function
privacy_menu() {
    while true; do
        clear
        echo "***************************************************************"
        echo "*                     Privacy Tools Menu                      *"
        echo "***************************************************************"
        echo ""
        echo -e "${GREEN}[1] Set Default DNS${NC}"
        echo -e "${GREEN}[2] Change Hostname${NC}"
        echo -e "${GREEN}[3] Change Timezone${NC}"
        echo -e "${GREEN}[4] MAC Changer${NC}"
        echo -e "${GREEN}[5] Shadow service (TOR network)${NC}"
        echo -e "${GREEN}[6] Riseup VPN${NC}"
        echo -e "${GREEN}[7] Manage Metadata${NC}"
        echo -e "${GREEN}[8] Back to Main Menu${NC}"

        read -p "$(echo -e "${YELLOW}[?] Enter your choice: ${NC}")" choice

        case $choice in
            1)  set_default_dns ;;
            2)  change_hostname ;;
            3)  change_timezone ;;
            4)  read -p "$(echo -e "${YELLOW}[?] Enter interface name (e.g., eth0, wlan0): ${NC}")" interface
                manage_mac "$interface" ;;
            5)  read -p "$(echo -e "${YELLOW}[?] Enter Shadow command (help/install/status/start/stop/restart): ${NC}")" shadow_command
                manage_shadow "$shadow_command" ;;
            6)  run_riseup_vpn ;;
            7)  manage_metadata ;;
            8)  return ;;
            *)  echo -e "${RED}[!] Choose the available option.${NC}" ;;
        esac

        read -p "$(echo -e "${GREEN}[*] Press [Enter] to return to the privacy tools menu...${NC}")"
    done
}

# Security menu function
security_menu() {
    while true; do
        clear
        echo "***************************************************************"
        echo "*                    Security Tools Menu                      *"
        echo "***************************************************************"
        echo ""
        echo -e "${GREEN}[1] Firewall${NC}"
        echo -e "${GREEN}[2] Monitor Network Traffic${NC}"
        echo -e "${GREEN}[3] Check File Integrity${NC}"
        echo -e "${GREEN}[4] Generate Strong Password${NC}"
        echo -e "${GREEN}[5] Run Rootkit Hunter${NC}"
        echo -e "${GREEN}[6] Back to Main Menu${NC}"

        read -p "$(echo -e "${YELLOW}[?] Enter your choice: ${NC}")" choice

        case $choice in
            1)  manage_firewall ;;
            2)  read -p "$(echo -e "${YELLOW}[?] Enter interface name to monitor (e.g., eth0, wlan0): ${NC}")" interface
                monitor_traffic "$interface" ;;
            3)  check_file_integrity ;;
            4)  read -p "$(echo -e "${YELLOW}[?] Enter desired password length: ${NC}")" password_length
                new_password=$(generate_password $password_length)
                echo "Your new strong password is: $new_password"
                ;;
            5)  run_rkhunter ;;
            6)  return ;;
            *)  echo -e "${RED}[!] Choose the available option.${NC}" ;;
        esac

        read -p "$(echo -e "${GREEN}[*] Press [Enter] to return to the security tools menu...${NC}")"
    done
}


main_menu
