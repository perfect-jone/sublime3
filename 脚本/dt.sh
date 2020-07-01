#!/bin/bash

log_date=$1

for i in hadoop101 hadoop102 hadoop103
do
	ssh -t $i "date -s $log_date"
done

