# Write your MySQL query statement below

select distinct name,coalesce(sum(r.distance) over (partition by u.id),0) as travelled_distance
from users u 
left join rides r on u.id=r.user_id
order by travelled_distance desc, name;