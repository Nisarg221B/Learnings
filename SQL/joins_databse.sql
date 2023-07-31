# creating database for joins

# types of joins
# inner join  - common between the left and right table based on some key

# outer join - left , right , full
# left-join - gives all the entry of left table and common entries of left and right 
# right-join - gives all the entry of right table and common entries of left and right

# theres no keyword for full join its basically left-join UNION right-join

# Cross join - Cartisean product ( no industrial use )

# self join - when a table is joined with itself , 
# eg : Employee table may have a SupervisorID column that points to the employee that is the boss of the current employee.
#      To query the data and get information for both people in one row, you could self join

CREATE DATABASE IF NOT EXISTS LEARNING_JOINS;

USE LEARNING_JOINS;

CREATE TABLE IF NOT EXISTS Project(
	id INT NOT NULL UNIQUE PRIMARY KEY,
    empID INT,
    name VARCHAR(25),
    startdate DATE,
    clientID INT(2)
);

CREATE TABLE IF NOT EXISTS Employee(
	id INT NOT NULL UNIQUE PRIMARY KEY,
    fname VARCHAR(15),
    lname VARCHAR(15),
    Age  INT(2),
    emailID VARCHAR(25),
    PhoneNo INT(3),
    City VARCHAR(10)
);

CREATE TABLE IF NOT EXISTS Client(
	id INT NOT NULL UNIQUE PRIMARY KEY,
    first_name VARCHAR(15),
    last_name VARCHAR(15),
    Age  INT(2),
    emailID VARCHAR(25),
    PhoneNo INT(3),
    City VARCHAR(10),
    empID INT(2)
);

INSERT INTO PROJECT(id,empID,name,startdate,clientID)
VALUES (1,2,'A',"2021-04-21",3),
	   (2,1,'B',"2021-03-12",1),
       (3,3,'C',"2021-01-16",5),
	   (4,3,'D',"2021-04-27",2),
       (5,5,'E',"2021-05-01",4);

INSERT INTO Employee(id,fname,lname,Age,emailID,PhoneNo,City)
VALUES  (1,'Aman','proto',32,'aman@gmail.com',893,'Delhi'),
		(2,'Yagya','Narayan',44,'yagya@gmail.com',222,'Palam'),
        (3,'Rahul','BD',22,'rahul@gmail.com',444,'Kolkata'),
        (4,'Jatin','Hermit',31,'jatin@gmail.com',666,'Raipur'),
        (5,'PK','Pandey',21,'pk@gmail.com',555,'Jaipur');

INSERT INTO Client(id,first_name,last_name,Age,emailID,PhoneNo,City,empID)
VALUES 	(1,'Mac','Rogers',47,'mac@gmail.com',333,'Kolkata',3),
		(2,'Max','Poirier',27,'max@gmail.com',222,'Kolkata',3),
        (3,'Peter','Jain',24,'peter@gmail.com',111,'Delhi',1),
        (4,'Sushant','Aggarwal',23,'sushant@gmail.com',777,'Hyderabad',5),
        (5,'Pratap','Singh',36,'pratap@gmail.com',888,'Mumbai',2);




