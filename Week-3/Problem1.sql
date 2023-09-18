/*
Tournament Winners
1. Compute the match statistics in first player perspective to compute the scores they won as p1
2. Compute the match statistics in second player's perspective to compute scores they won as p1
3. Combine the stats to find which player scored most overall by ranking on the sum of their scores in descending
*/

with cte as
(select first_player 'p1',second_player 'p2',first_score 's1',second_score 's2', group_id
from matches m1 join players p 
on m1.first_player=p.player_id
union all
select second_player 'p1',first_player 'p2', second_score 's1', first_score 's2', group_id
from matches m2 join players p 
on m2.first_player=p.player_id
),
cte2 as 
(select p1,group_id, dense_rank() over (partition by group_id order by sum(s1) desc,p1) 'rnk' from cte
group by p1)
select group_id, p1 'player_id'
from cte2 
where rnk = 1