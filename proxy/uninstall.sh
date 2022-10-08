#!/bin/bash

# to uninstall apt proxy configuration
sudo rm /etc/apt/apt.conf.d/80proxy

# to uninstall wget proxy configurations
sudo rm /home/$USER/.wgetrc

# to uninstall system-wide proxy
sudo rm /etc/profile.d/proxy.sh
sudo rm /etc/profile.d/unset_proxy.sh


