su root
yum install phoenix
cd /usr/hdp/current/phoenix-client/
cd bin
python sqlline.py

!tables
CREATE TABLE IF NOT EXISTS us_population(
    state CHAR(2) NOT NULL,
    city VARCHAR NOT NULL,
    population BIGINT,
    CONSTRAINT my_pk PRIMARY KEY (state,city)
);
!tables

UPSERT INTO us_population VALUES ('NY', 'New York', 8143197);
UPSERT INTO us_population VALUES ('CA', 'Los Angeles', 3844829);
SELECT * FROM us_population;
SELECT * FROM us_population WHERE state = 'CA';
DROP TABLE us_population;
!tables
!quit

# integrate phoenix with pig
cd /usr/hdp/current/phoenix-client/bin
python sqlline.py
CREATE TABLE users (
    userid INTEGER NOT NULL,
    age INTEGER,
    gender CHAR(1),
    occupation varchar,
    zip varchar,
    CONSTRAINT pk PRIMARY KEY (userid)
);
!quit

cd /home/maria_dev
wget http://media.sundog-soft.com/hadoop/phoenix.pig
pig phoenix.pig
cd /usr/hdp/current/phoenix-client/bin
python sqlline.py
SELECT * FROM users LIMIT 10;