#!/bin/bash
yum install git gcc tinyproxy -y

cd ${scripthome}
git clone https://github.com/rofl0r/proxychains-ng.git
cd proxychains-ng
./configure --prefix=/usr --sysconfdir=/etc
make
sudo make install
cd ${scripthome}


