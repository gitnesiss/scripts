#!/bin/bash

# sudo snap remove snap-store
# sudo snap install snap-store
sudo apt-get install gnome-software -y

sudo apt-get install -y gparted

sudo apt install smartmontools

sudo add-apt-repository universe
sudo apt install libfuse2

# sudo apt install flatpak -y

sudo add-apt-repository ppa:flatpak/stable
sudo add-apt-repository ppa:alexlarsson/flatpak
sudo apt update -y
sudo apt install flatpak -y

sudo apt install gnome-software-plugin-flatpak

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "Download BalenaEatcher from site OrangePi"

read -s -n 1 # 

sudo fdisk -l #gjcvjnhtnm dct hfpvths lbcrjd

ls /dev/nvme*
sudo sfdisk -l /dev/nvme*
sudo file -sL /dev/nvme0n1p1 # filesystem
sudo file -sL /dev/nvme0n1p2

shutdown -r now

sudo dd if=/lib/u-boot-orangepi-rk3588/rkspi_loader.img of=/dev/mtdblock0 conv=notrunc

