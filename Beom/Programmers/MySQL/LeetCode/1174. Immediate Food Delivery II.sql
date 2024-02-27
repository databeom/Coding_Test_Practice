# Write your MySQL query statement below
  -- 미해결
WITH step1 AS(
    SELECT customer_id 
        , IF(min(order_date) = customer_pref_delivery_date,1,0) AS score 
    FROM Delivery
    GROUP BY customer_id 
)
SELECT (SUM(score) / (SELECT COUNT(*) FROM step1) * 100) AS immediate_percentage 
FROM step1
