-- STORED PROCEDURES

-- Create a database for the company
CREATE DATABASE IF NOT EXISTS organisation;
USE organisation;

-- Create a table within the database
-- employees
CREATE TABLE employees(
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(255) NOT NULL,
    emp_email VARCHAR(255) NOT NULL UNIQUE,
    emp_salary DECIMAL(10,2) NOT NULL,
    bonus_percentage DECIMAL(5,2) DEFAULT 0,
    dept_id INT NOT NULL
) AUTO_INCREMENT=1001;

-- Populate the table
INSERT INTO employees (emp_name, emp_email, emp_salary, bonus_percentage, dept_id) VALUES
-- HR
('Amit Sharma', 'amit.sharma@company.in', 90000.00, 12.00, 1),
('Rahul Mehta', 'rahul.mehta@company.in', 60000.00, 7.00, 1),
('Neha Singh', 'neha.singh@company.in', 55000.00, 6.50, 1),
('Varun Anand', 'varun.anand@company.in', 50000.00, 5.00, 1),
('Anand Shukla', 'anand.shukla@company.in', 52000.00, 6.00, 1),

-- Finance
('Neha Verma', 'neha.verma@company.in', 95000.00, 11.00, 2),
('Sneha Reddy', 'sneha.reddy@company.in', 58000.00, 5.50, 2),
('Lakshmi Krishnan', 'lakshmi.krishnan@company.in', 56000.00, 6.00, 2),
('Pallavi Mukherjee', 'pallavi.mukherjee@company.in', 59000.00, 5.00, 2),
('Kirti Raval', 'kirti.raval@company.in', 60000.00, 5.50, 2),

-- IT
('Rohan Iyer', 'rohan.iyer@company.in', 110000.00, 15.00, 3),
('Arjun Kulkarni', 'arjun.kulkarni@company.in', 72000.00, 8.00, 3),
('Siddharth Jain', 'siddharth.jain@company.in', 70000.00, 7.50, 3),
('Ashwin Shetty', 'ashwin.shetty@company.in', 71000.00, 7.00, 3),
('Devendra Das', 'devendra.das@company.in', 72000.00, 7.50, 3),

-- Sales
('Priya Nair', 'priya.nair@company.in', 88000.00, 10.00, 4),
('Divya Kapoor', 'divya.kapoor@company.in', 47000.00, 5.00, 4),
('Aishwarya Sen', 'aishwarya.sen@company.in', 48000.00, 5.50, 4),
('Smita Kulshreshtha', 'smita.kulshreshtha@company.in', 46000.00, 5.00, 4),
('Manju Prakash', 'manju.prakash@company.in', 49000.00, 5.50, 4),

-- Marketing
('Sanjay Gupta', 'sanjay.gupta@company.in', 87000.00, 9.00, 5),
('Nikhil Patil', 'nikhil.patil@company.in', 51000.00, 5.50, 5),
('Deepak Yadav', 'deepak.yadav@company.in', 50000.00, 5.00, 5),
('Chetan Rathi', 'chetan.rathi@company.in', 53000.00, 5.50, 5),
('Ravi Sethi', 'ravi.sethi@company.in', 52000.00, 5.00, 5),

-- Operations
('Kavita Menon', 'kavita.menon@company.in', 92000.00, 10.00, 6),
('Meera Joshi', 'meera.joshi@company.in', 64000.00, 7.50, 6),
('Monica Dutta', 'monica.dutta@company.in', 62000.00, 6.50, 6),
('Juhi Prasad', 'juhi.prasad@company.in', 61000.00, 6.00, 6),
('Geeta Rawat', 'geeta.rawat@company.in', 63000.00, 6.50, 6),

-- Customer Support
('Vikram Rao', 'vikram.rao@company.in', 93000.00, 11.00, 7),
('Aditya Rangan', 'aditya.rangan@company.in', 77000.00, 8.50, 7),
('Karan Singh', 'karan.singh@company.in', 74000.00, 7.50, 7),
('Ramesh Choudhary', 'ramesh.choudhary@company.in', 76000.00, 7.50, 7),
('Arvind Ghosh', 'arvind.ghosh@company.in', 78000.00, 8.00, 7),

