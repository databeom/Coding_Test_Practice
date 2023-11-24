WITH step1 AS(
    SELECT person_Name
         , SUM(Weight) Over(Order By Turn) AS weight_cumsum
    FROM Queue
)

SELECT person_name
FROM step1
WHERE weight_cumsum <= 1000
ORDER BY weight_cumsum DESC 
LIMIT 1
