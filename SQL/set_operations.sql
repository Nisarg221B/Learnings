-- SET operations

-- UNION 
-- to apply UNION the cols of the two tables should be same

# SELECT * FROM TABLE1
# UNION 
# SELECT * FROM TABLE2


-- INTERSECT ( theres no keyword for it we have to emulate it using inner join)

# SELECT DISTINCT id FROM T1 INNER JOIN T2 USING(id)

-- MINUS ( we also have emulate this)

# SELECT id
# FROM T1 LEFT JOIN T2 USING(id)
# WHERE T2.id is NULL