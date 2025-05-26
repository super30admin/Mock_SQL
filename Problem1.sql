SELECT 
  users.name, 
  IFNULL(SUM(rides.distance), 0) AS travelled_distance 
FROM Users
LEFT JOIN Rides ON users.id = rides.user_id
GROUP BY users.id, users.name
ORDER BY travelled_distance DESC, users.name ASC;
