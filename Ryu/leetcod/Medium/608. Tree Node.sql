# Write your MySQL query statement below
SELECT id, 
  CASE 
    WHEN p_id IS NULL THEN 'Root'
    WHEN id in (SELECT p_id FROM TREE) THEN 'Inner'
    ELSE 'Leaf'
  END AS type
FROM Tree
