su root
wget https://repo1.maven.org/maven2/com/facebook/presto/presto-server/0.234.2/presto-server-0.234.2.tar.gz
tar -xvf presto-server-0.234.2.tar.gz
cd presto-server-0.234.2
wget http://media.sundog-soft.com/hadoop/presto-hdp-config.tgz
tar -xvf presto-hdp-config.tgz
cd bin
wget https://repo1.maven.org/maven2/com/facebook/presto/presto-cli/0.234.2/presto-cli-0.234.2-executable.jar
mv presto-cli-0.234.2-executable.jar presto
chmod +x presto
cd ..
bin/launcher start

# presto with hive
bin/presto --server 127.0.0.1:8090 --catalog hive

show tables from default;
select * from default.ratings limit 10;
select * from default.ratings where rating = 5 limit 10;
select count(*) from default.ratings where rating = 1;
quit

bin/launcher stop



# presto with cassandra and hive
wget https://repo1.maven.org/maven2/com/facebook/presto/presto-server/0.165/presto-server-0.165.tar.gz
tar -xvf presto-server-0.165.tar.gz
cd presto-server-0.165
wget http://media.sundog-soft.com/hadoop/presto-hdp-config.tgz
tar -xvf presto-hdp-config.tgz
cd bin
wget https://repo1.maven.org/maven2/com/facebook/presto/presto-cli/0.165/presto-cli-0.165-executable.jar
mv presto-cli-0.165-executable.jar presto
chmod +x presto
cd ..

service cassandra start
nodetool enablethrift

cqlsh --cqlversion="3.4.0"
describe keyspaces;
use movielens;
describe tables;
select * from users limit 10;
quit

vim etc/catalog/cassandra.properties

connector.name=cassandra
cassandra.contact-points=127.0.0.1

vim etc/jvm.config
-Dpresto-temporarily-allow-java8=true

bin/launcher start
bin/presto --server 127.0.0.1:8090 --catalog hive,cassandra

select * from cassandra.movielens.users limit 10;
select * from hive.default.ratings limit 10;

select  u.occupation, count(*)
from hive.default.ratings r
inner join cassandra.movielens.users u on r.userid = u.user_id
group by u.occupation;
quit

bin/launcher stop
service cassandra stop