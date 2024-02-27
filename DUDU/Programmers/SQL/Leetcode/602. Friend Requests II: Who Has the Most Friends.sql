WITH T as(
SELECT requester_id AS id FROM RequestAccepted
UNION ALL
SELECT accepter_id AS id FROM RequestAccepted)


SELECT id, count(*) as num 
FROM T
GROUP BY id
ORDER BY num DESC 
limit 1
