#!/bin/bash
#####################################################################################
### Created this tool to automate the process of subdomain enumeration for OSINT. ###
### Created the automation by Nilanga Perera. 					  ###
### Many thanks goes to the developers who created the great tools below, 	  ###
### whois, sublist3r, subfinder, assetfinder, amass, httprobe, and eyewitness. 	  ###
##################################################################################### 

BIBlue="\033[1;94m"

echo -e "${BIBlue}"
echo -e "
============================================================================
############################################################################
####									####
####	┏━┓┏━┓╻┏┓╻╺┳╸   ┏━┓╻ ╻┏┓ ╺┳┓┏━┓┏┳┓┏━┓╻┏┓╻   ┏━┓┏━╸┏━╸┏━┓┏┓╻	####
####	┃ ┃┗━┓┃┃┗┫ ┃    ┗━┓┃ ┃┣┻┓ ┃┃┃ ┃┃┃┃┣━┫┃┃┗┫   ┣┳┛┣╸ ┃  ┃ ┃┃┗┫	####
####	┗━┛┗━┛╹╹ ╹ ╹    ┗━┛┗━┛┗━┛╺┻┛┗━┛╹ ╹╹ ╹╹╹ ╹   ╹┗╸┗━╸┗━╸┗━┛╹ ╹	####
####					Automated by Nilanga Perera.	####
####									####
############################################################################
============================================================================
"
echo -e "${BIBlue}"


target_domain=$1
Yellow="\033[0;33m"

info_path=$target_domain/info
subdomain_path=$target_domain/subdomains
eyewitness_info=$target_domain/eyewitness

if [ ! -d "$target_domain" ];then
    mkdir "$target_domain"
fi 

if [ ! -d "$info_path" ];then
    mkdir "$info_path"
fi 

if [ ! -d "$subdomain_path" ];then
    mkdir "$subdomain_path"
fi 


# whois tool
echo -e "${Yellow} [+] Launching whois..."
whois $1 > $info_path/whois.txt

# sublist3r tool
echo -e "${Yellow} [+] Launching sublist3r..."
sublist3r -v -d $target_domain -o $subdomain_path/found.txt -n

# subfinder tool
echo -e "${Yellow} [+] Launching subfinder..."
subfinder -d $target_domain >> $subdomain_path/found.txt -nC

# assetfinder tool
echo -e "${Yellow} [+] Launching assetfinder..."
assetfinder $target_domain | grep $target_domain >> $subdomain_path/found.txt

# amass tool - This tool takes longet to run
echo -e "${Yellow} [+] Launching OWASP Amass..."
amass enum -d $target_domain >> $subdomain_path/found.txt

# httprobe tool
echo -e "${Yellow} [+] Launching httprobe..."
cat $subdomain_path/found.txt | grep $target_domain | sort -u | httprobe -p -prefer-https | grep https | sed 's/https\?:\/\///' | tee -a $subdomain_path/alive.txt

# Re-sorting to remove the doubleups
echo -e "${Yellow} [+] Sorting Subdomains..."
cat $subdomain_path/alive.txt | grep $target_domain | sort -u > $subdomain_path/alive-sort.txt

# eyewitness tool
echo -e "${Yellow} [+] Launching EyeWitness..."
eyewitness -d $eyewitness_info -f $subdomain_path/alive-sort.txt --only-ports 443 --timeout 10
