SELECT name 
FROM employee 
WHERE id IN (SELECT managerId 
             FROM Employee
             GROUP BY 1
             HAVING COUNT(managerId)>=5)
