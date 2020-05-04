su root
cd /usr/hdp/current/zookeeper-client/bin
./zkCli.sh

# zookeeper
ls /
# create a ephemeral znode
create -e /znodetestmaster "127.0.0.1:2223"
get /znodetestmaster
quit 

./zkCli.sh
ls /
# you can see that znodetestmaster is no longer there because it was ephemeral
get /testmaster
create -e /testmaster "127.0.0.1:2225"
get /testmaster
create -e /testmaster "127.0.0.1:2225"
quit
