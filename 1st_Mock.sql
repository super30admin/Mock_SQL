# 1407 Top Travellers
# Write your MySQL query statement below
SELECT U.name, IFNULL(SUM(R.distance), 0) AS travelled_distance  FROM Users U 
LEFT JOIN Rides R ON U.id = R.user_id 
GROUP BY U.id, U.name
ORDER BY travelled_distance DESC, name ASC;

# 1445 Apples & Oranges
# Write your MySQL query statement below
WITH APPL AS (SELECT sale_date, sold_num FROM SALES WHERE fruit = 'apples' ORDER BY sale_date),
ORNG AS (SELECT sale_date, sold_num FROM SALES WHERE fruit = 'oranges' ORDER BY sale_date)
SELECT A.sale_date, IFNULL(A.sold_num - (SELECT O.sold_num FROM ORNG AS O WHERE A.sale_date = O.sale_date), A.sold_num) AS diff 
FROM APPL AS A;