-- Find all movies with an average rating less than 2.0.
-- Sort them by the total number of ratings.

-- metadata
metadata = LOAD '/user/maria_dev/ml-100k/u.item' USING PigStorage('|') 
 AS (movieId:int, movieTitle:chararray, releaseDate:chararray, videoRelease:chararray, imdbLink:chararray);

nameLookup = FOREACH metadata GENERATE movieId, movieTitle;

-- ratings
ratings = LOAD '/user/maria_dev/ml-100k/u.data' AS (userId:int, movieId:int, rating:int, ratingTime:int);
ratingsByMovie = GROUP ratings by movieId;
averageRatings = FOREACH ratingsByMovie GENERATE group as movieId, AVG(ratings.rating) as averageRating, COUNT(ratings.rating) as ratingCount;
badMovies = FILTER averageRatings by averageRating < 2.0;
badMoviesWithData = JOIN badMovies BY movieId, nameLookup BY movieId;

finalResults = FOREACH badMoviesWithData GENERATE nameLookup::movieTitle as movieName, badMovies::averageRating as averageRating, badMovies::ratingCount as ratingCount;
badMoviesWithDataSorted = ORDER finalResults by ratingCount DESC;

-- DUMP ratings;
-- DUMP metadata;
-- DUMP nameLookup;
-- DUMP badMovies;
-- DUMP averageRatings;
DUMP badMoviesWithDataSorted;
