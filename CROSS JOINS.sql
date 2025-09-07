-- CROSS JOIN/CARTESIAN PRODUCT

-- Create a database
CREATE DATABASE cartesian;
USE cartesian;

-- Create a colors table
CREATE TABLE colors 
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    color VARCHAR(50) NOT NULL UNIQUE
);

-- Create a garments table
CREATE TABLE garments 
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    garment VARCHAR(150) NOT NULL UNIQUE
);

-- Insert records in the colors table
INSERT INTO colors(color) VALUES ('Red'), 
								 ('Blue'), 
                                 ('Green'), 
                                 ('Black'), 
                                 ('Purple'), 
                                 ('Yellow');

-- Insert records in the garments table
INSERT INTO garments(garment) VALUES ('Jacket'),
									 ('Jeans'), 
                                     ('Gloves'), 
                                     ('Muffler'), 
                                     ('Sweater'), 
                                     ('T-Shirt'), 
                                     ('Shirt');
                                     
-- Display the table contents
SELECT * FROM colors ORDER BY id;
SELECT * FROM garments ORDER BY id;

-- Create all possible garment and color combinations
SELECT c.color, 
       g.garment
FROM colors c CROSS JOIN garments g;

-- Create a sizes table
CREATE TABLE sizes
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    size VARCHAR(5) NOT NULL UNIQUE
);

INSERT INTO sizes(size) VALUES ('XS'),('S'),('M'),('L'),('XL'),('XXL');

-- Generate all sizes as well
-- Total number of records = 6*6*7 = 252 records
SELECT s.size, c.color, g.garment FROM sizes s CROSS JOIN colors c CROSS JOIN garments g;
SELECT COUNT(*) AS total_possible_combinations FROM sizes s CROSS JOIN colors c CROSS JOIN garments g;


-- query optimiser
EXPLAIN SELECT s.size, c.color, g.garment FROM sizes s CROSS JOIN colors c CROSS JOIN garments g WHERE g.garment='T-Shirt';
