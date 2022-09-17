This script is made for deploying a vpn on a remote server from 
a local machine. It installs docker, git on the remote machine.

# Install Instructions:

user: the user you are remoting into (ssh).
remote_ipaddress: is the remote Ip address you are connecting to.
port_to_run: this is the port you are running the vpn on.

    $ . vpn_install.sh <user> <remote_ipaddress> <port_to_run_vpn>

# Connecting Instructions:

remote_ipaddress: is the name of the remote server, its also
the name of the .ovpn file. It turns off ipv6 as this sometimes 
causes DNS leaks.

    $ . vpn_connect.sh <remote_ipaddress>
