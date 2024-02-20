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

echo -e "\e[1;32m Installing albert launcher \e[0m"

echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/Debian_12/ /' | tee /etc/apt/sources.list.d/home:manuelschneid3r.list
curl -fsSL https://download.opensuse.org/repositories/home:manuelschneid3r/Debian_12/Release.key | gpg --dearmor | tee /etc/apt/trusted.gpg.d/home_manuelschneid3r.gpg > /dev/null
apt update
apt install -y albert
