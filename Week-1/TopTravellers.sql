with CTE as(
    select u.id as uid, u.name as name, ifnull(sum(distance), 0) as travelled_distance
    from users u left join rides r
    on u.id = r.user_id
    group by uid
)
select name, travelled_distance from CTE
order by travelled_distance desc, name;