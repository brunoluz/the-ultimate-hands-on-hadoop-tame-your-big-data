wget https://archive.apache.org/dist/flink/flink-1.2.0/flink-1.2.0-bin-hadoop2-scala_2.10.tgz
tar -xvf flink-1.2.0-bin-hadoop2-scala_2.10.tgz
cd flink-1.2.0
cd conf

vim flink-conf.yaml
# jobmanager.web.port: 8081 => jobmanager.web.port: 8082

cd ..
./bin/start-local.sh
nc -l 9000

# on a new window
cd flink-1.2.0
./bin/flink run examples/streaming/SocketWindowWordCount.jar --port 9000

# on a new window
cd flink-1.2.0
cd log
cat flink-maria_dev-jobmanager-0-sandbox-hdp.hortonworks.com.out

./bin/stop-local.sh