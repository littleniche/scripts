# What is the Proxy Setup all about?

These scritps try to get internet working in the terminal in Debian-based distros. Since, when behind our college proxy, we were not able to ping any web-server. And updating the system or downloading any package was a distant goal. Using these scripts, I have made a small attempt to solve this problem and get fast internet for a CLI person like myself.

## Who can use it?

Anyone who is behind a proxy server and wants to access the internet from terminal, can use it. One may note though, the current version of proxy script uses those proxies which have user authentication and requires **password and username** for configuration.

## How to install?

- Clone the repository
```
git clone https://github.com/akshaykhoje/my_linux_scripts.git
```

- Navigate to Proxy directory
```
cd Proxy
```

- Make all the scripts executable
```
sudo chmod +x ./*.sh
```

- Run the proxy2.sh script with sudo privileges
```
sudo ./proxy2.sh
```

- Run the install.sh script with sudo privileges
```
sudo ./install.sh
```

## To uninstall the functionality 
```
sudo ./uninstall.sh
```

## How to use it?

- Turn proxy on
```
proxy on
```

- Turn proxy off
```
proxy off
```

## NOTE

### Feel free to use these scripts. If you find any bug or unexpected function taking place, kindly raise an issue in the Issues section.

#### Thank you! Have a great day!
