With CTE as(
select s.product_id, s.year as first_year, s.quantity, s.price
from Sales s join Product p on s.product_id = p.product_id
where (s.product_id, s.year) in (select s.product_id, min(s.year) from Sales s group by
s.product_id)
)
select * from CTE;