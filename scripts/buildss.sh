#!/bin/bash
yum install epel-release git -y
yum install gcc gettext autoconf libtool automake make pcre-devel asciidoc xmlto c-ares-devel libev-devel libsodium-devel mbedtls-devel -y
cd ${scripthome}
git clone https://github.com/shadowsocks/shadowsocks-libev.git
cd shadowsocks-libev
git submodule update --init --recursive
./autogen.sh && ./configure && make
make install
cd ${scripthome}

yum install gcc autoconf libtool automake make zlib-devel openssl-devel asciidoc xmlto c-ares-devel -y
git clone https://github.com/shadowsocks/simple-obfs.git
cd simple-obfs
git submodule update --init --recursive
./autogen.sh
./configure && make
make install
cd ${scripthome}
