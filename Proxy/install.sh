#!/bin/bash

echo "Beginning the installation process..."

file="/usr/local/bin/proxy"

if [ $# == 0 ];
then
	if [ -f "file" ];
	then
		sudo rm $file
		echo "Removing old $file"
	fi

	echo "Moving new proxy file at $file"
	sudo cp ./proxy.sh $file

	if [ -f $file ];
	then
		echo "Successfully installed proxy."
	fi
fi
