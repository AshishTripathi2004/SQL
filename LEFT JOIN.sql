-- LEFT OUTER JOIN
-- Create and set up database
CREATE DATABASE left_join;
USE left_join;

-- Create customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    city VARCHAR(50)
);

-- Create orders table with foreign key
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Insert sample customer data
INSERT INTO customers (customer_id, customer_name, email, city)
VALUES 
    (1, 'John Smith', 'john@example.com', 'New York'),
    (2, 'Jane Doe', 'jane@example.com', 'Los Angeles'),
    (3, 'Robert Johnson', 'robert@example.com', 'Chicago'),
    (4, 'Emily Davis', 'emily@example.com', 'Houston'),
    (5, 'Michael Brown', 'michael@example.com', 'Phoenix');

-- Insert sample order data
INSERT INTO orders (order_id, customer_id, order_date, total_amount)
VALUES 
    (101, 1, '2023-01-15', 150.75),
    (102, 3, '2023-01-16', 89.50),
    (103, 1, '2023-01-20', 45.25),
    (104, 2, '2023-01-25', 210.30),
    (105, 3, '2023-02-01', 75.00);
    
-- display the data from the relations
SELECT * FROM customers;
SELECT * FROM orders;

-- Get all customers and the orders placed by them (if any)
SELECT c.customer_id,
	   c.customer_name, 
       GROUP_CONCAT(o.order_id SEPARATOR ' | ') AS order_ids
FROM customers c LEFT JOIN orders o 
ON c.customer_id=o.customer_id
GROUP BY customer_id;

-- Find the customers who have placed no orders
SELECT c.customer_id,
	   c.customer_name 
FROM customers c LEFT JOIN orders o 
ON c.customer_id=o.order_id 
WHERE o.order_id IS NULL;

-- Get Customers Order Count and Total Spendings
SELECT c.customer_id,
	   c.customer_name, 
       COUNT(o.order_id) AS total_orders, 
       IFNULL(SUM(o.total_amount),0) AS total_spendings 
FROM customers AS c LEFT JOIN orders AS o 
ON c.customer_id=o.customer_id 
GROUP BY c.customer_id; 

-- Create shipping table for multiple joins example
CREATE TABLE shipping (
    shipping_id INT PRIMARY KEY,
    order_id INT,
    shipping_date DATE,
    carrier VARCHAR(50),
    tracking_number VARCHAR(50),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- Insert sample shipping data
INSERT INTO shipping (shipping_id, order_id, shipping_date, carrier, tracking_number)
VALUES 
    (1001, 101, '2023-01-16', 'FedEx', 'FDX123456789'),
    (1002, 104, '2023-01-26', 'UPS', 'UPS987654321'),
    (1003, 105, '2023-02-02', 'USPS', 'USPS456789123');

-- Get the customer details, order details and shipping details together
SELECT c.customer_id, c.customer_name, o.order_id, s.shipping_id, s.carrier 
FROM customers c LEFT JOIN orders o 
ON c.customer_id=o.customer_id
LEFT JOIN shipping s 
ON o.order_id=s.order_id;

-- Find customers who have not ordered anything in the past 3 Years
SELECT c.customer_name, c.customer_id 
FROM customers c LEFT JOIN orders o 
ON c.customer_id=o.customer_id 
GROUP BY customer_id
HAVING MAX(o.order_date) IS NULL OR MAX(o.order_date)<DATE_SUB(CURRENT_DATE(), INTERVAL 3 YEAR);


