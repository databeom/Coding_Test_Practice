# Write your MySQL query statement below
WITH S_C AS(SELECT visited_on, SUM(amount) AS amount
            FROM Customer
            GROUP BY visited_on)

SELECT visited_on, 
       ROUND(SUM(amount) OVER(ORDER BY visited_on ROWS 6 PRECEDING),2) AS amount, 
       ROUND(AVG(amount) OVER(ORDER BY visited_on ROWS 6 PRECEDING),2) AS average_amount
FROM S_C
LIMIT 6, 100
