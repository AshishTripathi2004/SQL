-- SELF JOIN

-- Create and use database
CREATE DATABASE self_join_tutorial;
USE self_join_tutorial;

-- Create employees table with manager_id referencing the same table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    job_title VARCHAR(100),
    salary DECIMAL(10, 2),
    department VARCHAR(50),
    manager_id INT,
    hire_date DATE
);

-- Insert sample employee data with hierarchical management structure
INSERT INTO employees VALUES
(1, 'James', 'Smith', 'CEO', 150000.00, 'Executive', NULL, '2010-01-15'),
(2, 'Sarah', 'Johnson', 'CTO', 140000.00, 'Technology', 1, '2011-03-10'),
(3, 'Michael', 'Williams', 'CFO', 140000.00, 'Finance', 1, '2012-07-22'),
(4, 'Jessica', 'Brown', 'HR Director', 110000.00, 'Human Resources', 1, '2013-05-18'),
(5, 'David', 'Miller', 'Senior Developer', 95000.00, 'Technology', 2, '2014-11-05'),
(6, 'Emily', 'Davis', 'Developer', 80000.00, 'Technology', 5, '2016-08-12'),
(7, 'Robert', 'Wilson', 'Junior Developer', 65000.00, 'Technology', 5, '2019-02-28'),
(8, 'Jennifer', 'Taylor', 'Accountant', 75000.00, 'Finance', 3, '2015-09-17'),
(9, 'Thomas', 'Anderson', 'Accountant', 72000.00, 'Finance', 3, '2017-06-24'),
(10, 'Lisa', 'Martinez', 'HR Specialist', 68000.00, 'Human Resources', 4, '2018-04-30');


-- Display the employee details
SELECT * FROM employees;

-- Find the pairs of employees with their managers
SELECT e.employee_id,
	   CONCAT(e.first_name,e.last_name) AS employee_name,
       CONCAT(m.first_name,m.last_name) AS manager_name
FROM employees e LEFT JOIN employees m
ON e.manager_id=m.employee_id;

-- Group the employees working in the same department
SELECT department,
       GROUP_CONCAT(CONCAT(first_name," ",last_name) ORDER BY first_name,last_name SEPARATOR ', ') AS list_of_employees
FROM employees
GROUP BY department;

-- Find the employees who work in the same department
SELECT CONCAT(e.first_name," ",e.last_name) AS employee_name,
       GROUP_CONCAT(CONCAT(m.first_name," ",m.last_name) ORDER BY m.first_name,m.last_name SEPARATOR ', ') AS list_of_colleagues,
       e.department
FROM employees e JOIN employees m
ON e.department=m.department AND e.employee_id<m.employee_id
GROUP BY e.employee_id, e.first_name, e.last_name, e.department;

-- Find the difference between the average salary of employees and managers in a department
SELECT e.department,
       ROUND(AVG(e.salary),2),
       ROUND(AVG(m.salary),2),
       ROUND(AVG(m.salary)-AVG(e.salary),2)
FROM employees e JOIN employees m
ON e.manager_id=m.employee_id
GROUP BY e.department;