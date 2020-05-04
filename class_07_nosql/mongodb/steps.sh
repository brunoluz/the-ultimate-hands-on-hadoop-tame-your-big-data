su root

cd /var/lib/ambari-server/resources/stacks/HDP/2.6/services
git clone https://github.com/nikunjness/mongo-ambari.git
sudo systemctl restart ambari-server
sudo systemctl restart ambari-agent

sudo pip install pymongo
wget http://media.sundog-soft.com/hadoop/MongoSpark.py
export SPARK_MAJOR_VERSION=2

spark-submit --packages org.mongodb.spark:mongo-spark-connector_2.11:2.3.0 MongoSpark.py

# use mongoDB shell
export LC_ALL=C
mongo
use movielens
db.users.find( {user_id: 100} )
db.users.explain().find( {user_id: 100} )
