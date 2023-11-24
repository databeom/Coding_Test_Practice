# Write your MySQL query statement below
with T as 
(SELECT person_name, SUM(weight) OVER(ORDER BY turn) AS Total
FROM Queue)

SELECT person_name
FROM T
WHERE Total <= 1000
ORDER BY Total DESC
LIMIT 1;
