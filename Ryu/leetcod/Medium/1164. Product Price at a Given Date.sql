# Write your MySQL query statement below
WITH P AS
(
SELECT product_id, MAX(change_date) AS M_CD
FROM Products
WHERE change_date <= '2019-08-16'
GROUP BY product_id
), F AS
(
    SELECT P_O.product_id, P_O.new_price, P_O.change_date
    FROM Products AS P_O LEFT JOIN P ON P_O.product_id = P.product_id
    WHERE P_O.change_date = P.M_CD OR P.product_id IS NULL
    GROUP BY P_O.product_id
)

SELECT product_id, CASE WHEN change_date <= "2019-08-16" THEN new_price
                        ELSE 10 END AS price
FROM F
