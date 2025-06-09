# Mock_SQL

Please submit the interview problems posted in slack channel here. The problems and statements are intentionally not shown here so that students are not able to see them in advance 


-----------------------------------------------------------------------
Write a solution to report the distance traveled by each user.

Return the result table ordered by travelled_distance in descending order, if two or more users traveled the same distance, order them by their name in ascending order.

The result format is in the following example.
-------------------------------------------------------
SELECT u.name, SUM(COALESCE(r.distance,0)) total_distance
FROM Users u LEFT JOIN Rides r ON u.id = r.user_id
GROUP BY u.id
ORDER BY total_distance DESC, u.name;




---------------------------------------------------------------------------------------------
Write a solution to report the difference between the number of apples and oranges sold each day.

Return the result table ordered by sale_date.
---------------------------------------------------------------------------------------------


SELECT 'apple' AS fruit, COUNT(*) AS amount FROM Fruits WHERE fruit = 'apple'
UNION ALL
SELECT 'orange', COUNT(*) FROM Fruits WHERE fruit = 'orange';

