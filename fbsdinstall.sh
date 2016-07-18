#!/bin/sh

currentdir=`pwd`

echo "***************************************"
echo " FreeBSD Unattended Install Script     "
echo "***************************************"
echo "-------------------------------"
echo "Install basic FreeBSD webserver"
echo "+ bash"
echo "+ sudo"
echo "+ vim"
echo "+ screen"
echo "+ htop"
echo "+ nginx"
echo "+ php"
echo ""
sleep 2
echo "===> Checking if we are root"
# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
   echo -e "[--] This script must be run as root" 1>&2
   exit 1
else
   echo -e "[++] We are root!!!...Continuing"
fi
echo "===> Updating ports tree"
portsnap fetch
sleep 2
echo "===> Extracting ports tree"
portsnap extract
sleep 2
echo "===> Updating package catalog"
pkg update
sleep 2
echo "===> Installing bash"
pkg install -y bash
sleep 2
echo "===> Mounting fdesc"
mount -t fdescfs fdesc /dev/fd
sleep 2
echo "===> Creating entry fstab"
echo "fdesc     /dev/fd         fdescfs         rw      0       0" >> /etc/fstab
sleep 2
echo "===> Installing sudo"
pkg install -y sudo
sleep 2
echo "===> Installing vim"
pkg install -y vim
sleep 2
echo "===> Installing screen"
pkg install -y screen
sleep 2
echo "===> Installing htop"
pkg install -y screen
echo "===> Installing nginx"
pkg install -y nginx
sleep 2
echo "===> Installing PHP"
pkg install -y php56
sleep 2
echo "===> Finishing install"
echo "**** Please update rc.conf to enable nginx, php_fpm"
echo "**** DONE!!!"
