"""
Top Travellers:
1. we are given users and rides and need to report distance travelled by each user.
2. we join both the tables on user id, group by on userid and then can sum on the distance column to get the dist travelled.
3. We order by the distance in descending followed by name in ascending as required
"""

select name, coalesce(sum(distance), 0) AS travelled_distance
from users u left join rides r on u.id = r.user_id
group by user_id
order by travelled_distance desc, name asc