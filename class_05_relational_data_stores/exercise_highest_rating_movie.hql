-- find the movie with the highest average rating
-- only consider movies with more than 10 ratings

CREATE OR REPLACE VIEW topRatings AS
SELECT max(movies.name) as movieName, count(ratings.movieID) as ratingCount, avg(ratings.rating) as averageRating
FROM ratings
JOIN movies on ratings.movieID = movies.movieID
GROUP By ratings.movieID
ORDER BY averageRating DESC;

select * from topRatings where ratingCount >= 10;