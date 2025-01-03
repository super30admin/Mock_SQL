select u.name, IFNULL(sum(r.distance),0) as travelled_distance from users u 
LEFT JOIN rides r ON u.id = r.user_id GROUP BY r.user_id ORDER BY travelled_distance DESC, u.name;