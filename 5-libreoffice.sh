#!/bin/bash

## check for sudo/root
if ! [ $(id -u) = 0 ]; then
  echo -e "\e[1;31m Please run as sudo or root \e[0m"
  exit 1
fi

# Get username and make buliddr
username=$(id -u -n 1000)
builddr=$(pwd)

apt update

# libreoffice install
echo -e "\e[1;32m Installing libreoffice and its themes \e[0m"
apt install -y libreoffice-gtk3 libreoffice-impress libreoffice-calc libreoffice-writer -t bookworm-backports
apt install -y libreoffice-style* -t bookworm-backports

echo 
echo -e "\e[1;32m Rebooting now \e[0m"
sleep 5s
reboot
