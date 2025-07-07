WITH CTE AS (
    SELECT sale_date, (
        CASE
        WHEN fruit='apples' THEN sold_num
        ELSE -sold_num
        end
    ) AS sold_num FROM Sales
)
SELECT sale_date, SUM(sold_num) AS diff FROM CTE GROUP BY sale_date ORDER BY sale_date