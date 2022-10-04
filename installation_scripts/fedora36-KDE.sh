#!/bin/sh

#update packages

sudo dnf update

#upgrade packages

sudo dnf upgrade

#Install snap

sudo dnf install snapd

#Install vscode

sudo ln -s /var/lib/snapd/snap /snap
sudo snap install code --classic

#Install git

sudo dnf install git-all

#Install vlc

sudo dnf install vlc

#Enable rpm fusion repo

sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

