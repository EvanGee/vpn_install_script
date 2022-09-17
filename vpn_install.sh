#!/usr/bin/bash
#Use run this like this $. vpn_install.sh <user> <remote_ipaddress> <port_to_run_vpn>
#then connect $sudo openvpn --config 178.128.231.52.ovpn
#also, may want to turn off IP6, to prevent DNS leaking $sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1

USER=$1
IP_ADDRESS=$2
PORT=$3
SERVER=${USER}@${IP_ADDRESS}

ssh ${SERVER} 'apt install -y git'

ssh ${SERVER} 'git clone https://github.com/kylemanna/docker-openvpn.git'

ssh ${SERVER} 'apt install -y docker.io'

ssh ${SERVER} 'docker build -t vpn docker-openvpn'

ssh ${SERVER} "docker run -v \$PWD/vpn-data:/etc/openvpn --rm vpn ovpn_genconfig -u udp://${IP_ADDRESS}:${PORT}"

ssh -t ${SERVER} 'docker run -v $PWD/vpn-data:/etc/openvpn --rm -it vpn ovpn_initpki'

ssh -t ${SERVER} 'docker run -v $PWD/vpn-data:/etc/openvpn --rm -it vpn easyrsa build-client-full user0 nopass'

ssh ${SERVER} "docker run -v \$PWD/vpn-data:/etc/openvpn --rm vpn ovpn_getclient user0 > ${IP_ADDRESS}.ovpn"

scp ${SERVER}:~/${IP_ADDRESS}.ovpn .

ssh ${SERVER} "docker run -v \$PWD/vpn-data:/etc/openvpn -d -p ${PORT}:1194/udp --cap-add=NET_ADMIN vpn"

#sudo openvpn --config ${IP_ADDRESS}.ovpn
