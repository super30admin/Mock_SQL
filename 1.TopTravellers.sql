# Write your MySQL query statement below

SELECT U.NAME as name, IFNULL(SUM(R.DISTANCE),0) as travelled_distance 
FROM USERS U
LEFT JOIN RIDES R
ON 
U.ID = R.USER_ID
GROUP BY U.ID
ORDER BY travelled_distance desc, name asc