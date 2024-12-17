-- # Write your MySQL query statement below
SELECT u.name, IF(r.distance IS NULL,0,SUM(r.distance)) AS travelled_distance FROM
users u left join rides r ON u.id = r.user_id
GROUP BY u.id ORDER BY travelled_distance DESC,u.name


-- #method 2

-- WITH CTE AS(
--     Select user_id, SUM(distance) AS travelled_distance FROM Rides
     
--     GROUP BY user_id
    
-- )
-- SELECT u.name, IF ( c.c.travelled_distance IS NULL, 0, c.travelled_distance) AS 'travelled_distance' FROM Users u LEFT JOIN CTE c
-- ON u.id=c.user_id
-- ORDER BY c.travelled_distance DESC,u.name;


-- IF(r.distance IS NULL,0,SUM(r.distance))  can be also written as  ISNULL(SUM(r.distance),0)