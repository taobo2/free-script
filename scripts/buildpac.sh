#!/bin/bash
yum install -y wget python-pip nginx
cp ${projecthome}/conf.d/nginx.conf /etc/nginx/conf.d
cd ${projecthome}
gfwlist="https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt"
wget $gfwlist
pip install gfwlist2pac
mkdir pac
if [ -z "$pacserver" ]; then
    pacserver="SOCKS 127.0.0.1:7654; SOCKS5 127.0.0.1:7654"
fi
gfwlist2pac -i gfwlist.txt -f /usr/share/nginx/html/gfw.pac  -p "$pacserver"

