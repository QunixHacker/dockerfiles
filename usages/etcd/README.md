* ETCD_NAME ：ETCD的节点名
* ETCD_DATA_DIR：ETCD的数据存储目录
* ETCD_SNAPSHOT_COUNTER：多少次的事务提交将触发一次快照
* ETCD_HEARTBEAT_INTERVAL：ETCD节点之间心跳传输的间隔，单位毫秒
* ETCD_ELECTION_TIMEOUT：该节点参与选举的最大超时时间，单位毫秒
* ETCD_LISTEN_PEER_URLS：该节点与其他节点通信时所监听的地址列表，多个地址使用逗号隔开，其格式可以划分为scheme://IP:PORT，这里的scheme可以是http、https
* ETCD_LISTEN_CLIENT_URLS：该节点与客户端通信时监听的地址列表
* ETCD_INITIAL_ADVERTISE_PEER_URLS：该成员节点在整个集群中的通信地址列表，这个地址用来传输集群数据的地址。因此这个地址必须是可以连接集群中所有的成员的。
* ETCD_INITIAL_CLUSTER：配置集群内部所有成员地址，其格式为：ETCD_NAME=ETCD_INITIAL_ADVERTISE_PEER_URLS，如果有多个使用逗号隔开
* ETCD_ADVERTISE_CLIENT_URLS：广播给集群中其他成员自己的客户端地址列表
* ETCD_INITIAL_CLUSTER_STATE：初始化集群状态，new表示新建
* ETCD_INITIAL_CLUSTER_TOKEN:初始化集群token