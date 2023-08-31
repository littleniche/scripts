import os

class Proxy:
    def __init__(self, serverIP, serverPort, username, password):
        self.serverIP = serverIP
        self.serverPort = serverPort
        self.username = username
        self.password = password
    

    def createFiles(self):
        """Checks if the files exist. If not, creates them."""
        self.userProxy = "/etc/profile.d/proxy.sh"
        self.wgetProxy = "/etc/wgetrc"
        self.aptProxy = "/etc/apt/apt.conf.d/80proxy"
        linuxUserName = os.getenv('USER')
        self.pipProxy = "/home/" + linuxUserName + "/.config/pip/pip.conf"

        self.allFilesPath = [self.userProxy, self.wgetProxy, self.aptProxy, self.pipProxy]

        for file_path in self.allFilesPath:
            if not os.path.exists(file_path):
                dir_path = os.path.dirname(file_path)
                if not os.path.exists(dir_path):
                    os.makedirs(dir_path)
                with open(file_path, "w") as f:
                    pass
                print(f"File {file_path} does not exist and has been created.")
            else:
                print(f"File {file_path} exists already!")


    def writeToFiles(self):
        """Parent function to write to the various files"""
        self.writeUserProxy()
        self.writeWgetProxy()
        self.writeAptProxy()
        self.writePipProxy()


    def writeUserProxy(self):
        """Setup the proxy settings for user and curl"""
        print("-"*10)
        print("INSIDE writeUserProxy()")
        textBody = f"""export http_proxy="http://{self.username}:{self.password}@{self.serverIP}:{self.serverPort}/"
export https_proxy="http://{self.username}:{self.password}@{self.serverIP}:{self.serverPort}/"
export ftp_proxy="http://{self.username}:{self.password}@{self.serverIP}:{self.serverPort}/"
export no_proxy="127.0.0.1,localhost"


export HTTP_PROXY="http://{self.username}:{self.password}@{self.serverIP}:{self.serverPort}/"
export HTTPS_PROXY="http://{self.username}:{self.password}@{self.serverIP}:{self.serverPort}/"
export FTP_PROXY="http://{self.username}:{self.password}@{self.serverIP}:{self.serverPort}/"
export NO_PROXY="127.0.0.1,localhost"
"""
        
        with open(self.userProxy, "w") as f:
            f.write(textBody)


    def writeWgetProxy(self):
        print("-"*10)
        print("INSIDE writeWgetProxy()")
        textBody = f"""use_proxy = on
http_proxy = http://{self.username}:{self.password}@{self.serverIP}:{self.serverPort}/
https_proxy = http://{self.username}:{self.password}@{self.serverIP}:{self.serverPort}/
ftp_proxy = http://{self.username}:{self.password}@{self.serverIP}:{self.serverPort}/
"""

        with open(self.wgetProxy, "w") as f:
            f.write(textBody)


    def writeAptProxy(self):
        print("-"*10)
        print("INSIDE writeAptProxy()")
        textBody = f"""Acquire::http::proxy "http://{self.username}:{self.password}@{self.serverIP}:{self.serverPort}/";
Acquire::https::proxy "http://{self.username}:{self.password}@{self.serverIP}:{self.serverPort}/";
Acquire::ftp::proxy "http://{self.username}:{self.password}@{self.serverIP}:{self.serverPort}/";
"""

        with open(self.aptProxy, "w") as f:
            f.write(textBody)


    def writePipProxy(self):
        print("-"*10)
        print("INSIDE writePipProxy()")
        textBody=f"http://{self.username}:{self.password}@{self.serverIP}:{self.serverPort}";

        with open(self.pipProxy, "w") as f:
            f.write(textBody)


def info():
    proxy_server = input("Enter the IP of Proxy Server: ")
    proxy_port = int(input("Enter the port number: "))
    user_name = input("Enter the username: ")
    password = input("Enter the password: ")
    obj = Proxy(proxy_server, proxy_port, user_name, password)
    obj.createFiles()
    obj.writeToFiles()
    print("Finished!")


if __name__=="__main__":
    """Requires sudo privileges to run the script"""
    info()
