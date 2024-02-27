# Write your MySQL query statement below
WITH RNK AS(
SELECT customer_id,
       RANK() OVER(PARTITION BY customer_id ORDER BY order_date) AS R, 
       CASE WHEN order_date = customer_pref_delivery_date THEN 'immediate' ELSE 'scheduled' END AS S
FROM Delivery
)

SELECT ROUND((COUNT(CASE WHEN S = 'immediate' THEN 1 END) / COUNT(S)) * 100, 2) AS immediate_percentage
FROM RNK
WHERE R = 1
