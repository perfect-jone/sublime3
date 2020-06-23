#! /bin/bash

for i in hadoop101 hadoop102 hadoop103
do
        echo --------- $i ----------
        ssh $i "$*"
done

