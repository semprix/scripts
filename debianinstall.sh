#!/bin/bash
# Fast deployment script
#

currentdir=`pwd`

echo -e "\e[38;5;82m********************************\e[0m"
echo -e "\e[38;5;82m Debian Fast Deployment script  \e[0m"
echo -e "\e[38;5;82m********************************\e[0m"
echo ""
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
# Stage 1 Installation
# Install sudo
echo -e "\e[38;5;82m===>\e[0m Installing sudo"
sleep 2
apt-get -y install sudo
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
# Install vim
echo -e "\e[38;5;82m===>\e[0m Installing vim"
sleep 2
apt-get -y install vim
# Install multitail
echo -e "\e[38;5;82m===>\e[0m Installing multitail"
sleep 2
apt-get -y install multitail
# Install nginx
echo -e "\e[38;5;82m===>\e[0m Installing nginx"
sleep 2
apt-get -y install nginx
# Install multitail
echo -e "\e[38;5;82m===>\e[0m Installing php-fpm"
sleep 2
apt-get -y install php-fpm
echo "===> Finishing install"
echo "**** DONE!!!"
