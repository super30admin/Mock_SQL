/*
1. We need the information of all travellers so we left join of users and rides
2. If the user never travelled coalesce will return 0 and once ordered on travelled distance we get the top travellers
*/
select name, coalesce(sum(distance),0) 'travelled_distance'
from
Users u left  join Rides r
on u.id = r.user_id
group by u.id
order by travelled_distance desc, name asc