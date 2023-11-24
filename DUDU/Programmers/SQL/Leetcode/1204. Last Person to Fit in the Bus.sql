WITH t AS (
  SELECT Turn , person_id , person_name , Weight , SUM(Weight) OVER(ORDER BY Turn) AS total
  FROM Queue
  ORDER BY Turn desc
)

SELECT person_name
FROM t 
WHERE total <= 1000
LIMIT 1
