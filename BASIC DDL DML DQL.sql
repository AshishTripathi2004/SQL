-- SQL BASIC DDL, DML AND DQL

-- Create a new database
-- Syntax : CREATE DATABASE <db_name>
CREATE DATABASE sql_demo;

-- Use or Switch to a database
-- Syntax : USE <db_name>
USE sql_demo;

-- Show the list of existing databases
-- Syntax : SHOW DATABASES;
SHOW DATABASES;

-- Show the list of tables within the existing database
-- Syntax : SHOW TABLES;
SHOW TABLES;

-- Check the availaible storage engines
-- Syntax : SHOW ENGINES;
SHOW ENGINES;

-- Create a new table
-- Syntax : CREATE TABLE <table_name> (
--          col1 data_type constraints, col2 datatype constraints, .... so on);
CREATE TABLE departments(
	dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE employees(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    mail VARCHAR(255) UNIQUE,
    salary DECIMAL(10,2) NOT NULL,
    age INT NOT NULL CHECK(age>=21),
    gender ENUM('Male','Female','Other'),
    bonus_percentage DECIMAL(5,2) DEFAULT 2,
    dept_id INT NOT NULL,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id) ON DELETE CASCADE
);

-- Verify the structure of the table
-- Syntax : DESCRIBE table_name;
DESCRIBE departments;
DESCRIBE employees;

-- Populate the tables with data
-- Syntax : INSERT INTO table_name(col1, col2...) VALUES (val1, val2....);
-- Insert into departments
INSERT INTO departments (dept_id, dept_name) VALUES
(1, 'Human Resources'),
(2, 'Finance'),
(3, 'Technology'),
(4, 'Marketing'),
(5, 'Operations');

-- Insert into employees
INSERT INTO employees (name, mail, salary, age, gender, bonus_percentage, dept_id) VALUES
('Alice Johnson', 'alice.johnson@example.com', 55000.00, 28, 'Female', 3.5, 1),
('Bob Smith', 'bob.smith@example.com', 72000.00, 32, 'Male', 2.5, 2),
('Charlie Brown', 'charlie.brown@example.com', 65000.00, 25, 'Male', 4.0, 3),
('Diana Prince', 'diana.prince@example.com', 80000.00, 29, 'Female', 3.0, 4),
('Ethan Hunt', 'ethan.hunt@example.com', 95000.00, 35, 'Male', 5.0, 3),
('Fiona Gallagher', 'fiona.gallagher@example.com', 50000.00, 27, 'Female', 2.0, 1),
('George Martin', 'george.martin@example.com', 60000.00, 31, 'Male', 2.5, 5),
('Hannah Baker', 'hannah.baker@example.com', 70000.00, 24, 'Female', 3.0, 2),
('Ian Curtis', 'ian.curtis@example.com', 68000.00, 26, 'Male', 2.8, 3),
('Julia Roberts', 'julia.roberts@example.com', 82000.00, 30, 'Female', 3.2, 4),
('Kevin Hart', 'kevin.hart@example.com', 75000.00, 33, 'Male', 4.0, 5),
('Laura Palmer', 'laura.palmer@example.com', 58000.00, 28, 'Female', 2.5, 1);

-- Show the data in the tables
-- Syntax : SELECT * FROM table_name;
SELECT * FROM departments;
SELECT * FROM employees;

-- Alter the table employees to add a new column isPermanent
-- Syntax : ALTER TABLE table_name ADD COLUMN column_name datatype constraints;
ALTER TABLE employees ADD COLUMN isPermanent BOOLEAN DEFAULT 1;

-- Alter the table to update the age check from 21 to 18
-- Syntax : ALTER TABLE table_name MODIFY COLUMN column_name datatype constraints;
ALTER TABLE employees MODIFY COLUMN age INT NOT NULL CHECK(age>=18);

-- Alter table to move the salary after gender
-- Syntax : ALTER TABLE table_name MODIFY COLUMN column_name datatype constraints AFTER column_name;
ALTER TABLE employees MODIFY COLUMN salary DECIMAL(10,2) NOT NULL AFTER gender;

-- Alter the table to delete the isPermanent column
-- Syntax : ALTER TABLE table_name DROP COLUMN column_name;
ALTER TABLE employees DROP COLUMN isPermanent;

-- Inorder to allow updates , we need to turn off safe mode
SET sql_safe_updates = 0;

-- Increase the salary by 10 percent of individuals earning below 60000
-- Syntax : UPDATE table_name SET new_state WHERE condition;
UPDATE employees SET salary=salary*1.1 WHERE salary<60000;

-- Selective filtering
-- Syntax : SELECT col1, col2.. FROM table_name WHERE condition;
SELECT name, salary FROM employees WHERE salary>70000;

-- Range Queries
-- Syntax : SELECT col1,col2,... FROM table_name WHERE col1 BETWEEN val1 AND val2; 
SELECT name, salary FROM employees WHERE salary BETWEEN 60000 AND 70000;

-- In keyword
-- Syntax : SELECT col1,col2,... FROM table_name WHERE col1 IN (list_of_values);
SELECT name, dept_id FROM employees WHERE dept_id IN (1,3,5);






