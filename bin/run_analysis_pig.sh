#!/bin/bash

export HADOOP_HOME=/usr/lib/hadoop-0.20-mapreduce/
export JAVA_HOME=/home/y/share/yjava_jdk/java/

time (/usr/bin/pig src/pig/wordcount.pig 2>&1) | tee wordcount.log

issuccess=0
jobid=0
year=$(date -d "0 day" +"%Y")
month=$(date -d "0 day" +"%m")
day=$(date -d "0 day" +"%d")
basepath="/var/log/hadoop-0.20-mapreduce/history/done/grasspass.corp.sg3.yahoo.com_1369897140753_/"$year"/"$month"/"$day"/000001/"
basepathp="file://"$basepath
if [ "$(grep 'MapReduceLauncher - Success' wordcount.log)" ];
then
        echo "Success!"
        echo "Excution time ="
        jobid=$(grep "job_" wordcount.log | tail -1)
        echo "MapReduce JobId = "$jobid
        ##Execute Aaidya
        joblogname=$(find $basepath -name "*$jobid*pig")
        logfilename=$(echo $joblogname | cut -f12 -d'/')
        cmd="/usr/lib/hadoop-0.20-mapreduce/contrib/vaidya/bin/vaidya.sh -jobconf $basepathp$jobid""_conf.xml -joblog $basepathp$logfilename"
        echo $cmd
        eval $cmd > aaidya.log
else
        echo "Fail!"
fi
