#!/bin/bash

#System and database update
sudo pacman -Syyu

#reflector to select the fastest pacman mirrorlist
#backup your /etc/pacman.d/mirrorlist before using reflector, it can be done by
#sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
sudo pacman -S reflector rsync curl
sudo reflector --latest 20 --protocol https --sort rate --save /etc/pacman.d/mirrorlist

#If you only have a tty,then you might want to install a display manager, a desktop enviroment and NetworkManager
#gnome
sudo pacman -S --needed xorg
sudo pacman -S --needed gnome gnome-tweaks nautilus-sendto gnome-nettool gnome-usage gnome multi-writer adwaita-icon-theme chrome-gnome-shell xdg-user-dirs-gtk fwupd arc-gtk-theme seahosrse gdm
sudo systemctl enable gdm
sudo systemctl enable NetworkManager
##
#kde
#sudo pacman -S sddm
#sudo pacman -S xorg plasma kde-applications
#sudo systemctl enable sddm.service
#sudo systemctl enable NetworkManager.service

#Installtion of necessary developer packages
sudo pacman -S --needed base-devel

#Installation of an AUR helper -- paru
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

paru

#Installation of firefox
paru -S firefox

#Install vim nano
sudo pacman -S vim nano

#Installtion of firewall
sudo pacman -S gufw
sudo ufw enable

#avoid using snap on arch, AUR usually has all the required packages available https://aur.archlinux.org/

#Other packages
paru -S flatpak find-the-command nmap wireshark-gtk2 code vlc ark

#If issues occur during install kindly raise an issue