# DataBase management (DDL)
CREATE DATABASE IF NOT EXISTS learning;
CREATE DATABASE To_delete;
DROP DATABASE IF EXISTS To_delete;
SHOW DATABASES;
# show tables 
USE learning;

# SQL DataTypes 

# 1. CHAR vs VARCHAR (0-255) , both stores 255 characters of string 
# CHAR "RAAM" will assign 255 byte static storage
# VARCHAR "RAAM" will assign only 4 characters 
# therefore VARCHAR is more storage efficient than CHAR

# 2. BLOB - stores the content in form of bytes , audio video etc

# 3. INT , BIGINT - integer type
# 4. FLOAT - 23 digit precision, DOUBLE  - Decimal with 24 to 53 digits

# 5. DATE ( YYYY-MM-DD )
# 6. TIME ( HH:MM:SS )
# 7. TIMESTAMP YYYYMMDDHHMMSS

# 8. BOOLEAN - 0/1 , implemented as TINYINT internally 

# DDL - CREATE , DROP , ALTER TABLE , TRUNCATE , RENAME 

CREATE TABLE IF NOT EXISTS Worker(
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    FIRST_NAME CHAR(25),
    LAST_NAME CHAR(25),
    SALARY INT(15),
    JOINING_DATE DATETIME,
    DEPARTMENT CHAR(25)
);

INSERT INTO Worker
	(WORKER_ID , FIRST_NAME, LAST_NAME, SALARY , JOINING_DATE , DEPARTMENT) VALUES
		(001,'Monika','Arora',100000,'14-02-20 09:00:00','HR'),
		(002,'Niharika','Verma',80000,'14-06-11 09:00:00','Admin'),
		(003,'Vishal','Singhal',300000,'14-02-20 09:00:00','HR'),
		(004,'Amitabh','Singh',500000,'14-02-20 09:00:00','Admin'),
		(005,'Vivek','Bhati',500000,'14-06-11 09:00:00','Admin'),
        (006,'Vipul','Diwan',200000,'14-06-11 09:00:00','Account'),
        (007,'Satish','Kumar',75000,'14-01-20 09:00:00','Account'),
        (008,'Geetika','Chauhan',90000,'14-04-11 09:00:00','Admin');

UPDATE Worker
SET FIRST_NAME = 'Nisarg' , LAST_NAME = 'Patel'
WHERE WORKER_ID = 004;

SELECT * FROM Worker;

CREATE TABLE Bonus(
	WORKER_REF_ID INT,
    BONUS_AMT INT(15),
    BONUS_DATE DATETIME,
    FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE # if the rows in the referenced table are deleted , rows in this tables corresponding to the key is also deleted
);

INSERT INTO Bonus
      (WORKER_REF_ID,BONUS_AMT,BONUS_DATE) VALUES
      (001,5000,'16-02-20'),
      (002,3000,'16-06-11'),
      (003,4000,'16-02-20'),
      (001,4500,'16-02-20'),
      (002,3500,'16-06-11');

ALTER TABLE Bonus 
RENAME COLUMN BONUS_AMT TO BONUS_AMOUNT ;

CREATE TABLE Title(
	WORKER_REF_ID INT,
    WORKER_TITLE CHAR(25),
    AFFECTED_FROM DATETIME,
    FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title
	(WORKER_REF_ID , WORKER_TITLE , AFFECTED_FROM) VALUES
    (001,'Manager','2016-02-20 00:00:00'),
    (002,'Executive','2016-06-11 00:00:00'),
    (008,'Executive','2016-06-11 00:00:00'),
    (005,'Manager','2016-06-11 00:00:00'),
    (004,'Asst. Manager','2016-06-11 00:00:00'),
    (007,'Executive','2016-06-11 00:00:00'),
    (006,'Lead','2016-06-11 00:00:00'),
    (003,'Lead','2016-06-11 00:00:00');


# TRUNCATE TABLE Title; # delets all the rows the table tilte , but not the table itself
        
# view in sql 

-- it helps to create a level of abstraction
-- a view lets us to create a virtual table which exists only logically 

-- creating a view
CREATE VIEW custom_view AS
SELECT fname,lname
FROM employee;

-- viewing a view - just like a normal table
SELECT *
FROM custom_view;

-- Altering a view
ALTER VIEW custom_view AS
SELECT fname,lname,age
FROM employee;

SELECT *
FROM custom_view;

-- Droping a view
DROP VIEW IF EXISTS custom_view;
        
        
        
        
        