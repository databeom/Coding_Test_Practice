-- # SELECT ROUND(COUNT(DISTINCT a1.player_id)/(SELECT COUNT(distinct player_id) FROM Activity),2) as fraction 
-- # FROM Activity a1 
-- # INNER JOIN Activity a2
-- #     ON a1.event_date = DATE_ADD(a2.event_date,INTERVAL 1 DAY) AND a1.player_id = a2.player_id
-- # WHERE (a2.player_id,a2.event_date) IN (SELECT player_id,MIN(event_date) 
-- #                                        FROM Activity 
-- #                                        GROUP BY player_id)

SELECT ROUND(COUNT(DISTINCT player_id) / (SELECT COUNT(DISTINCT player_id) FROM Activity), 2) AS fraction
FROM Activity 
WHERE (player_id, DATE_SUB(event_date, INTERVAL 1 DAY)) IN(SELECT player_id
                                                                , MIN(event_date) AS first_login
                                                           FROM Activity
                                                           GROUP BY player_id)
