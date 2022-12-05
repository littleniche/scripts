#!/bin/bash

# firstly go to software and updates ->
# Other software tab and disable cdroms
# check the update settings
# Go to Debian software tab and check DFSG-compatible and Non-DFSG(non-free) softwares IF REQUIRED


# now you must not be able to use the sudo command. This is because the currently logged in user does not have the sudo priviliges. Hence make the following changes to /etc/sudoers

# su

# cd /etc
# nano ./sudoers

# uncomment the "Allow members of group sudo to execute any command"
# Add the following command in the "User privilege specification" below "root ALL=(ALL:ALL) ALL
# e.g. if user is abcd, then
# abcd	ALL=(ALL:ALL) ALL

#save the file and reboot the system

# now you can use the sudo command


sudo apt update
sudo apt install torbrowser-launcher vlc qbittorrent
sudo apt install git

# installing firewall GUI
sudo apt install gufw

# for audio
sudo apt install gstreamer1.0-pulseaudio
sudo apt install gstreamer1.0-alsa

# if you have nvidia graphics card, for setting it up
# sudo apt install nvidia-detect
# sudo nvidia-detect
# sudo apt install nvidia-driver nvidia-settings


# installing snap
sudo apt install snapd
sudo snap install core

# Enable and start snap daemon
sudo systemctl enable --now snapd


#install vscode from snap store
sudo snap install code --classic

#to help with invalid commands : 
sudo apt install command-not-found



# network tools
sudo apt install wireshark
sudo apt install nmap
sudo apt install wget


# installing mysql server and workbench on debina11
# download mysql-apt...deb file using wget ; latest version can be found on mysql website
# wget https://dev.mysql.com/get/mysql-apt-config_0.8.22-1_all.deb
# sudo dpkg -i mysql-apt-config_0.8.22-1_all.deb
# sudo apt-get install mysql-server
# sudo snap install mysql-workbench-community

#sync timedate between windows and debian
# Remove ntp package first by using
sudo apt purge ntp
sudo apt install systemd-timesyncd
#startup the timesyncd service
sudo systemctl start systemd-timesyncd
#check status 
sudo systemctl status systemd-timesyncd
# check date and time
timedatectl

# if you are facing time-sync issues between windows and linux, try this command
timedatectl set-local-rtc 1
# check current time with
timedatectl
