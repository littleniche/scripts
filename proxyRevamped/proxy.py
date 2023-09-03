import os
import sys
import shutil


def snap():
    """Use the following commands to make snap available behind proxy"""
    print("-"*50)
    print("To setup the snap proxy, run the following commands in terminal:")
    print('sudo snap set system proxy.http=$http_proxy')
    print('sudo snap set system proxy.https=$http_proxy')

    print("-"*50)
    print("\nTo unset the snap proxy, run the following commands in terminal:")
    print("sudo snap unset system proxy.http")
    print("sudo snap unset system proxy.https")



def install(serverIP, serverPort, uname, pd, fname):
    string = f"""http_proxy=http://{serverIP}:{serverPort}@{uname}:{pd}
https_proxy=https://{serverIP}:{serverPort}@{uname}:{pd}
no_proxy=localhost,127.0.0.1
"""
    with open(fname, "w") as f:
        f.write(string)

    proxy_handler_source = "./proxy"
    proxy_handler_dest = "/usr/local/bin/"

    # make the proxy script executable
    os.chmod(proxy_handler_source, 0o755) #0o755 represents rwxr-xr-x permissions
    
    # move the proxy script to /usr/local/bin
    shutil.copy(proxy_handler_source, proxy_handler_dest)
    
    snap()

def uninstall():
    fname = "/etc/environment"
    proxy_handler = "/usr/local/bin/proxy"
    if os.path.exists(fname):
        os.remove(fname)
    if os.path.exists(proxy_handler):
        os.remove(proxy_handler)
    if not os.path.exists(fname) and os.path.exists(proxy_handler):
        print("Proxy successfully Uninstalled! Restart the PC to see the proxy unset!")

    print("-"*50)
    print("\nIn case snap is not running, run the following commands in terminal to unset the snap proxy:")
    print("sudo snap unset system proxy.http")
    print("sudo snap unset system proxy.https")


def setup():
    proxy_server = input("Enter the IP of Proxy Server: ")
    proxy_port = int(input("Enter the port number: "))
    user_name = input("Enter the username: ")
    password = input("Enter the password: ")
    fname = "/etc/environment"

    install(proxy_server, proxy_port, user_name, password, fname)
    

if __name__ == "__main__":
    if "--install" in sys.argv:
        setup()
    elif "--uninstall" in sys.argv:
        uninstall()
    else:
        print(f"Usage: sudo python3 new.py [--install|--uninstall]")
