#!/bin/sh

TUNNEL_IP=${IODINE_TUNNEL_IP:-"10.0.0.1"}

# Thanks to https://github.com/jpetazzo/dockvpn for the tun/tap fix
mkdir -p /dev/net
mknod /dev/net/tun c 10 200

exec iodined -c -f $TUNNEL_IP $IODINE_HOST -P $IODINE_PASSWORD >>/var/log/iodined.log 2>&1
