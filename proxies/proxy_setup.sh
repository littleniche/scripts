#!/bin/bash

echo "-------------------------------------------------------------"
echo "Welcome to the proxy setup program!"
echo "-------------------------------------------------------------"
echo ""

echo "Initializing proxy setup process..."
echo "Enter the IP address for your proxy server : "
read proxy
echo "Enter the port number : "
read port
echo "Enter the username (your MIS) : "
read username
echo "Enter the password : "
read password

echo "display information given so far..."
echo "proxy : $proxy, port : $port, username : $username, password : $password"

if [[ -z $proxy ]] || [[ -z $port ]] || [[ -z username ]] || [[ -z password ]]; then
	echo "Please enter the proper credentials"
	exit 0
fi

echo "NOTE :

The proxy setup requires to be done in 4 phases - 

1. Manually configuring the proxy in Settings -> Network -> Network Proxy -> Manual -> \"Enter credentials\"
2. Set system-wide proxy settings 
3. Set proxy for APT package manager
4. Set proxy for wget CLI only

You need to complete the first step before moving to the second before you can actually connect to the internet from the terminal or even browser when behind a proxy.

Manually fill in the proxy settings as told above.

The steps 2, 3 and 4 have been automated using this interactive script written in bash. 

Let's begin...
"

echo "Setting up global proxy in /etc/profile.d/proxy.sh"

touch /etc/profile.d/proxy.sh       
path_to_global_proxy="/etc/profile.d/proxy.sh"    

cat <<EOF > $path_to_global_proxy
# set proxy config via profile.d - should apply for all users
# For http/https/ftp/no_proxy


export http_proxy="http://$username:$password@$proxy:$port/"
export https_proxy="http://$username:$password@$proxy:$port/"
export ftp_proxy="http://$username:$password@$proxy:$port/"
export no_proxy="127.0.0.1,localhost"


# For curl
export HTTP_PROXY="http://$username:$password@$proxy:$port/"
export HTTPS_PROXY="http://$username:$password@$proxy:$port/"
export FTP_PROXY="http://$username:$password@$proxy:$port/"
export NO_PROXY="127.0.0.1,localhost"
EOF

echo "The proxy file created needs to be sourced. Do you wish to continue? (y/n)"
read choice
if [ $choice = 'y' ]; then 
	source $path_to_global_proxy
	echo "To check if the proxy variables have been initialized, enter the following command on the terminal : "
	echo "env | grep -i proxy"
elif [ $choice = 'n' ]; then
	sudo rm $path_to_global_proxy
	echo "\\n exiting..."
	exit 0
fi

echo "
Completed step 2. Initializing step 3."

touch /etc/apt/apt.conf.d/80proxy       

apt_proxy="/etc/apt/apt.conf.d/80proxy"	

cat <<EOF > $apt_proxy
Acquire::http::proxy "http://$username:$password@$proxy:$port/";
Acquire::https::proxy "http://$username:$password@$proxy:$port/";
Acquire::ftp::proxy "http://$username:$password@$proxy:$port/";
EOF

echo "
Completed step 3. Initializing the final step."

sudo touch ~/.wgetrc       

wget_proxy="~/.wgetrc"	
sudo touch ./tocopy

cat <<EOF > $wget_proxy
use_proxy = on
http_proxy = http://$username:$password@$proxy:$port/
https_proxy = http://$username:$password@$proxy:$port/
ftp_proxy = http://$username:$password@$proxy:$port/
EOF

cat <<EOF > ./tocopy
use_proxy = on
http_proxy = http://$username:$password@$proxy:$port/
https_proxy = http://$username:$password@$proxy:$port/
ftp_proxy = http://$username:$password@$proxy:$port/
EOF


if [ ! -f "~/.wgetrc" ]; then
	echo "Cannot create .wgetrc file in the home directory
	"
	echo "Please follow the following instructions to setup wget proxy
	"
	echo "cd ~"
	echo "sudo touch .wgetrc"
	echo "copy paste the contents of tocopy file created in the proxies folder to ~/.wgetrc folder manually"
	echo "Delete the tocopy file after copying by typing sudo rm tocopy inside the proxies folder"
else
	echo "Completed the final step"
fi


echo "--------------------------------------------------------------------------------------"

echo "
Since you are behind a proxy server, you cannot use the ping command. So you have to install httping to ensure that your proxy server is running."

echo "
Install httping using \"sudo apt install httping\"."

echo "
Now try running the following commands to check that your proxy is up and running:"

echo "
httping -x <proxy>:<port> -g google.com"

echo "
Check your curl and wget by trying out those commands"

echo "
In case of any issues/errors, feel free to contact."

echo "
Thank you!"

exit 0

