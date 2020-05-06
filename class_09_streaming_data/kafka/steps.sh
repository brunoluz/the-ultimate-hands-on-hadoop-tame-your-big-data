cd /usr/hdp/current/kafka-broker/bin

# create a kafka topic
./kafka-topics.sh --create --zookeeper sandbox-hdp.hortonworks.com:2181 --replication-factor 1 --partitions 1 --topic fred3
./kafka-topics.sh --list --zookeeper sandbox-hdp.hortonworks.com:2181

# produce some data on topic
./kafka-console-producer.sh --broker-list sandbox-hdp.hortonworks.com:6667 --topic fred3

# consume data from topic
./kafka-console-consumer.sh --bootstrap-server sandbox-hdp.hortonworks.com:6667 --topic fred3 --from-beginning


cd /usr/hdp/current/kafka-broker/conf
cp connect-standalone.properties ~/
cp connect-file-sink.properties ~/
cp connect-file-source.properties ~/
cd ~/

vim connect-standalone.properties
# bootstrap.servers=localhost:9092 => bootstrap.servers=sandbox-hdp.hortonworks.com:6667

vim connect-file-sink.properties
# file=test.sink.txt => file=/home/maria_dev/logout.txt
# topics=connect-test => topics=log-test

vim connect-file-source.properties
# file=test.txt => file=/home/maria_dev/access_log_small.txt
# topic=connect-test => topic=log-test

wget http://media.sundog-soft.com/hadoop/access_log_small.txt


# another tab
cd /usr/hdp/current/kafka-broker/bin
./kafka-console-consumer.sh --bootstrap-server sandbox-hdp.hortonworks.com:6667 --topic log-test

# another tab
cd /usr/hdp/current/kafka-broker/bin
./connect-standalone.sh ~/connect-standalone.properties ~/connect-file-source.properties ~/connect-file-sink.properties

