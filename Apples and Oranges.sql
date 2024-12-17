SELECT s1.sale_date, (s1.sold_num - s2.sold_num) AS diff
FROM sales s1, sales s2
where s1.fruit ='apples' AND s2.fruit ='oranges' AND
s1.sale_date = s2.sale_date
ORDER BY s1.sale_date;