-- Legal
('Anjali Mishra', 'anjali.mishra@company.in', 94000.00, 12.00, 8),
('Swati Saxena', 'swati.saxena@company.in', 85000.00, 10.00, 8),
('Shreya Banerjee', 'shreya.banerjee@company.in', 81000.00, 9.00, 8),
('Sunita Pawar', 'sunita.pawar@company.in', 83000.00, 9.00, 8),
('Nisha Khatri', 'nisha.khatri@company.in', 85000.00, 9.50, 8),

-- R&D
('Manish Desai', 'manish.desai@company.in', 97000.00, 12.00, 9),
('Gaurav Malhotra', 'gaurav.malhotra@company.in', 69000.00, 7.00, 9),
('Rajesh Pillai', 'rajesh.pillai@company.in', 67000.00, 6.50, 9),
('Mohan Tripathi', 'mohan.tripathi@company.in', 68000.00, 6.00, 9),
('Yogesh Bhatt', 'yogesh.bhatt@company.in', 70000.00, 6.50, 9),

-- Admin
('Pooja Bhatia', 'pooja.bhatia@company.in', 99000.00, 13.00, 10),
('Ritika Agarwal', 'ritika.agarwal@company.in', 91000.00, 11.00, 10),
('Tanvi Chawla', 'tanvi.chawla@company.in', 93000.00, 12.00, 10),
('Ishita Bansal', 'ishita.bansal@company.in', 94000.00, 12.00, 10),
('Kusum Tiwari', 'kusum.tiwari@company.in', 95000.00, 12.50, 10);

-- View the table contents
SELECT * FROM employees;

-- Create a procedure to simply extract the record of all the employees
DELIMITER //
CREATE PROCEDURE getInformation()
BEGIN
	SELECT * FROM employees;
END //
DELIMITER ;

CALL getInformation();


-- Create a procedure to compute the bonus of an employee given the employee id
DELIMITER // 
CREATE PROCEDURE getBonus(IN empId INT, OUT bonus_amount DECIMAL(10,2))
BEGIN
	DECLARE bonus_per DECIMAL(5,2);
    DECLARE salary DECIMAL(10,2);
    
    SELECT bonus_percentage INTO bonus_per FROM employees WHERE emp_id=empId;
	SELECT emp_salary INTO salary FROM employees WHERE emp_id=empId;
    
    SET bonus_amount=(salary*bonus_per)/100;
    
END //
DELIMITER ;

CALL getBonus(1001,@param);
SELECT @param;

-- Classify the salary of an employee
-- Criteria >70000 : Highest; between 50000 to 70000 : Moderate; below 50000 : Low
DELIMITER //
CREATE PROCEDURE classifySalary(IN empID INT)
BEGIN
	DECLARE salary DECIMAL(10,2);
    DECLARE result VARCHAR(20);
    
    SELECT emp_salary INTO salary FROM employees WHERE emp_id=empId;
    
    IF salary>70000 THEN
		SELECT 'High Salary' AS result;
	ELSEIF salary BETWEEN 50000 AND 70000 THEN
		SELECT 'Moderate Salary' AS result;
	ELSE 
		SELECT 'Low Salary' AS result;
	END IF;
END//
DELIMITER ;

CALL classifySalary(1002);
CALL classifySalary(1020);

-- Create a function that takes INOUT
DELIMITER //
CREATE PROCEDURE doubleIt(INOUT num INT)
BEGIN
	SET num = num*2;
END //
DELIMITER ;

SET @x=15;
CALL doubleIt(@x);
SELECT @x;

-- Enlist all the existing procedures in the database
SHOW PROCEDURE STATUS WHERE db='organisation';

-- Show the details about the specified procedure
SHOW CREATE PROCEDURE doubleIt;

-- Drop a Procedure
DROP PROCEDURE doubleIt;





