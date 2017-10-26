#!/bin/bash
if [ "$role" = "server" ];then
    conf="${projecthome}/conf.d/ss.server.config.json"
    ss-server -u -c $conf --plugin obfs-server --plugin-opts "obfs=http" "${@:2}"
elif [ "$role" = "proxy" ];then
    polipo socksParentProxy=localhost:7654 proxyAddress="0.0.0.0" &

    pushd ${projecthome}/pac 
    python2 -m SimpleHTTPServer &
    popd

    conf="${projecthome}/conf.d/ss.client.config.json"
    pluginopts="obfs=http;obfs-host=www.apple.com" 
    ss-local -u -c $conf --plugin obfs-local --plugin-opts $pluginopts "${@:2}"
fi
