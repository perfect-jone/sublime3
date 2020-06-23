#ntpConf.sh脚本
#!bin/bash
user=`whoami`
for((host=102; host<104; host++)); do
	#1.注释server 0到server 3内容
	ssh $user@hadoop$host "sed -i 's/server [0-3]/#&/' /etc/ntp.conf"
	#2.添加"server 192.168.159.101 prefer"到各个从服务器
    ssh $user@hadoop$host "echo 'server 192.168.159.101 prefer' >> /etc/ntp.conf"
done
