use Learning_joins;

select *
from project;

-- INNER JOIN
-- Enlist all the employees ID'S, names along with the Project allocated to them.

SELECT e.id as empID,e.fname as empName ,p.id as ProjectID,p.name as ProjectName
FROM employee as e
JOIN project as p
ON e.id = p.empID
ORDER BY e.id ASC;

-- Fetch out all the employee ID's and their contact detail who have been working from Jaipur with the clients name working in Hyderabad.
SELECT e.id as empID,e.fname as empName, e.City as empCity, c.first_name as client , c.City as clientCity
FROM employee as e
JOIN client as c
ON e.id = c.empID
WHERE e.City = "Jaipur" && c.City = "Hyderabad";

-- LEFT JOIN
-- Fetch out each project allocated to each employee.

SELECT e.id as empID , e.fname as empName , e.emailID , p.name
FROM employee as e
LEFT JOIN project as p
ON e.id = p.empID;


-- RIGHT JOIN
-- List out all the projects along with the employee's name and their respective allocated email ID.

SELECT p.name as project , e.id as empID , e.fname as empName , e.emailID as email FROM employee as e
RIGHT JOIN project as p
ON e.id = p.empID;


-- can we use join(INNER) without using any join keyword ?  - YES
SELECT e.id as empID,e.fname as empName ,p.id as ProjectID,p.name as ProjectName
FROM employee as e , project as p
WHERE e.id = p.empID
ORDER BY e.id ASC;
-- above query is same as the first join query in this file



-- SUB QUERIES - three clause - where from select  

-- emp details working in more than 1 projects
-- WHERE clause 
SELECT *
FROM employee as e
WHERE e.id in ( 
				 SELECT empID 
                 FROM PROJECT
                 GROUP BY empID
                 HAVING COUNT(*) > 1
			  );

-- FROM clause - derived tables use alias 
-- select max age person whose first name has 'a'

SELECT max(Age)
FROM ( 
		SELECT age
        FROM employee
        WHERE fname like "%a%"
	 ) as temp;

-- Corelated subquery - where inner query refers outer query
-- find 3rd oldest employee

SELECT * 
FROM employee AS e1
WHERE 3 = (	
		SELECT COUNT(*)
        FROM employee as e2
        where e2.age >= e1.age # all the values greater than a perticular value of e1
);

-- hence a corelated subquery executes once from each candidate row considered by outer query.

 