#!/bin/bash

echo "instalando haproxy"

sudo apt update && apt upgrade -y
sudo apt install haproxy -y

echo "configurando haproxy"

sudo echo "backend web-backend" >> /etc/haproxy/haproxy.cfg
sudo echo "	balance roundrobin" >> /etc/haproxy/haproxy.cfg
sudo echo "	stats enable" >> /etc/haproxy/haproxy.cfg
sudo echo "	stats auth julian:admin" >> /etc/haproxy/haproxy.cfg
sudo echo "" >> /etc/haproxy/haproxy.cfg
sudo echo "	server web1 192.168.100.2:80 check" >> /etc/haproxy/haproxy.cfg
sudo echo "	server web2 192.168.100.3:80 check" >> /etc/haproxy/haproxy.cfg
sudo echo "	server web3 192.168.100.4:80 check" >> /etc/haproxy/haproxy.cfg
sudo echo "" >> /etc/haproxy/haproxy.cfg
sudo echo "frontend http" >> /etc/haproxy/haproxy.cfg
sudo echo "	bind *:80" >> /etc/haproxy/haproxy.cfg
sudo echo "	default_backend web-backend" >> /etc/haproxy/haproxy.cfg

sudo systemctl restart haproxy
sudo systemctl enable haproxy