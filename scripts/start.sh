#!/bin/bash
if [ "$1" = "server" ];then
    ss-server -c /root/config.json --plugin obfs-server --plugin-opts "obfs=http" "${@:2}"
elif [ "$1" = "proxy" ];then
    ss-local -c /root/config.json --plugin obfs-local --plugin-opts "obfs=http;obfs-host=www.apple.com" "${@:2}"
fi
