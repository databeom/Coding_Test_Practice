WITH UserSales AS (
    SELECT u.USER_ID AS user_id,
           u.GENDER,
           o.SALES_DATE,
           YEAR(o.SALES_DATE) AS year,
           MONTH(o.SALES_DATE) AS month
    FROM USER_INFO u
    INNER JOIN ONLINE_SALE o ON u.USER_ID = o.USER_ID
    WHERE u.GENDER IS NOT NULL
)

SELECT year
     , month
     , gender
     , COUNT(DISTINCT user_id)
FROM UserSales
GROUP BY year,month,gender
