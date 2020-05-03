CREATE VIEW IF NOT EXISTS topMovieIDS AS
SELECT movieID, count(movieID) as ratingCount
FROM ratings
GROUP By movieID
ORDER BY ratingCount DESC;

SELECT n.title, t.ratingCount
FROM topMovieIDS t
INNER JOIN names n on t.movieID = n.movieID;

DROP VIEW topMovieIDS;