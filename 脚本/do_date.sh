#!/bin/bash

hive=/opt/module/hive/bin/hive
APP=gmall

if [ -n "$1" ]; then
	do_date=$1
else
	do_date='date -d "-1 day" +%F'
fi

sql="
load data inpath '/origin_data/gmall/log/topic_start/$do_date' into table $APP.ods_start_log partition(dt='$do_date');
load data inpath '/origin_data/gmall/log/topic_event/$do_date' into table $APP.ods_event_log partition(dt='$do_date');
"

$hive -e "$sql"