-- VARIABLES IN SQL

-- Create and Use a database
CREATE DATABASE variables;
USE variables;

-- Create a simple table employees
CREATE TABLE employees(
	id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Populate the table by inserting data
INSERT INTO employees(id,name) VALUES (1,'Ashish'),(2,'John'),(3,'ALice'),(4,'Bob'),(5,'Kara');

-- View the data
SELECT * FROM employees;

-- User-defined variables
SET @x=100;
SET @y=200;
SELECT @x+@y AS sum;

-- Query results can be stored in a variable
SELECT name INTO @emp_name FROM employees WHERE id=1;
SELECT @emp_name;

-- Variables within procedures
DELIMITER //

CREATE PROCEDURE square_of_cube(IN num INT, OUT res INT)
BEGIN
	DECLARE temp INT;
    SET temp = num*num;
    SET res = temp*temp*temp;
END //
DELIMITER ; 

CALL square_of_cube(10,@param);
SELECT @param;

-- System Variables 
SET @@autocommit=0;
SET @@auto_increment_increment=10;
SET @@auto_increment_offset=10;



