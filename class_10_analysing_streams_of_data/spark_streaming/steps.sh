wget http://media.sundog-soft.com/hadoop/sparkstreamingflume.conf
wget http://media.sundog-soft.com/hadoop/SparkFlume.py

mkdir checkpoint
export SPARK_MAJOR_VERSION=2
spark-submit --packages org.apache.spark:spark-streaming-flume_2.11:2.3.0 SparkFlume.py

# on a new window
cd /usr/hdp/current/flume-server/
bin/flume-ng agent --conf conf --conf-file ~/sparkstreamingflume.conf --name a1

# on a new windows
wget http://media.sundog-soft.com/hadoop/access_log.txt
cp access_log.txt spool/log22.txt
cp access_log.txt spool/log23.txt