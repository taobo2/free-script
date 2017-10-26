#!/bin/bash
yum install -y wget python2 python-pip
cd ${projecthome}
gfwlist="https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt"
wget $gfwlist
pip install gfwlist2pac
mkdir pac
gfwlist2pac -i gfwlist.txt -f pac/gfw.pac  -p "SOCKS 127.0.0.1:7654; SOCKS5 127.0.0.1:7654;"

