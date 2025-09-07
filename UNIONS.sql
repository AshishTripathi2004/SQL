-- UNION AND UNION ALL

CREATE DATABASE unions;
USE unions;

-- Create tables for our demonstration
CREATE TABLE headquarters_employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    hire_date DATE,
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

CREATE TABLE branch_employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    hire_date DATE,
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    signup_date DATE,
    status VARCHAR(20)
);

-- Sample Data
-- ====================================================================
-- Insert data into headquarters_employees
INSERT INTO headquarters_employees VALUES
(101, 'John', 'Smith', 'john.smith@company.com', '2018-03-15', 'IT', 75000.00),
(102, 'Mary', 'Johnson', 'mary.johnson@company.com', '2019-06-22', 'HR', 65000.00),
(103, 'Robert', 'Williams', 'robert.williams@company.com', '2017-11-08', 'Finance', 82000.00),
(104, 'Susan', 'Brown', 'susan.brown@company.com', '2020-01-30', 'Marketing', 68000.00),
(105, 'Michael', 'Davis', 'michael.davis@company.com', '2018-09-12', 'IT', 78000.00);

-- Insert data into branch_employees
INSERT INTO branch_employees VALUES
(201, 'James', 'Wilson', 'james.wilson@company.com', '2019-04-18', 'Sales', 62000.00),
(202, 'Patricia', 'Moore', 'patricia.moore@company.com', '2020-07-25', 'Marketing', 59000.00),
(203, 'Linda', 'Taylor', 'linda.taylor@company.com', '2018-08-15', 'HR', 61000.00),
(204, 'Robert', 'Williams', 'robert.williams@company.com', '2017-11-08', 'Finance', 82000.00), -- Duplicate employee who works at both locations
(205, 'Elizabeth', 'Anderson', 'elizabeth.anderson@company.com', '2019-12-03', 'Sales', 64000.00);

-- Insert data into customers
INSERT INTO customers VALUES
(1001, 'David', 'Miller', 'david.miller@email.com', '2019-02-14', 'Active'),
(1002, 'Sarah', 'Wilson', 'sarah.wilson@email.com', '2020-05-20', 'Active'),
(1003, 'Michael', 'Davis', 'michael.davis@email.com', '2018-11-30', 'Inactive'), -- Same name as an employee
(1004, 'Jennifer', 'Garcia', 'jennifer.garcia@email.com', '2021-01-05', 'Active'),
(1005, 'Robert', 'Martinez', 'robert.martinez@email.com', '2019-08-22', 'Active');

-- View Data from the tables
SELECT * FROM headquarters_employees;
SELECT * FROM branch_employees;
SELECT * FROM customers;

-- Retrieve the employee details from both the offices without duplicates
SELECT * FROM headquarters_employees 
UNION 
SELECT * FROM branch_employees;

-- Retrieve the employee details from both the offices
SELECT first_name, last_name FROM headquarters_employees 
UNION ALL
SELECT first_name, last_name FROM branch_employees;

-- Add a descriptor column
SELECT customer_id, first_name, last_name, 'Customer' AS contact_type FROM customers
UNION 
SELECT employee_id, first_name, last_name, 'Employee' AS contact_type FROM branch_employees;

-- Sort all employees info by last name
SELECT first_name, last_name FROM headquarters_employees 
UNION ALL
SELECT first_name, last_name FROM branch_employees
ORDER BY last_name DESC;

-- Get all employees with salary above 70000
SELECT * FROM headquarters_employees 
WHERE salary>70000
UNION ALL
SELECT * FROM branch_employees
WHERE salary>70000
ORDER BY salary DESC;

-- Handling different table structures using NULL 
SELECT customer_id,first_name,last_name,NULL,NULL,status FROM customers
UNION ALL
SELECT employee_id,first_name,last_name,salary,department,NULL FROM branch_employees;

-- Find unique departments across all office locations
SELECT department FROM branch_employees
UNION 
SELECT department FROM headquarters_employees;


-- Find departments operational in both the office locations
SELECT DISTINCT department FROM headquarters_employees 
WHERE department IN (
	SELECT department FROM branch_employees
);
