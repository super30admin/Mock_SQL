#Mock SQL

#Top Travellers

SELECT u.name, IFNULL(SUM(r.distance),0) AS travelled_distance 
FROM users u LEFT JOIN rides r on u.id = r.user_id
GROUP BY r.user_id
ORDER BY travelled_distance DESC, u.name



#Apples and Oranges

WITH CTE1 AS (SELECT sale_date, sold_num 
              FROM sales WHERE fruit = 'apples'
              ORDER BY sale_date),
WITH CTE2 AS (SELECT sale_date, sold_num 
              FROM sales WHERE fruit = 'oranges'
              ORDER BY sale_date)


SELECT t1.sale_date, t1.sold_num - (SELECT t2.sold_num FROM CTE2 as t2 WHERE t1.sale_date = t2.sale_date)
AS diff from CTE1 as t1