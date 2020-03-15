yum install python-pip -y

hdfs dfs -copyFromLocal u.data /user/maria_dev/u.data

# run script locally, without hadoop
python RatingsBreakdown.py u.data

# run within hadoop (inside hadoop cluster)
python RatingsBreakdown.py -r hadoop --hadoop-streaming-jar /usr/hdp/current/hadoop-mapreduce-client/hadoop-streaming.jar u.data
python RatingsBreakdown.py -r hadoop --hadoop-streaming-jar /usr/hdp/current/hadoop-mapreduce-client/hadoop-streaming.jar hdfs:///user/maria_dev/u.data
