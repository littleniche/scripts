# !/bin/sh


echo "!!!You have to be a root user to be able to run all the commands!!!  "
echo "If you are not ,check the source code to get the priviledges"
# Uncomment the following code and enter the root password
# su

# To set the fastest mirror uncomment the following command and add "fastestmirror=true" at the end of the file
# sudo gedit /etc/dnf/dnf.conf



#### Basic Stuff(2) ------
#update packages
sudo dnf update


#upgrade packages
sudo dnf upgrade



#### Package repositories(4) ------
#Install snap
sudo dnf install snapd
sudo ln -s /var/lib/snapd/snap /snap


#Enable rpm fusion repo
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm



# Add RPM-fusion non-free repository
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm


# Install Flatpak 
sudo dnf install fedmod
sudo dnf install flatpak-module-tools
sudo usermod -a -G mock $USER
flatpak remote-add fedora-testing oci+https://registry.fedoraproject.org#testing
flatpak remote-modify --enable fedora-testing
sudo wget https://flathub.org/repo/flathub.flatpakrepo

# For some reason, the following command can work alone on GNOME and KDE Fedora installation. If it fails for some reason add Fathub remote manually with the following command.
# flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo


#### System changes(1) ------
echo "Ensure that timezone is set correctly in fedora!!"
# If timezone is not set correctly , uncomment the following command and replace <Continent/City> with your corresponding info
# timedatectl set-timezone <Continent/City>

# Fix time in Fedora
timedatectl set-local-rtc 1



#### Tools(2) ------
#Install git
sudo dnf install git-all


# If you are running a GNOME Environment uncomment the following code to install GNOME-tweaks
sudo dnf install gnome-tweaks



#### Text editors/IDE(3) ------
#Install vscode
sudo ln -s /var/lib/snapd/snap /snap
sudo snap install code --classic

# Install vim editor
sudo dnf install vim-enhanced 


# Install micro editor
sudo snap install micro --classic


#### Video players(1) ------
#Install vlc
sudo dnf install vlc



#### Browsers(1) ------
# Install google-chrome
sudo dnf install fedora-workstation-repositories
sudo dnf config-manager --set-enabled google-chrome
sudo dnf install google-chrome-stable



#### Newtork commands(1) ------
#Install wget
sudo dnf install wget



#### Social Media(2) ------ (Uncomment to use)
# Install signal-desktop
# sudo snap install signal-desktop


# Install Discord-desktop
# sudo dnf install discord



#### Image Editing(1) ------ (Uncomment to use)
# Install  Gnu Image Manipulation Pragram (GIMP)
sudo dnf install gimp



#### Commands(1) ------
# Install and run neofetch 
sudo dnf install neofetch
neofetch
