### Glance
![](./graph/lab.network.png)

家庭整体路由就不写了，就写下自己如何用1个路由器一个电脑,如何让虚拟机/虚拟机内DOCKER上的容器都在一个网段里。

### 物理设备
* tplink 路由器
* PC 一台 4C 16G 128G_SSD + 1T_HD
* MAC PRO 一台

### 路由器配置
* WAN 192.168.1.?/24 不重要，省略
* LAN 192.168.0.1/24
* 子网范围 192.168.0.1 - 192.168.0.254
* DHCP 192.168.0.2 - 192.168.0.100 (其实用不到)

### PC机器配置
* OS: Centos-8
* uname -a Linux M1-192-168-0-200 4.18.0-193.el8.x86_64 #1 SMP ...
* NIC: enp0s31f6
* IP: 192.168.0.200

1. 装操作系统
2. 安装KVM
3. 配置下网络/etc/sysconfig/network-scripts，两个文件内容同本目录下network-scripts-pc
   1. 思路是创建一个网桥br0绑IP，本机网卡接口接到网桥br0上
4. 创建一个虚拟机(VM-Docker)[桥接模式]，使用网络源为br0:enp0s31f6


### Docker虚拟机配置
* OS: Centos-7
* uname -a : Linux M1-192-168-0-100 3.10.0-1160.el7.x86_64 #1 SMP ...
* NIC: eth0
* IP: 192.168.0.100/24

1. 创建Docker网络（macvlan)
    ```bash
    # 在网卡eth0上创建个名为macvlan2904虚拟网络
    # 网卡要允许嗅探（混杂模式）
    docker network create -d macvlan \
    subnet=192.168.0.0/24 \
    gateway=192.168.0.1 \
    -o parent=eth0 macvlan2904
    ```
2. 使用方式1 docker run
    ```bash
    docker run -d \
    --name container_mysql \
    --net macvlan2904 \
    --ip 192.168.0.99 \
    -p 3306:3306 \
    -e MYSQL_ROOT_PASSWD=123 \
    mysql:5.7
    ```
3. 使用方式2 docker-compose.yml, 效果同上
```yaml
version: '3.0'

networks:
  macvlan2904:
      external: true

services:
  mysql1:
    image: 'mysql:5.7'
    container_name: mysql_5_7
    privileged: true
    environment:
      - MYSQL_ROOT_PASSWORD=123
    ports:
      - 3306:3306
    networks:
      macvlan2904:
        ipv4_address: 192.168.0.99
```