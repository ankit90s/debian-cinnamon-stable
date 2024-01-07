#!/bin/bash

## check for sudo/root
if ! [ $(id -u) = 0 ]; then
  echo -e "\e[1;31m Please run as sudo or root \e[0m"
  exit 1
fi

clear

# Get username
username=$(id -u -n 1000)
builddr=$(pwd)

# Copy Source file
echo -e "\e[1;32m Copying sources.list file \e[0m"
mv /etc/apt/sources.list /etc/apt/sources.list.bkp
cp sources.list /etc/apt/sources.list
apt update && apt upgrade -y
apt install -y aptitude

# Download Managers
echo -e "\e[1;32m Installing download managers \e[0m"
apt install -y wget axel aria2
apt install -y curl -t bookworm-backports

echo -e "\e[1;32m Installed exa \e[0m"
apt install -y exa 

echo -e "\e[1;32m Installed nvidia-detect \e[0m"
apt install -y nvidia-detect

echo -e "\e[1;32m Installed zip unzip 7zip \e[0m"
apt install -y zip unzip 7zip

echo -e "\e[1;32m Installed mpv \e[0m"
apt install -y mpv mpv-mpris

echo -e "\e[1;32m Installed conky nefetch htop \e[0m"
apt install -y conky neofetch htop

echo -e "\e[1;32m Installed clipboard manager diodon \e[0m"
apt install -y diodon

echo -e "\e[1;32m Installed cursor themes \e[0m"
apt install -y bibata-cursor-theme dmz-cursor-theme

echo -e "\e[1;32m Remove games and other packages \e[0m"
apt autoremove -y gnome-games anthy gedit shotwell hexchat pidgin remmina brasero cheese rhythmbox sound-juicer totem kasumi transmission-gtk

echo -e "\e[1;32m Install qbittorrent]"
apt install -y qbittorrent

echo -e "\e[1;32m Installed default terminal as alacritty \e[0m"
apt install -y alacritty
update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/bin/alacritty 200 && update-alternatives --set x-terminal-emulator /usr/bin/alacritty

echo -e "\e[1;32m Installed starship shell prompt \e[0m"
wget https://github.com/starship/starship/releases/latest/download/starship-x86_64-unknown-linux-musl.tar.gz
tar -xvzf starship-x86_64-unknown-linux-musl.tar.gz
mv starship /usr/local/bin
rm starship-x86_64-unknown-linux-musl.tar.gz

echo -e "\e[1;32m Installed pfetch \e[0m"
git clone https://github.com/dylanaraps/pfetch.git
cd pfetch
install pfetch /usr/local/bin
cd ..
rm -rf pfetch

echo -e "\e[1;32m Installing bashrc and bash aliases \e[0m"
cp bashrc /home/$username/.bashrc
cp bash_aliases /home/$username/.bash_aliases

cp bashrc-root /root/.bashrc
cp bash_aliases /root/.bash_aliases

# mkdir
echo -e "\e[1;32m Creating directory ISO in home folder \e[0m"
mkdir /home/$username/ISOs
chown -Rv $username:$username /home/$username/

echo -e "\e[1;32m Installed slick greeter \e[0m"
apt install -y slick-greeter lightdm-gtk-greeter-settings lightdm-settings numlockx
rm -rf /etc/lightdm
cp -r settings/lightdm /etc

# Copy grub file
echo -e "\e[1;32m Installed grub cfg file \e[0m"
rm /etc/default/grub
cp settings/grub /etc/default
update-grub

echo
echo -e "\e[1;32m Rebooting Now \e[0m"

sleep 5s
reboot
