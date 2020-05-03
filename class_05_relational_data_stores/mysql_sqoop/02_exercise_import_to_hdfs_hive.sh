mysql -u root -phadoop
CREATE USER 'sqimport'@'localhost' IDENTIFIED BY 'hadoop';
GRANT ALL PRIVILEGES ON movielens.* to 'sqimport'@'localhost';
exit

cd /usr/hdp/2.6.5.0-292/hive/conf
vim hive-site.xml

# change this
<name>hive.warehouse.subdir.inherit.perms</name>     
<value>true</value>

# to this
<name>hive.warehouse.subdir.inherit.perms</name>     
<value>false</value>

useSSL=false

sqoop import --connect jdbc:mysql://localhost/movielens --driver com.mysql.jdbc.Driver --table movies -m 1 --username sqimport --password hadoop
# movies file was created at /user/maria_dev/movies
hdfs dfs -rm -r /user/maria_dev/movies

sqoop import --connect jdbc:mysql://localhost/movielens --driver com.mysql.jdbc.Driver --table movies -m 1 --username sqimport --password hadoop --hive-import
