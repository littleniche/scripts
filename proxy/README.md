## MOTIVATION BEHIND AUTOMATING PROXY 

I love to work from the terminal. However, in my college hostel, we have LAN connections. Students were unable to access the internet from the terminal. LAN could only be used for browsers. 
Thus to enable myself and others to use internet from the terminal, I thought of automating this stuff.


1. proxy_setup.sh is a shell script written in bash.
2. It is used to automate the tedious procedure of setting up a system-wide proxy.
3. This script also enables you to connect to the internet when behind a proxy from your TERMINAL. 
4. myproxy is a script for later use. Refer the section below to learn to use it. 

### HOW TO USE
```
Please manually setup the proxy in the Settings -> Network -> Network Proxy -> Manual -> "Enter your credentials"
```
```
Download the 'proxies' folder located at https://github.com/akshaykhoje/my_linux_scripts/tree/master/
```
```
cd proxy
```
I recommend reading the scripts and see what it's doing.
```
sudo chmod +x proxy_setup.sh
```
```
sudo ./proxy_setup.sh
```
```
source /etc/profile.d/proxy.sh
```
Enter credentials to the script and it'll be done in a minute.

### IMPROVEMENTS
Although it covers apt, wget and curl, it still needs to be configured for git(SSH), snap, flatpak, etc. 
Will work on this too soon. Community is most welcomed to use and contribute to this automation task.



<hr />

## WHY myproxy, another script?

Well after having configured the proxy for apt, wget and curl, I could use those utilities when connected to the LAN ONLY. 
So when I would be on a different network or a WiFi, I had to manually comment out those scripts by moving to their respective directories and putting a '#' on each line of those files. 
Ohh, a boring task!
Thus I thought of restricting this minute-ful of work to a one-line terminal command.


### HOW TO USE
```
cd proxy
```
```
sudo chmod +x myproxy
```
```
sudo mv ./myproxy /usr/local/bin/
```
```
To turn on proxy : 
myproxy on
source /etc/profile.d/proxy.sh
```
```
To turn off proxy :
myproxy off
source /etc/profile.d/unset_proxy.sh
```
<hr />

### HOW TO UNINSTALL
Download the script at the following link and run the command
```
https://github.com/akshaykhoje/my_linux_scripts/blob/master/proxy/uninstall.sh
```
Run the script to uninstall:
```
sudo ./uninstall.sh
```
##### Have a nice day! ☕🌞
