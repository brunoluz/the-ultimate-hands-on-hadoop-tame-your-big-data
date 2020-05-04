# add cassandra repo into hortonworks repository
cd /etc/yum.repos.d/
vim datastax.repo

# add the following content to datastax.repo:
# [datastax]
# name = DataStax repo for Apache Cassandra
# baseurl = http://rpm.datastax.com/community
# enable = 1
# gpgcheck = 0

yum install dsc30 -y

pip install cqlsh
# systemctl start cassandra

# open cassandra command line tool
cqlsh --cqlversion="3.4.0"

CREATE KEYSPACE movielens WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '1'} AND durable_writes = true;
USE movielens;
CREATE TABLE users (user_id int, age int, gender text, occupation text, zip text, PRIMARY KEY (user_id));
SELECT * FROM users;
exit

export SPARK_MAJOR_VERSION=2
spark-submit --packages datastax:spark-cassandra-connector:2.0.0-M2-s_2.11 CassandraSpark.py