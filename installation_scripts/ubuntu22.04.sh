#!/bin/bash

# go to software and updates and tick all the four "Downloadable from the Internet"

sudo apt-get update && sudo apt-get upgrade -y

# Install a prettier and feature rich alternative to apt
sudo apt install nala
cat apt-to-nala >> ~/.bashrc

#Install a multiple terminal alternative: Terminator for simple terminal
sudo apt install terminator

# If you're unable to play media codecs, uncomment the following lines
sudo apt install ubuntu-restricted-extras

# Check your "Software Updates" settings.

# For extra customization and extensions
sudo add-apt-repository universe
sudo apt install gnome-tweaks

# Install firewall
sudo apt-get install gufw
sudo ufw enable

# Install a better package manager - Synaptic
sudo apt-get install synaptic

sudo apt install git

sudo apt install wireshark

# Install snapd and snap
sudo apt install snapd
sudo snap install core

# Enable and start snapd
sudo systemctl enable --now snapd

#Install snap-store
sudo snap install snap-store

# Install vscode
sudo snap install code --classic

# Install vlc
sudo snap install vlc

# Install flatpak
sudo apt-get install flatpak
sudo apt-get install gnome-software-plugin-flatpak
# flatpak remote-add --if-not-exists flathub https://flathub-org/repo/flathub.flatpakrepo


