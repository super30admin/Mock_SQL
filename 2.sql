SELECT a.sale_date, a.sold_num - o.sold_num AS diff
FROM Sales a, Sales o
WHERE a.sale_date = o.sale_date AND a.fruit = 'apples' AND o.fruit = 'oranges'
GROUP BY a.sale_date
ORDER BY a.sale_date
