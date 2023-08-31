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

        allFilesPath = [self.userProxy, self.wgetProxy, self.aptProxy, self.pipProxy]

        for file_path in allFilesPath:
            if not os.path.exists(file_path):
                dir_path = os.path.dirname(file_path)
                if not os.path.exists(dir_path):
                    os.makedirs(dir_path)
                with open(file_path, "w") as f:
                    pass
                print(f"File {file_path} does not exist and has been created.")
            else:
                print(f"File {file_path} exists already!")

        # writeToFiles(allFilesPath)


def writeUserProxy():
    pass


def writeWgetProxy():
    pass


def writeAptProxy():
    pass


def writePipProxy():
    pass


def writeToFiles():
    """Parent function to write to the various files"""
    writeUserProxy()
    writeWgetProxy()
    writeAptProxy()
    writePipProxy()

    


def info():
    proxy_server = input("Enter the IP of Proxy Server: ")
    proxy_port = int(input("Enter the port number: "))
    user_name = input("Enter the username: ")
    password = input("Enter the password: ")
    obj = Proxy(proxy_server, proxy_port, user_name, password)
    obj.createFiles()


if __name__=="__main__":
    """Requires sudo privileges to run the script"""
    info()
