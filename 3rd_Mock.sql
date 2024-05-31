# Write your MySQL query statement below
WITH CTE AS (
SELECT match_id, first_player AS player, first_score as score FROM Matches
UNION ALL
SELECT match_id, second_player AS player, second_score as score FROM Matches
)
SELECT group_id, player_id FROM(
SELECT group_id, player_id, 
RANK() OVER(PARTITION BY group_id ORDER BY points DESC, player_id ASC) as rnk, points
FROM (
    SELECT group_id, player_id, SUM(score) AS points
    FROM CTE C LEFT JOIN Players P ON C.player = P.player_id
    GROUP BY player, group_id) AS random) AS random2
WHERE rnk = 1;