#!/bin/bash
#ps -C(command)：显示指令(进程)名称  --no-header：等同h,不显示标题 
#wc(word count)  -l(lines)： -w(words)：统计字数 -c(chars)：统计字节数
if [ $(ps -C mysqld --no-header | wc -l) -eq 0 ]; then
     systemctl restart mysqld
fi
sleep 2
if [ $(ps -C mysqld --no-header | wc -l) -eq 0 ]; then
   systemctl stop keepalived.service
fi
