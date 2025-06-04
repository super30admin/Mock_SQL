WITH CTE AS(
    SELECT u.name AS 'name', r.user_id AS 'user', r.distance AS 'dist' FROM Users u LEFT JOIN Rides r ON u.id = r.user_id 
)
SELECT name, IFNULL(SUM(dist), 0) as 'travelled_distance' FROM CTE GROUP BY user ORDER BY travelled_distance DESC, name