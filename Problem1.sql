WITH CTE AS (
    SELECT 
        u.id,
        u.name,
        IFNULL(SUM(r.distance), 0) AS travelled_distance
    FROM users u
    LEFT JOIN rides r ON u.id = r.user_id
    GROUP BY u.id, u.name
)
SELECT name, travelled_distance
FROM CTE
ORDER BY travelled_distance DESC, name;