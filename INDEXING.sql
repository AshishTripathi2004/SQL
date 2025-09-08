-- INDEXES

-- Create and Use a database
CREATE DATABASE indexing;
USE indexing;

-- Create a table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(100) NOT NULL,
    emp_email VARCHAR(100) UNIQUE,
    emp_age INT,
    department VARCHAR(50)
);

-- Insert Values 
INSERT INTO employees (emp_name, emp_email, emp_age, department) VALUES
('Alice Johnson', 'alice@example.com', 28, 'HR'),
('Bob Smith', 'bob@example.com', 35, 'Finance'),
('Charlie Brown', 'charlie@example.com', 29, 'Tech'),
('David Miller', 'david@example.com', 40, 'Marketing'),
('Ethan Hunt', 'ethan@example.com', 33, 'Tech'),
('Fiona Gallagher', 'fiona@example.com', 25, 'Finance'),
('George Martin', 'george@example.com', 37, 'HR');

-- Display the indexes
-- Primary Key and Unique Constraints create Indexes automatically
SHOW INDEXES FROM employees;

-- Create an index using the employee name
CREATE INDEX idx_name ON employees(emp_name);

-- Create a composite index with name and age
CREATE INDEX idx_composite ON employees(emp_name,emp_age);

-- See the effect of indexing
EXPLAIN SELECT * FROM employees WHERE emp_name = 'Ethan Hunt';

-- Drop the index
DROP INDEX idx_name ON employees;
SHOW INDEXES FROM employees;

