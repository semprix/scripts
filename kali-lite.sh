#!/bin/bash

# Kali Lite package installer
# author: @semprix

currentdir=`pwd`

echo -e "\e[38;5;82m===>\e[0m Checking if run as root"
# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
   echo -e "\e[31m[--] This script must be run as root\e[0m" 1>&2
   exit 1
else
   echo -e "\e[38;5;82m[++]\e[0m We are root!!!"
fi
echo -e "\e[38;5;82m===>\e[0m Updating package tree"
sleep 3
# Update tree
apt-get update

# Set locale first to prevent locale errors
echo -e "\e[38;5;82m===>\e[0m Exporting locale"
export LC_ALL=C

# Install sudo
echo -e "\e[38;5;82m===>\e[0m Installing sudo"
sleep 2
apt-get -y install sudo
sleep 2

# Install sudo
echo -e "\e[38;5;82m===>\e[0m Installing screen"
sleep 2
apt-get -y install screen
sleep 2

# Install Python pip
echo -e "\e[38;5;82m===>\e[0m Installing pip"
sleep 2
apt-get -y install python-pip
sleep 2
# Upgrade Python pip
echo -e "\e[38;5;82m===>\e[0m Upgrading pip"
sleep 2
pip install --upgrade pip
sleep 2
# Install unzip
echo -e "\e[38;5;82m===>\e[0m Installing unzip"
sleep 2
apt-get -y install unzip
sleep 2
# Install git
echo -e "\e[38;5;82m===>\e[0m Installing Git "
sleep 2
apt-get -y install git
sleep 2
# Install curl
echo -e "\e[38;5;82m===>\e[0m Installing cURL "
sleep 2
apt-get -y install curl
sleep 2
# Install tools
echo -e "\e[38;5;82m*******************\e[0m"
echo -e "\e[38;5;82m Installing tools  \e[0m"
echo -e "\e[38;5;82m*******************\e[0m"
echo ""
echo -e "\e[38;5;82m===>\e[0m Installing Metasploit"
sleep 2
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && chmod 755 msfinstall && ./msfinstall
echo -e "\e[38;5;82m===>\e[0m Installing dirb"
sleep 2
apt-get -y install dirb
echo -e "\e[38;5;82m===>\e[0m Installing dnsenum"
sleep 2
apt-get -y install dnsenum
echo -e "\e[38;5;82m===>\e[0m Installing dnsmap"
sleep 2
apt-get -y install dnsmap
echo -e "\e[38;5;82m===>\e[0m Installing dnswalk"
sleep 2
apt-get -y install dnswalk
echo -e "\e[38;5;82m===>\e[0m Installing enum4linux"
sleep 2
apt-get -y install enum4linux
echo -e "\e[38;5;82m===>\e[0m Installing exploitdb"
sleep 2
apt-get -y install exploitdb
echo -e "\e[38;5;82m===>\e[0m Installing firewalk"
sleep 2
apt-get -y install firewalk
echo -e "\e[38;5;82m===>\e[0m Installing hashcat"
sleep 2
apt-get -y install hashcat
echo -e "\e[38;5;82m===>\e[0m Installing john"
sleep 2
apt-get -y install john
echo -e "\e[38;5;82m===>\e[0m Installing joomscan"
sleep 2
apt-get -y install joomscan
echo -e "\e[38;5;82m===>\e[0m Installing nikto"
sleep 2
apt-get -y install nikto
echo -e "\e[38;5;82m===>\e[0m Installing responder"
sleep 2
apt-get -y install responder
echo -e "\e[38;5;82m===>\e[0m Installing skipfish"
sleep 2
apt-get -y install skipfish
echo -e "\e[38;5;82m===>\e[0m Installing sslyze"
sleep 2
apt-get -y install sslyze
echo -e "\e[38;5;82m===>\e[0m Installing uniscan"
sleep 2
apt-get -y install uniscan
echo -e "\e[38;5;82m===>\e[0m Installing wpscan"
sleep 2
apt-get -y install wpscan

echo ""
echo -e "\e[38;5;82m===>\e[0m Adding ROOTCON Seclist"
sleep 2
echo -e "\e[38;5;82m===>\e[0m Checking for wordlist folder"
if [ ! -d /usr/local/share/wordlist ]; then
    mkdir -p /usr/local/share/wordlist
else
    echo -e "\e[38;5;82m===>\e[0m Cloning Seclist to /usr/local/share/wordlist"
git clone https://github.com/ROOTCONLabs/SecLists.git /usr/local/share/wordlist
sleep 2
echo "\e[38;5;82m******\e[0m Done!"
