mysql -u root -p
hadoop

# mysql (from previous classes)
show databases;
use movielens;
show tables;
show * from movies limit 10;
quit

# hive
wget http://media.sundog-soft.com/hadoop/oldmovies.sql

# oozie
wget http://media.sundog-soft.com/hadoop/workflow.xml
wget http://media.sundog-soft.com/hadoop/job.properties
hadoop fs -put workflow.xml /user/maria_dev
hadoop fs -put oldmovies.sql /user/maria_dev
hadoop fs -put /usr/share/java/mysql-connector-java.jar /user/oozie/share/lib/lib_20180618160835/sqoop

# restart oozie service via ambari

oozie job -oozie http://localhost:11000/oozie -config /home/maria_dev/job.properties -run