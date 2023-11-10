/*
1. Find the items that were sold 2nd ranked by date for each seller
2. Also find the brand and seller from Items table for above result
3. From the users who have their favorite brand as that sold by them 2nd based on date
*/

with cte as
(
  select item_id,seller_id from
  (
  select  item_id, seller_id, rank() over (partition by seller_id order by order_date) 'rnk'
  from
  Orders
  ) a
  where rnk = 2
),
cte2 as
(
select i.item_brand, cte.seller_id from
cte join Items i
on cte.item_id = i.item_id
)
select u.user_id 'seller_id', if(cte2.item_brand= u.favorite_brand, 'yes','no') '2nd_item_fav_brand'
from
Users u
left join
cte2
on u.user_id = cte2.seller_id