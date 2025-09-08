-- VIEWS

-- Create database and use it
CREATE DATABASE IF NOT EXISTS views_demo;
USE views_demo;

-- Create base tables
CREATE TABLE departments (
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(100) NOT NULL
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(100) NOT NULL,
    salary DECIMAL(10,2),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

-- Insert sample departments
INSERT INTO departments (dept_name) VALUES
('HR'),
('Finance'),
('IT'),
('Marketing');

-- Insert sample employees
INSERT INTO employees (emp_name, salary, dept_id) VALUES
('Alice Johnson', 55000, 1),
('Bob Smith', 72000, 2),
('Charlie Brown', 68000, 3),
('Diana Prince', 80000, 3),
('Ethan Hunt', 90000, 4);

-- View the data
SELECT * FROM employees;
SELECT * FROM departments;

-- Create a view to show the employees with their departments
CREATE VIEW emp_dept_junction_table AS 
SELECT e.emp_id, 
       e.emp_name, 
       d.dept_name
FROM employees e INNER JOIN departments d
ON e.dept_id=d.dept_id;

SELECT * FROM emp_dept_junction_table;

-- Create a view showing the average salary per department
CREATE VIEW salary_per_department AS
SELECT f.dept_name, 
       AVG(f.salary) FROM 
		   (SELECT d.dept_id, 
				   d.dept_name,
				   e.salary
			FROM departments d INNER JOIN employees e
			ON d.dept_id=e.dept_id ) 
        AS f
GROUP BY f.dept_id;

SELECT * FROM salary_per_department;

-- List all the views
SHOW FULL TABLES IN views_demo WHERE TABLE_TYPE LIKE 'VIEW';

-- Drop views
DROP VIEW salary_per_department;