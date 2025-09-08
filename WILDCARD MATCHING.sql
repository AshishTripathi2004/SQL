-- Wildcard Character Matching

-- Create and Use a database
CREATE DATABASE wildcard;
USE wildcard;

-- Create a table and populate it with sample data
CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(50),
    course VARCHAR(50)
);

INSERT INTO students (student_name, course) VALUES
('Alice Johnson', 'Computer Science'),
('Bob Smith', 'Mathematics'),
('Charlie Brown', 'Physics'),
('David Williams', 'Computer Science'),
('Eva Green', 'Biology'),
('Franklin White', 'Computer Science'),
('Grace Adams', 'Mathematics'),
('Helen Carter', 'History'),
('Ian Clark', 'Computer Science'),
('Jackie Miller', 'Physics');

-- Find all students whose name starts with 'A'
SELECT * FROM students WHERE student_name LIKE 'A%';

-- Find all students whose name ends with 'n'
SELECT * FROM students WHERE student_name LIKE '%n';

-- Find all students whose name contains 'li' anywhere
SELECT * FROM students WHERE student_name LIKE '%li%';

-- Find all students whose course name starts with 'Comp'
SELECT * FROM students WHERE course LIKE 'Comp%';

-- Find all students whose name is exactly 5 characters long
SELECT * FROM students WHERE student_name LIKE '_____';

-- Find all students whose name has 'a' as the second letter
SELECT * FROM students WHERE student_name LIKE '_a%';

-- Find all students whose course does NOT contain the word 'Science'
SELECT * FROM students WHERE course NOT LIKE '%Science%';

-- Find all students whose name starts with 'D' and ends with 's'
SELECT * FROM students WHERE student_name LIKE 'D%s';

-- Find all students whose name contains double 'o' (like 'Brown')
SELECT * FROM students WHERE student_name LIKE '%o%o%';

-- Find all students whose name starts with A or E
SELECT * FROM students WHERE student_name REGEXP '^[AE]';

-- Find all students whose name ends with 'n'
SELECT * FROM students WHERE student_name REGEXP 'n$';

-- Find all students whose name contains exactly two consecutive vowels (aa, ee, ii, oo, uu)
SELECT * FROM students WHERE student_name REGEXP '(aa|ee|oo|ii|uu)';

-- Find all students whose name contains double letters (like "ll", "ss", "tt")
SELECT * FROM students WHERE student_name REGEXP '(.)\\1';
