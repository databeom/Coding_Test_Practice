# WITH cate AS (SELECT (CASE WHEN income < 20000 THEN 'Low Salary' 
#             WHEN income between 20000 AND 50000 THEN 'Average Salary'
#             WHEN income > 50000 THEN 'High Salary'
#         END) as category
# FROM Accounts
# )
# SELECT category
#      , count(category) as accounts_count
# FROM cate
# GROUP BY category

(SELECT "Low Salary" as category, count(income) as accounts_count FROM Accounts WHERE income < 20000)
UNION
(SELECT "Average Salary" as category, count(income) as accounts_count FROM Accounts WHERE income between 20000 AND 50000)
UNION
(SELECT "High Salary" as category, count(income) as accounts_count FROM Accounts WHERE income > 50000)
