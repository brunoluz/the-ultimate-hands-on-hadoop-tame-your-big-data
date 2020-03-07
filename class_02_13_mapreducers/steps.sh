ssh maria_dev@localhost -p 2222
# password

yum install python-pip -y

# run script locally, without hadoop
python RatingsBreakdown.py u.data

# run within hadoop
python RatingsBreakdown.py -r hadoop --hadoop-streaming-jar /usr/hdp/current/hadoop-mapreduce-client/hadoop-streaming.jar u.data