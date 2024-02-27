WITH A AS(
    SELECT requester_id AS id
         , (COUNT(requester_id)) AS cnt
    FROM RequestAccepted
    GROUP BY requester_id
), B AS (
    SELECT accepter_id AS id
         , (COUNT(accepter_id)) AS cnt
    FROM RequestAccepted
    GROUP BY accepter_id
), C AS (
    SELECT id
        , cnt
    FROM A

    UNION ALL

    SELECT id
        , cnt
    FROM B
)
SELECT id
     , SUM(cnt) AS num
FROM C
GROUP BY id
ORDER BY num DESC
LIMIT 1
