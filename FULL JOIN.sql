CREATE DATABASE friends_db;
USE friends_db;

-- Create tables for our demonstration
CREATE TABLE characters (
    character_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    occupation VARCHAR(100)
);

CREATE TABLE apartments (
    apartment_id INT PRIMARY KEY,
    building_address VARCHAR(100) NOT NULL,
    apartment_number VARCHAR(10) NOT NULL,
    monthly_rent DECIMAL(8, 2),
    current_tenant_id INT
);

-- Sample Data
-- ====================================================================
-- Insert data into characters
INSERT INTO characters (character_id, first_name, last_name, occupation) VALUES
(1, 'Ross', 'Geller', 'Paleontologist'),
(2, 'Rachel', 'Green', 'Fashion Executive'),
(3, 'Chandler', 'Bing', 'IT Procurement Manager'),
(4, 'Monica', 'Geller', 'Chef'),
(5, 'Joey', 'Tribbiani', 'Actor'),
(6, 'Phoebe', 'Buffay', 'Massage Therapist'),
(7, 'Gunther', 'Smith', 'Coffee Shop Manager'),
(8, 'Janice', 'Hosenstein', 'Unknown');

-- Insert data into apartments
INSERT INTO apartments (apartment_id, building_address, apartment_number, monthly_rent, current_tenant_id) VALUES
(101, '90 Bedford Street', '20', 3500.00, 3),
(102, '90 Bedford Street', '19', 3500.00, 4),
(103, '5 Morton Street', '14', 2800.00, 6),
(104, '17 Grove Street', '3B', 2200.00, NULL),
(105, '15 Yemen Road', 'Yemen', 900.00, NULL),
(106, '495 Grove Street', '7', 2400.00, 1);

-- View the data from the tables
SELECT * FROM apartments;
SELECT * FROM characters;

-- Return apartments that have tenants and tenants that have apartments
-- use inner join
SELECT a.apartment_id, 
	   a.building_address, 
       CONCAT(c.first_name," ",c.last_name) AS full_name
FROM apartments a INNER JOIN characters c
ON a.current_tenant_id=c.character_id;

-- All characters with addresses, if any
SELECT CONCAT(c.first_name," ",c.last_name) AS full_name,
       a.apartment_id, 
	   a.building_address
FROM characters c LEFT JOIN apartments a
ON a.current_tenant_id=c.character_id;

-- All apartments with tenants, if any of those match
SELECT CONCAT(c.first_name," ",c.last_name) AS full_name,
       a.apartment_id, 
	   a.building_address
FROM characters c RIGHT JOIN apartments a
ON a.current_tenant_id=c.character_id;

-- All apartments with all tenants, if any of those match
SELECT CONCAT(c.first_name," ",c.last_name) AS full_name,
       a.apartment_id, 
	   a.building_address
FROM characters c RIGHT JOIN apartments a
ON a.current_tenant_id=c.character_id
UNION
SELECT CONCAT(c.first_name," ",c.last_name) AS full_name,
       a.apartment_id, 
	   a.building_address
FROM characters c LEFT JOIN apartments a
ON a.current_tenant_id=c.character_id;


-- Find characters without an apartment
SELECT CONCAT(c.first_name," ",c.last_name) AS full_name
FROM characters c LEFT JOIN apartments a
ON a.current_tenant_id=c.character_id
WHERE a.apartment_id IS NULL;