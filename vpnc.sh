#!/bin/bash
/usr/sbin/vpnc
/sbin/route add -net 10.54.0.0 netmask 255.255.0.0 dev tun0
/sbin/route add -net 10.154.0.0 netmask 255.255.0.0 dev tun0
/sbin/route add -net 10.254.0.0 netmask 255.255.0.0 dev tun0
/sbin/route add -net 10.155.0.0 netmask 255.255.0.0 dev tun0
/sbin/route add -net 10.255.0.0 netmask 255.255.0.0 dev tun0
/sbin/route add -net 10.59.0.0 netmask 255.255.0.0 dev tun0
/sbin/route add -net 10.159.0.0 netmask 255.255.0.0 dev tun0
/sbin/route add -net 10.57.0.0 netmask 255.255.0.0 dev tun0
/sbin/route add -net 10.157.0.0 netmask 255.255.0.0 dev tun0
/sbin/route add -net 10.58.0.0 netmask 255.255.0.0 dev tun0
/sbin/route add -net 10.52.0.0 netmask 255.255.0.0 dev tun0
/sbin/route add -net 10.221.0.0 netmask 255.255.0.0 dev tun0
/sbin/route del default
/sbin/route add default gw 10.0.0.1



echo "1" > /proc/sys/net/ipv4/ip_forward
/sbin/iptables -D FORWARD -i eth0 -o tun0 -p tcp --dport 3389 -j ACCEPT
/sbin/iptables -D FORWARD -i tun0 -o eth0 -m state --state ESTABLISHED,RELATED -j ACCEPT
/sbin/iptables -t nat -D POSTROUTING -o tun0 -j MASQUERADE
/sbin/iptables -A FORWARD -i eth0 -o tun0 -p tcp --dport 3389 -j ACCEPT
/sbin/iptables -A FORWARD -i tun0 -o eth0 -m state --state ESTABLISHED,RELATED -j ACCEPT
/sbin/iptables -t nat -A POSTROUTING -o tun0 -j MASQUERADE

