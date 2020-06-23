#!/bin/bash
case $1 in
"start"){
	echo "==========     正在启动HDFS               =========="
	ssh hadoop101 "/opt/module/hadoop-2.7.2/sbin/start-dfs.sh"

	echo "==========     正在启动YARN               =========="
	ssh hadoop102 "/opt/module/hadoop-2.7.2/sbin/start-yarn.sh"

	echo "==========     正在启动JobHistoryServer   =========="
	ssh hadoop103  "/opt/module/hadoop-2.7.2/sbin/mr-jobhistory-daemon.sh start historyserver"
};;
"stop"){
	echo "==========     正在启动HDFS               =========="
	ssh hadoop101 "/opt/module/hadoop-2.7.2/sbin/stop-dfs.sh"

	echo "==========     正在启动YARN               =========="
	ssh hadoop102 "/opt/module/hadoop-2.7.2/sbin/stop-yarn.sh"

	echo "==========     正在启动JobHistoryServer   =========="
	ssh hadoop103  "/opt/module/hadoop-2.7.2/sbin/mr-jobhistory-daemon.sh stop historyserver"
};;
esac
