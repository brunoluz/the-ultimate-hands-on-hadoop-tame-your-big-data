spark-submit LowestRatedMovieSpark.py

SPARK_MAJOR_VERSION=2
spark-submit LowestRatedMovieDataFrame.py
spark-submit MovieRecommendationsALS.py

# local
spark-submit Exercise_LowestRatedMovieDataFrame.py "../ml-100k/u.item" "../ml-100k/u.data"
# within hadoop cluster
spark-submit Exercise_LowestRatedMovieDataFrame.py "ml-100k/u.item" "hdfs:///user/maria_dev/ml-100k/u.data"

# local
spark-submit Exercise_LowestRatedMovieSpark.py "../ml-100k/u.item" "../ml-100k/u.data"
# within hadoop cluster
spark-submit Exercise_LowestRatedMovieSpark.py "ml-100k/u.item" "hdfs:///user/maria_dev/ml-100k/u.data"


