WITH july_order AS(
    SELECT FLAVOR
         , SUM(TOTAL_ORDER) AS july_order
    FROM JULY
    GROUP BY FLAVOR
), join_order AS(
    SELECT fh.FLAVOR
         , TOTAL_ORDER + july_order AS TOTAL_ORDER
    FROM FIRST_HALF AS fh
        LEFT JOIN july_order AS jo ON fh.FLAVOR = jo.FLAVOR
)

SELECT FLAVOR
FROM join_order
ORDER BY TOTAL_ORDER DESC
LIMIT 3
