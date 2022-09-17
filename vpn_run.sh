#!/usr/bin/bash
#also, may want to turn off IP6, to prevent DNS leaking $sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1
IP_ADDRESS=${1}
sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1
sudo openvpn --config ${IP_ADDRESS}.ovpn