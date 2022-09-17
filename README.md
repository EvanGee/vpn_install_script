This script is made for deploying a vpn on a remote server from 
a local machine. It installs docker, git on the remote machine.

# Install Instructions:

user: the user you are remoting into (ssh).

remote_ipaddress: is the IP address you are connecting to.

port_to_run: this is the port you are running the vpn on.

    $ . vpn_install.sh <user> <remote_ipaddress> <port_to_run_vpn>

# Connecting Instructions:

remote_ipaddress: is the IP address of the remote server.

    $ . vpn_run.sh <remote_ipaddress>
