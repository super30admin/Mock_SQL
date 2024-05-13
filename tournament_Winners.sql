WITH CTE AS(
    SELECT first_player AS 'player_id', first_score AS 'score' FROM Matches
    UNION ALL
    SELECT second_player AS 'player_id', second_score AS 'score' FROM Matches
) 
SELECT DISTINCT group_id,
FIRST_VALUE(player_id) OVER(PARTITION BY group_id
ORDER BY total_sum DESC, player_id ) AS 'player_id'
FROM(
SELECT c.player_id, SUM(c.score) As 'total_sum' , p.group_id
FROM CTE c
JOIN Players p
ON c.player_id= p.player_id
GROUP BY c.player_id
)AS Sub_query;
