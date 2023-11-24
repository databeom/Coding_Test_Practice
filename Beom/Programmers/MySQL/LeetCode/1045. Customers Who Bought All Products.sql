SELECT customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(*) FROM Product)
   AND SUM(DISTINCT product_key) = (SELECT SUM(product_key) FROM Product)
