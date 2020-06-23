#!/bin/bash
case $1 in
"start"){
	echo "start kafka servers..."

	for host in hadoop101 hadoop102 hadoop103
	do
	    echo "==========      root@$host      =========="
	    echo "正在启动$host"
	    ssh $host "/opt/module/kafka/bin/kafka-server-start.sh -daemon /opt/module/kafka/config/server.properties"
	done
};;
"stop"){
	echo "stop kafka servers..."

	for host in hadoop101 hadoop102 hadoop103
	do
	    echo "==========      root@$host      =========="
	    echo "正在关闭$host"
	    ssh $host "/opt/module/kafka/bin/kafka-server-stop.sh"
	done
};;
esac
