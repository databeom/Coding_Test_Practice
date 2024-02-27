# Write your MySQL query statement below
# WITH Max_User AS(
#     SELECT U.NAME AS results
#     FROM MovieRating AS MR LEFT JOIN Users AS U ON MR.user_id = U.user_id
#     GROUP BY MR.user_id
#     HAVING COUNT(MR.user_id) = (SELECT COUNT(user_id)
#                             FROM MovieRating
#                             GROUP BY user_id
#                             ORDER BY COUNT(user_id) DESC
#                             LIMIT 1)
#     ORDER BY U.name
#     LIMIT 1
# ), MAX_Movie AS(
#     SELECT M.title AS results
#     FROM MovieRating AS MR LEFT JOIN Movies AS M ON MR.movie_id = M.movie_id
#     WHERE (YEAR(MR.created_at) = '2020') AND (MONTH(MR.created_at) = '2')   # 2020년 2월
#     GROUP BY MR.movie_id
#     ORDER BY (SUM(MR.rating) / COUNT(MR.movie_id)) DESC, M.title
#     LIMIT 1
# )

# SELECT *
# FROM Max_User

# UNION ALL

# SELECT *
# FROM MAX_Movie


(SELECT U.NAME AS results
FROM MovieRating AS MR LEFT JOIN Users AS U ON MR.user_id = U.user_id
GROUP BY MR.user_id
ORDER BY COUNT(MR.user_id) DESC, U.name
LIMIT 1)

UNION ALL

(SELECT M.title AS results
FROM MovieRating AS MR LEFT JOIN Movies AS M ON MR.movie_id = M.movie_id
WHERE (YEAR(MR.created_at) = '2020') AND (MONTH(MR.created_at) = '2')   # 2020년 2월
GROUP BY MR.movie_id
ORDER BY (SUM(MR.rating) / COUNT(MR.movie_id)) DESC, M.title
LIMIT 1)
