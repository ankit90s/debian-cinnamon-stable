#! /bin/bash

# check for sudo/root
if ! [ $(id -u) = 0 ]; then
  echo -e "\e[1;31m Please run as sudo or root \e[0m"
  exit 1
fi

# wallpapers
wget https://gitlab.com/dwt1/wallpapers/-/archive/master/wallpapers-master.zip
unzip wallpapers-master.zip -d /usr/share/images/
rm wallpapers-master.zip
