# Write your MySQL query statement below
SELECT SUBSTR(trans_date, 1, 7) AS month,
       country,
       COUNT(SUBSTR(trans_date, 1, 7)) AS trans_count,
       COUNT(CASE WHEN state = 'approved' THEN 1 END) AS approved_count,
       SUM(amount) AS trans_total_amount,
       SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount  # 없는 경우 0를 처리해줘야함
FROM Transactions
GROUP BY MONTH, country
