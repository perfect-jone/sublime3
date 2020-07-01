#! /bin/bash

case $1 in
"start"){
        for i in hadoop101 hadoop102
        do
                echo " --------启动 $i 采集flume-------"
                ssh $i "nohup /opt/module/flume/bin/flume-ng agent -n a1 -f /opt/module/flume/conf/file-flume-kafka.conf -Dflume.root.logger=INFO,LOGFILE >/opt/module/flume/f1.log 2>&1 &"
        done
};;	
"stop"){
        for i in hadoop101 hadoop102
        do
                echo " --------停止 $i 采集flume-------"
                ssh $i "ps -ef | grep file-flume-kafka | grep -v grep |awk '{print \$2}' | xargs kill"
        done

};;
esac

