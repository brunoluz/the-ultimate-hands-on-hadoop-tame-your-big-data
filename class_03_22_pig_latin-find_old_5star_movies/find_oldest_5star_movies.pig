ratings = LOAD '/user/maria_dev/ml-100k/u.data' AS (userId:int, movieId:int, rating:int, ratingTime:int);

metadata = LOAD '/user/maria_dev/ml-100k/u.item' USING PigStorage('|') 
           AS (movieId:int, movieTitle:chararray, releaseDate:chararray, videoRelease:chararray, imdbLink:chararray);

nameLookup = FOREACH metadata GENERATE movieId, movieTitle, ToUnixTime(ToDate(releaseDate, 'dd-MMM-yyyy')) as releaseTime;

ratingsByMovie = GROUP ratings by movieId;

averageRatings = FOREACH ratingsByMovie GENERATE group as movieId, AVG(ratings.rating) as averageRating;

fiveStarMovies = FILTER averageRatings by averageRating > 4.0;

fiveStarWithData = JOIN fiveStarMovies BY movieId, nameLookup BY movieId;

oldestFiveStarMovies = ORDER fiveStarWithData by nameLookup::releaseTime;

-- DUMP ratings;
-- DUMP metadata;
-- DUMP nameLookup;
-- DUMP ratingsByMovie;
-- DUMP averageRatings;
-- DUMP fiveStarMovies;
-- DUMP fiveStarWithData;
DUMP oldestFiveStarMovies;
