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

# Applications and utilities
echo -e "\e[1;32m Installing apps and utilities \e[0m"
apt install -y git pip ranger cmatrix espeak ncdu translate-shell rsync kdeconnect gpick

# yt-dlp
echo -e "\e[1;32m Installing yt-dlp \e[0m"
apt install -y yt-dlp -t bookworm-backports

# sensors
echo -e "\e[1;32m Installing sensors \e[0m"
apt install -y lm-sensors

# search applications
echo -e "\e[1;32m Installing rofi and dmenu \e[0m"
apt install -y rofi dmenu

# redshift
echo -e "\e[1;32m Installing redshift \e[0m"
apt install -y redshift

# synaptic package manager
echo -e "\e[1;32m Installing Synaptic Package Manager \e[0m"
apt install -y synaptic

# mintstick
echo -e "\e[1;32m Installing mint stick \e[0m"
apt install -y mintstick

# Text editor
echo -e "\e[1;32m Installing geany, micro and neovim \e[0m"
apt install -y geany micro neovim
git clone https://github.com/VundleVim/Vundle.vim.git /home/$username/.vim/bundle/Vundle.vim

# ani-cli
echo -e "\e[1;32m Installing ani-cli for anime lovers \e[0m"
apt install -y fzf
git clone "https://github.com/pystardust/ani-cli.git"
install ani-cli/ani-cli /usr/local/bin
rm -rf ani-cli

# Goolge Chrome
# echo -e "\e[1;32m Installing google chrome \e[0m"
curl -fSsL https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmor | tee /usr/share/keyrings/google-chrome.gpg >> /dev/null
echo deb [arch=amd64 signed-by=/usr/share/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main | tee /etc/apt/sources.list.d/google-chrome.list
apt update
apt install google-chrome-stable

# fast-cli
echo -e "\e[1;32m Installing fast-cli for Internet speed test \e[0m"
wget https://github.com/ddo/fast/releases/download/v0.0.4/fast_linux_amd64 -O fast
install fast /usr/local/bin
rm fast

# config files
echo -e "\e[1;32m Copying config files \e[0m"
cd /home/$username
git clone https://github.com/ankit90s/dotconfig && cd dotconfig
cp -r * /home/$username/.config
mkdir /root/.config
cp starship.toml /root/.config
chown -R $username:$username /home/$username
cd $builddr

echo 
echo -e "\e[1;32m Rebooting now \e[0m"
sleep 5s
reboot
