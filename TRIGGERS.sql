-- TRIGGERS IN SQL

-- Create and Use a Database
CREATE DATABASE trigger_demo;
USE trigger_demo;

-- Create a users table and users log table
CREATE TABLE users(
     user_id INT PRIMARY KEY AUTO_INCREMENT,
     user_name VARCHAR(100) NOT NULL,
     user_age INT NOT NULL
); 

CREATE TABLE user_log(
	log_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    event_action VARCHAR(15),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Define a trigger that logs each insertion into the table
DELIMITER $$ 
CREATE TRIGGER on_insert_log_creation_trigger
AFTER INSERT ON users 
FOR EACH ROW
BEGIN
	INSERT INTO user_log(user_id, event_action) 
    VALUES (NEW.user_id, 'Insertion');
END $$
DELIMITER ;

-- Define a trigger that checks the age of the user to ensure the user is 18 or above
DELIMITER $$
CREATE TRIGGER on_insert_age_check_trigger
BEFORE INSERT ON users
FOR EACH ROW
BEGIN
	IF NEW.user_age<18 THEN
    SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT = 'The user\'s age must be 18 or above...';
    END IF;
END $$ 
DELIMITER ;

-- Define a trigger to log deletion
DELIMITER $$ 
CREATE TRIGGER on_delete_log_creation_trigger
AFTER DELETE ON users 
FOR EACH ROW
BEGIN
	INSERT INTO user_log(user_id, event_action) 
    VALUES (OLD.user_id, 'Deletion');
END $$
DELIMITER ;

-- Define a trigger to log updates
DELIMITER $$
CREATE TRIGGER on_update_log_creation_trigger
AFTER UPDATE ON users
FOR EACH ROW
BEGIN
	INSERT INTO user_log( user_id, event_action)
    VALUES (OLD.user_id, 'Updated');
END $$
DELIMITER ;

-- Insert records into the table
INSERT INTO users(user_name,user_age) VALUES('Ashish',34);
INSERT INTO users(user_name,user_age) VALUES('Ansh',78);
INSERT INTO users(user_name,user_age) VALUES('Abhishek',35);

-- Check the user logs
SELECT * FROM user_log;

-- Try inserting an invalid under age record
INSERT INTO users(user_name,user_age) VALUES('Amish',11);

-- Update the record with id=2
SET SQL_SAFE_UPDATES=0;
UPDATE users SET user_age=user_age+1 WHERE user_id=2;
UPDATE users SET user_age=user_age+1 WHERE user_id=3;

-- Delete the record with id=1
DELETE FROM users WHERE user_id=1;

-- Check the user logs
SELECT * FROM user_log;


