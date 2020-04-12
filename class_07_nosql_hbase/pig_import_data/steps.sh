hbase shell

wget http://media.sundog-soft.com/hadoop/hbase.pig

# create a table called users, and column family is called userinfo
create 'users','userinfo'

# import u.user file into HBase users table
pig hbase.pig 

hbase shell
scan 'users'
disable 'users'
drop 'users'