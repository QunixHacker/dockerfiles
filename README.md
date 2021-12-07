# dockerfiles




### yum networktools
```shell
# brctl 
yum install -y bridge-utils

# arp, hostname, ifconfig, netstat, rarp, route, 
# plipconfig, slattach, mii-tool and iptunnel and ipmaddr
yum install -y net-tools

# ip
yum install -y iproute
```


### yum utils
```shell
yum install -y which
yum install -y wget curl
```


### 网络

宿主情况 eth0
* IPADDR:192.168.126.200
* PREFIX:24
* GATEWAY:192.168.236.254
```shell
# 0. 创建网络
docker network create \
-d macvlan \
--subnet=192.168.126.0/24 \
--gateway=192.168.126.254 \
-o parent=eth0 bridge_host;
# 1. 运行容器时
docker run -d \
--name somename \
--net bridge_host \
--ip 192.168.126.61 \
centos7-base
```