#!/bin/bash

global_proxy="/etc/profile.d/proxy.sh"
wget_proxy="/etc/wgetrc"
apt_proxy="/etc/apt/apt.conf.d/80proxy"


greeting()
{
	echo "------------------------------------------------------------------------------"
	echo "			  PROXY INSTALLATION PROGRAM!!!			     "
	echo -e "------------------------------------------------------------------------------\n"	
}


createFiles()
{
	if [ ! -f $global_proxy ];
	then
		touch /etc/profile.d/proxy.sh
	fi
	
	if [ ! -f $wget_proxy ]; 
	then
		touch /etc/apt/apt.conf.d/80proxy
	fi

	if [ ! -f $apt_proxy ];
	then
		touch /etc/wgetrc
	fi
}


userInfo()
{
	echo "Initializing proxy setup process..."
	read -p "Enter IP address of PROXY SERVER : " proxy_server
	read -p "Enter the port number : " port
	read -p "Enter the username : " username
	read -p "Enter the password : " password
}


globeAndCurl()
{
	cat <<EOF > $global_proxy
export http_proxy="http://$username:$password@$proxy_server:$port/"
export https_proxy="http://$username:$password@$proxy_server:$port/"
export ftp_proxy="http://$username:$password@$proxy_server:$port/"
export no_proxy="127.0.0.1,localhost"

export HTTP_PROXY="http://$username:$password@$proxy_server:$port/"
export HTTPS_PROXY="http://$username:$password@$prox_server:$port/"
export FTP_PROXY="http://$username:$password@$proxy_server:$port/"
export NO_PROXY="127.0.0.1,localhost"	
EOF
}


wgetRC()
{
	cat <<EOF > $wget_proxy
use_proxy = on
http_proxy = http://$username:$password@$proxy_server:$port/
https_proxy = http://$username:$password@$proxy_server:$port/
ftp_proxy = http://$username:$password@$proxy_server:$port/
EOF
}


aptProxy()
{
	cat <<EOF > $apt_proxy
Acquire::http::proxy "http://$username:$password@$proxy_server:$port/";
Acquire::https::proxy "http://$username:$password@$proxy_server:$port/";
Acquire::ftp::proxy "http://$username:$password@$proxy_server:$port/";
EOF
}


greeting
createFiles
userInfo
globeAndCurl
wgetRC
aptProxy
