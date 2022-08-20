## MOTIVATION BEHIND AUTOMATING PROXY SETUP
```#### 
	I love to work from the terminal. However, in my college hostel, we have LAN connections. Students were unable to access the internet from the terminal. LAN could only be used for browsers. 
	Thus to enable myself and others to use internet from the terminal, I thought of automating this stuff.
```

1. proxy_setup.sh is a shell script written in bash.
2. It is used to automate the tedious procedure of setting up a system-wide proxy.
3. This script also enables you to connect to the internet when behind a proxy from your TERMINAL. 

### IMPROVEMENTS
```####	
	Although it covers apt, wget and curl, it still needs to be configured for git(SSH), snap, flatpak, etc. Will work on this too soon. Community is most welcomed to use and contribute to this automation task.
```


----------------------------------------------------------------------------------------------

## WHY myproxy?
```####
Well after having configured the proxy for apt, wget and curl, I could use those utilities when connected to the LAN ONLY. 
So when I would be on a different network or a WiFi, I had to manually comment out those scripts by moving to their respective directories and putting a '#' on each line of those files. Ohh, a boring task. 
Thus I thought of restricting this minute-ful of work to a one-line terminal command.
``` 



##### Have a nice day
