# set mysql root password
su root
systemctl stop mysqld
systemctl set-environment MYSQLD_OPTS="--skip-grant-tables --skip-networking"
systemctl start mysqld
mysql -uroot

FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'hadoop';
FLUSH PRIVILEGES;
QUIT;

systemctl unset-environment MYSQLD_OPTS
systemctl restart mysqld
exit

## exercise

# create database
mysql -uroot -phadoop
create database movielens;
show databases;
exit;

wget http://media.sundog-soft.com/hadoop/movielens.sql
mysql -u root -p
hadoop

SET NAMES 'utf8';
SET CHARACTER SET utf8;
use movielens;
source movielens.sql;
show tables;
select * from movies limit 10;
describe ratings;

select movies.title, count(ratings.movie_id) as ratingCount 
from movies 
inner join ratings on movies.id = ratings.movie_id 
group by movies.title
order by ratingCount;

exit;