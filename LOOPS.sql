-- LOOPS IN SQL 

-- Create a database
CREATE DATABASE loops;
USE loops;


-- Describe a counter using a simple do-while loop
DELIMITER //
CREATE PROCEDURE counter(IN endValue INT)
BEGIN
	DECLARE i INT DEFAULT 1;
    
    WHILE i<=endValue DO
       SELECT CONCAT('Value : ',i);
       SET i=i+1;
	END WHILE;
END //
DELIMITER ;

CALL counter(15);

-- Create a factorial calculator using loop
DELIMITER //
CREATE PROCEDURE factorial(IN val INT, OUT param INT)
BEGIN
	DECLARE i INT DEFAULT 1;
    
    IF val = 0 THEN
		SET param = 0;
	ELSE 
        SET param = 1;
	END IF;
    
    my_loop : LOOP
    IF i>val THEN
        LEAVE my_loop;
	END IF;
    SET param=param*i;
    SET i=i+1;
    END LOOP my_loop;
END//
DELIMITER ;

CALL factorial(6,@param);
SELECT @param;

-- Create a sum calculator using Repeat
DELIMITER //
CREATE PROCEDURE sumCalculator(IN n INT, OUT total_sum INT)
BEGIN
	DECLARE i INT DEFAULT 1;
	SET total_sum=0;
    
    REPEAT 
		SET total_sum=total_sum+i;
        SET i=i+1;
	UNTIL i > n 
    END REPEAT;
END //
DELIMITER ;

CALL sumCalculator(4,@param);
SELECT @param;




