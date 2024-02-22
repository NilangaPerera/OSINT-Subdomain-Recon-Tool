#!/bin/bash

BIBlue="\033[1;94m"
Yellow="\033[0;33m"


# This command will update the packages:
echo -e "${BIBlue} [+] Updating packages..."
apt update

# This command will install whois tool:
echo -e "${BIBlue} [+] Installing whois..."
apt install whois

# This command will install sublist3r tool:
echo -e "${BIBlue} [+] Installing sublist3r..."
apt install sublist3r

# This command will install subfinder tool:
echo -e "${BIBlue} [+] Installing subfinder..."
apt install subfinder

# This command will install assetfinder tool:
echo -e "${BIBlue} [+] Installing assetfinder..."
apt install assetfinder

# This command will install amass tool:
echo -e "${BIBlue} [+] Installing amass..."
apt install amass

# This command will install httprobe tool:
echo -e "${BIBlue} [+] Installing httprobe..."
apt install httprobe

# This command will install eyewitness tool:
echo -e "${BIBlue} [+] Installing eyewitness..."
apt install eyewitness


echo -e "${Yellow} [+] Installation has been successfully completed!"
