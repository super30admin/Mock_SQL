select u.name, IFNULL(SUM(r.distance),0) as 'travelled_distance'
 from Users u  LEFT join rides r on u.id=r.user_id 
 GROUP BY U.ID
 order by travelled_distance desc,name