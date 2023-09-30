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

# Command to Install QEMU-KVM & Libvirt on Debian 12 Bookworm
apt install -y qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virtinst libvirt-daemon

# Virt-Manager GUI for KVM
apt install -y virt-manager

# Make Network active and auto-restart
virsh net-list --all
virsh net-start default
virsh net-autostart default

# Add “vhost_net”
modprobe vhost_net
lsmod | grep vhost


