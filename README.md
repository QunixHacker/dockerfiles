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
ip a

1. https://www.jianshu.com/p/576e01666e5a
    ```shell
    git clone https://github.com/jpetazzo/pipework
    cp pipework/pipework /usr/local/bin 
    ```
2. 【docker主机】pipework 设置docker宿主机的ip
   1. pipework docker0 [con_hostname] 192.168.126.IP/24@192.168.126.254
3. 【docker主机】设置网络
   1. 【网桥】docker0 设置IP
   2. 【网口】eth0 删除IP（真是网卡）
   3. 【网口连接网桥】docker0 eth0
   4. 【删除默认旧路由】
   5. 【新路由走网桥0】

4. 以后每个容器
   1. pipework docker0 [con_hostname] 192.168.126.IP/24@192.168.126.254

```shell
# 1
pipework docker0 【container_hostname】 192.168.126.201/24@192.168.126.254
# 2
ip addr add 192.168.126.201/24 dev docker0; \
  ip addr del 192.168.126.201/24 dev eth0; \
  brctl addif docker0 eth0; \
  ip route del default; \
  ip route add default via 192.168.126.254 dev docker0
```