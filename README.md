# OSINT-Subdomain-Recon-Tool

I have created this tool to automate the subdomain enumeration process to identify all the valid subdomains which can be used when conducting OSINT and Phishing assessments.

This tool identifies all the subdomains for a given domain name and filter out all the valid subdomains and screenshot each subdomain and output them to a nice single HTML file. Also, each output file is saved separately within the newly created directory.  

Used the following well known tools to build this automation (whois, sublist3r, subfinder, assetfinder, amass, httprobe, and eyewitness) and many thanks go to the developers of each tool.  

I have tested this tool on Kali Linux distribution and should work on any other Linux/Debian distributions without any issues.

Enjoy the tool...!


![Screen Shot 2022-07-27 at 1 12 29 am](https://user-images.githubusercontent.com/6763366/194764961-07bb6b95-935c-4ace-9dfc-4309e57c3815.png)


# Installation

**Download the files:**
```bash
git clone https://github.com/NilangaPerera/OSINT-Subdomain-Recon-Tool.git
```

**Navigate to the tools directory:**
```bash
cd OSINT-Subdomain-Recon-Tool
```

**Install all the required Application Packages:**
```bash
sudo bash install.sh
```


# Usage
```bash
bash osint-subdom-recon.sh <domain.com.au>
```

