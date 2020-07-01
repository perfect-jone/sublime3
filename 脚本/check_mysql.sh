#!/bin/bash
if [ $(ps -C mysqld --no-header | wc -l) -eq 0 ]; then
     systemctl restart mysqld
fi
sleep 2
if [ $(ps -C mysqld --no-header | wc -l) -eq 0 ]; then
   systemctl stop keepalived.service
fi
