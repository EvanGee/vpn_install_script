#!/usr/bin/bash
sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1
sudo openvpn --config 143.198.149.162.ovpn