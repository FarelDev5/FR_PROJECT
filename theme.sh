#!/bin/bash

# Warna dan Ikon
WHITE='\033[1;37m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
GREEN='\033[1;32m'
RED='\033[1;31m'
NC='\033[0m' # No Color
CHECK_MARK="\u2714"
CROSS_MARK="\u2718"
BATTERY_ICON="\U1F50B"  # Battery icon
STORAGE_ICON="\U1F4BE"  # Storage icon
IP_ICON="\U1F4F6"       # IP Address icon
INFO_ICON="\U1F6C8"     # Info icon
DEVICES_ICON="\U1F4BB"  # Laptop icon

# Fungsi untuk menampilkan tema
display_theme() {
    echo -e "${BLUE}"
    figlet "FR.PRJCT"  # Pastikan figlet sudah diinstal
    echo -e "${NC}"

    # Garis Pembatas
    echo -e "${CYAN}-----------------------------------------${NC}"

    # Informasi Pengguna
    echo -e "${CYAN}--- USER INFORMATION ${INFO_ICON} ---${NC}"
    echo -e "${WHITE}Author       : ${GREEN}Farel Alfareza${NC}"
    echo -e "${WHITE}Country      : ${GREEN}Indonesia${NC}"
    echo -e "${WHITE}IG/TikTok    : ${GREEN}@farel.project_5${NC}"
    echo -e "${WHITE}Date         : ${GREEN}$(date '+%Y-%m-%d %H:%M:%S')${NC}"
    echo -e "${CYAN}-----------------------------------------${NC}"

    # Informasi Perangkat
    echo -e "${CYAN}--- DEVICE INFORMATION ${DEVICES_ICON} ---${NC}"
    echo -e "${WHITE}Device Model : ${GREEN}$(getprop ro.product.model)${NC}"
    echo -e "${WHITE}Manufacturer : ${GREEN}$(getprop ro.product.manufacturer)${NC}"
    echo -e "${WHITE}Android Ver  : ${GREEN}$(getprop ro.build.version.release)${NC}"
    echo -e "${WHITE}Architecture : ${GREEN}$(uname -m)${NC}"
    echo -e "${WHITE}Processor    : ${GREEN}$(uname -p)${NC}"
    echo -e "${CYAN}-----------------------------------------${NC}"

    # Informasi Lainnya
    echo -e "${CYAN}--- ADDITIONAL INFORMATION ${INFO_ICON} ---${NC}"
    echo -e "${WHITE}${BATTERY_ICON} Battery   : ${GREEN}$(termux-battery-status | grep percentage | awk '{print $2}' | tr -d ',')%${NC}"
    echo -e "${WHITE}${STORAGE_ICON} Storage   : ${GREEN}$(df -h | grep '/data' | awk '{print $3 " used / " $2 " total"}')${NC}"
    echo -e "${WHITE}${IP_ICON} IP Address : ${GREEN}$(ip addr show wlan0 | grep 'inet ' | awk '{print $2}' | cut -d/ -f1)${NC}"
    echo -e "${CYAN}-----------------------------------------${NC}"

    # Menambahkan Animasi Ringan
    echo -e "${YELLOW}Fetching system information...${NC}"
    sleep 1
    echo -e "${YELLOW}Done!${NC}"
}

# Tampilkan tema
display_theme

# Prompt Modern
PS1="${CYAN}\u@\h${NC}:${GREEN}\w${NC}\n${BLUE}➤ ${NC}"
