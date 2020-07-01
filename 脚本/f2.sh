case $1 in
"start"){
	for i in hadoop103
	do
	    echo " --------启动 $i 消费flume-------"
	    ssh $i "nohup /opt/module/flume/bin/flume-ng agent --name a1 --conf-file /opt/module/flume/conf/kafka-flume-hdfs.conf -Dflume.root.logger=INFO,LOGFILE >/opt/module/flume/f2.log 2>&1 &"
	done
};;
"stop"){
	for i in hadoop103
	do
	    echo " --------停止 $i 消费flume-------"
	    ssh $i "ps -ef | grep kafka-flume-hdfs | grep -v grep |awk '{print \$2}' | xargs kill"
	done

};;
esac
