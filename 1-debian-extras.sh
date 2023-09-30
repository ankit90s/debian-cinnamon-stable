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

# fonts
echo -e "\e[1;32m Installing system fonts \e[0m"
apt install -y fonts-indic \
    fonts-noto-color-emoji \
    fonts-roboto fonts-ubuntu \
    fonts-ubuntu-title \
    fonts-ubuntu-console \
    unifont \
    fonts-dosis \
    fonts-cantarell

# Material Design Icon Fonts
echo -e "\e[1;32m Installing material fonts for mpv \e[0m"
mkdir -p /usr/share/fonts/Material-fonts
wget https://github.com/zavoloklom/material-design-iconic-font/releases/download/2.2.0/material-design-iconic-font.zip
unzip material-design-iconic-font.zip -d /usr/share/fonts/Material-fonts/
rm -f material-design-iconic-font.zip
fc-cache -fv

# Microsoft fonts
echo -e "\e[1;32m Installing Microsoft fonts \e[0m"
apt install -y fonts-crosextra-carlito fonts-crosextra-caladea

# Nerd fonts
echo -e "\e[1;32m Installing nerd fonts \e[0m"
cd /tmp
fonts=( 
"FiraCode" 
"JetBrainsMono" 
"RobotoMono" 
"UbuntuMono"
"SauceCodePro"
)

for font in ${fonts[@]}
do
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/$font.zip
    unzip $font.zip -d /usr/share/fonts/$font/
    rm $font.zip
done
fc-cache -fv

# Restricted extras
echo -e "\e[1;32m Installing restricted extras \e[0m"
apt install -y ttf-mscorefonts-installer rar unrar libavcodec-extra gstreamer1.0-libav gstreamer1.0-plugins-ugly gstreamer1.0-vaapi

# Network File Tools/System Events
echo -e "\e[1;32m Network File Tools and System Events \e[0m"
apt install -y dialog mtools dosfstools avahi-daemon acpi acpid gvfs-backends locate mtp-tools

systemctl enable avahi-daemon
systemctl enable acpid

# Mesa and vulkan support
echo -e "\e[1;32m Installing mesa and vulkan support \e[0m"
apt install -y mesa-vulkan-drivers libvulkan1 vulkan-tools vulkan-validationlayers

# install build tools
echo -e "\e[1;32m Installing build tools \e[0m"
apt install -y build-essential linux-headers-$(uname -r)

echo 
echo -e "\e[1;32m Rebooting please wait \e[0m"
sleep 5s
reboot
