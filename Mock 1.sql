WITH CTE AS (
    SELECT user_id, SUM(distance) OVER(PARTITION BY user_id) AS travelled_distance FROM Rides
)
SELECT DISTINCT u.name, IFNULL(CTE.travelled_distance, 0) AS travelled_distance FROM Users u LEFT JOIN CTE ON u.id=CTE.user_id ORDER BY CTE.travelled_distance DESC, u.name

