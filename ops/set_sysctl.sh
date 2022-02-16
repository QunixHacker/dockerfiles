#! /usr/bin/env bash
# 查看
sysctl -a
# 临时设置
sysctl -w net.ipv4.ip_local_port_range=1024 65535
echo "net.ipv4.ip_local_port_range = 1024 65000" >> /etc/sysctl.conf && sysctl -p