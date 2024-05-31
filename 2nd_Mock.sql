# 1045. Customers Who Bought All Products
# Write your MySQL query statement below
SELECT  customer_id
FROM Customer 
GROUP BY customer_id
HAVING COUNT(distinct product_key) = (select COUNT(product_key) FROM Product);

# 1070. Product Sales Analysis III
# Write your MySQL query statement below
SELECT product_id, year AS first_year, quantity, price
FROM Sales
WHERE (product_id, year) IN (
    SELECT product_id, MIN(year) as firstyear
    FROM Sales
    GROUP BY product_id
)