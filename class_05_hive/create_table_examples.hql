-- managed by hive
CREATE TABLE ratings2 (
    userID INT,
    movieID INT,
    rating INT,
    time INT
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
STORED AS TEXTFILE;

LOAD DATA LOCAL INPATH '${env:HOME}/ml-100k/u.data'
OVERWRITE INTO TABLE ratings2;


-- not managed by hive
CREATE EXTERNAL TABLE IF NOT EXISTS ratings3 (
    userID INT,
    movieID INT,
    rating INT,
    time INT
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
LOCATION '/data/ml-100k/u.data';

-- partitioning
CREATE TABLE customers (
    name STRING,
    address STRUCT<street:STRING, city:STRING, state:STRING, zip:INT>
)
PARTITIONED BY (country STRING)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
STORED AS TEXTFILE;