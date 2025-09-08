-- STRING FUNCTIONS

-- Create and Use a database
CREATE DATABASE strings;
USE strings;

-- Create a table and populate it with results
CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    email VARCHAR(100)
);

INSERT INTO employees (emp_name, department, email) VALUES
('Michael Scott', 'Sales', 'michael.scott@dundermifflin.com'),
('Jim Halpert', 'Sales', 'jim.halpert@dundermifflin.com'),
('Pam Beesly', 'Reception', 'pam.beesly@dundermifflin.com'),
('Dwight Schrute', 'Sales', 'dwight.schrute@dundermifflin.com'),
('Angela Martin', 'Accounting', 'angela.martin@dundermifflin.com'),
('Kevin Malone', 'Accounting', 'kevin.malone@dundermifflin.com'),
('Oscar Martinez', 'Accounting', 'oscar.martinez@dundermifflin.com'),
('Stanley Hudson', 'Sales', 'stanley.hudson@dundermifflin.com'),
('Phyllis Vance', 'Sales', 'phyllis.vance@dundermifflin.com'),
('Ryan Howard', 'Temp', 'ryan.howard@dundermifflin.com');

-- Convert all employee names to uppercase
SELECT UPPER(emp_name) FROM employees;

-- Convert all department names to lowercase.
SELECT LOWER(department) FROM employees;

-- Extract the first 3 letters of each employee’s name
SELECT LEFT(emp_name,3) FROM employees;

-- Extract the last 4 characters of each email
SELECT RIGHT(email,4) FROM employees;

-- Find the length of each employee’s email
SELECT email, LENGTH(email) FROM employees;

-- Replace "dundermifflin" with "dm" in emails
SELECT email, REPLACE(email,'dundermifflin','dm') FROM employees;

-- Concatenate employee name and department with " - "
SELECT CONCAT(emp_name, '-', department) FROM employees;

-- Extract the first name and last name from emp_name
SELECT emp_name AS full_name, SUBSTRING_INDEX(emp_name, ' ', 1) AS first_name, SUBSTRING_INDEX(emp_name, ' ', -1) AS last_name FROM employees;

-- Extract characters from positions 2 upto next 5 characters in departments
SELECT SUBSTRING(department, 2, 5) FROM employees;