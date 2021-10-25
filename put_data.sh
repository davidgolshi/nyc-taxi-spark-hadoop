#!/bin/bash
# loading data into hdfs via bash
for file in $(ls ./data/nyc-taxi/)
do
    filepath=$(readlink -f ./data/nyc-taxi/$file)
    $HADOOP_HOME/bin/hadoop fs -put $filepath /user/hadoop/input/
done