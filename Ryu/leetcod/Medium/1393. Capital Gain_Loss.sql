# Write your MySQL query statement below
SELECT stock_name, 
  SUM(CASE OPERATION
    WHEN 'BUY' THEN -price     # BUY 일때 -price
    WHEN 'SELL' THEN +price    # SELL 일경우 price
    END) AS capital_gain_loss  # END : CASE 끝마침
FROM Stocks
GROUP BY stock_name
