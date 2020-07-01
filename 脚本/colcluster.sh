#! /bin/bash

case $1 in
"start"){
	echo " -------- 启动 集群 -------"

	#启动 Hadoop集群
	cluster.sh start

	#启动 Zookeeper集群
	zk.sh start

sleep 2s;

	#启动 Flume采集集群
	f1.sh start

	#启动 Kafka采集集群
	kf.sh start

sleep 6s;

	#启动 Flume消费集群
	f2.sh start

	#启动 KafkaManager
	km.sh start
};;
"stop"){
    echo " -------- 停止 集群 -------"

	#停止 KafkaManager
	km.sh stop

    #停止 Flume消费集群
	f2.sh stop

	#停止 Kafka采集集群
	kf.sh stop

    sleep 15s;

	#停止 Flume采集集群
	f1.sh stop

	#停止 Zookeeper集群
	zk.sh stop

	#停止 Hadoop集群
	cluster.sh stop
};;
esac
