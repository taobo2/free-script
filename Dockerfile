FROM centos:7

RUN yum update -y && yum install -y gcc autoconf libtool automake make zlib-devel \
    openssl-devel asciidoc xmlto c-ares-devel git \
    wget epel-release libev-devel dnsmasq \
    && wget https://copr.fedorainfracloud.org/coprs/librehat/shadowsocks/repo/epel-7/librehat-shadowsocks-epel-7.repo \
    && cp librehat-shadowsocks-epel-7.repo /etc/yum.repos.d/ \
    && yum update -y \
    && yum install -y  shadowsocks-libev \
    && git clone https://github.com/shadowsocks/simple-obfs.git \
    && cd simple-obfs \
    && git submodule update --init --recursive \
    && ./autogen.sh \
    && ./configure && make \
    && make install

COPY config.json start.sh /root/

ENTRYPOINT ["/root/start.sh"]








    


