#!/bin/bash
ssopts=$1
ss-server -c /root/config.json --plugin obfs-server --plugin-opts "obfs=http" "$ssopts"
