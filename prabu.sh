#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

source sources/default_dns
source sources/change_hostname
source sources/manage_mac
source sources/shadow_service
source sources/run_riseup_vpn
source sources/manage_firewall
source sources/monitor_traffic
source sources/check_file_integrity
source sources/manage_metadata
source sources/change_timezone
source sources/display_error_message

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
        echo -e "${GREEN}[1] Set Default DNS for Privacy${NC}"
        echo -e "${GREEN}[2] Change Hostname${NC}"
        echo -e "${GREEN}[3] Change Timezone${NC}"
        echo -e "${GREEN}[4] MAC Changer${NC}"
        echo -e "${GREEN}[5] Shadow service (TOR network)${NC}"
        echo -e "${GREEN}[6] Riseup VPN${NC}"
        echo -e "${GREEN}[7] Firewall${NC}"
        echo -e "${GREEN}[8] Manage Metadata${NC}"
        echo -e "${GREEN}[9] Monitor Network Traffic${NC}"
        echo -e "${GREEN}[10] Check File Integrity${NC}"
        echo -e "${GREEN}[11] Exit${NC}"

        read -p "$(echo -e "${YELLOW}[?] Enter your choice: ${NC}")" choice

        case $choice in
            1)
                set_default_dns
                ;;
            2)
                change_hostname
                ;;
            3)
                change_timezone
                ;;
            4)
                read -p "$(echo -e "${YELLOW}[?] Enter interface name (e.g., eth0, wlan0): ${NC}")" interface
                manage_mac "$interface"
                ;;
            5)
                read -p "$(echo -e "${YELLOW}[?] Enter Shadow command (help/install/status/start/stop/restart): ${NC}")" shadow_command
                manage_shadow "$shadow_command"
                ;;
            6)
                run_riseup_vpn
                ;;
            7)
                manage_firewall
                ;;
            8)
                manage_metadata
                ;;
            9)
                read -p "$(echo -e "${YELLOW}[?] Enter interface name to monitor (e.g., eth0, wlan0): ${NC}")" interface
                monitor_traffic "$interface"
                ;;
            10)
                check_file_integrity
                ;;
            11)
                echo -e "${GREEN}[*] You don't have privacy.${NC}"
                exit 0
                ;;

            *)
                echo -e "${RED}[!] Choose the available option.${NC}"
                ;;
        esac

        read -p "$(echo -e "${GREEN}[*] Press [Enter] to return to the main menu...${NC}")"
    done
}

main_menu