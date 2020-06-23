#! /bin/bash

	for i in hadoop101 hadoop102 
	do
		ssh $i "java -classpath /opt/module/log-collector.jar com.bigdata.appclient.AppMain $1 $2 >/opt/module/test.log &"
	done
