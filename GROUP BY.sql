-- GROUP BY AND HAVING

-- Create and Use a database
CREATE DATABASE groupings;
USE groupings;

-- Create and populate an orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(50),
    product_name VARCHAR(50),
    category VARCHAR(50),
    quantity INT,
    price DECIMAL(10,2),
    order_date DATE
);

INSERT INTO orders (customer_name, product_name, category, quantity, price, order_date) VALUES
('Alice', 'Laptop', 'Electronics', 1, 75000, '2025-09-01'),
('Bob', 'Smartphone', 'Electronics', 2, 55000, '2025-09-02'),
('Charlie', 'Headphones', 'Electronics', 3, 3500, '2025-09-03'),
('Alice', 'Refrigerator', 'Appliances', 1, 42000, '2025-09-05'),
('David', 'Microwave', 'Appliances', 2, 12000, '2025-09-06'),
('Eve', 'Sofa', 'Furniture', 1, 30000, '2025-09-07'),
('Frank', 'Dining Table', 'Furniture', 2, 18000, '2025-09-08'),
('Grace', 'Bed', 'Furniture', 1, 25000, '2025-09-09'),
('Charlie', 'Novel', 'Books', 5, 500, '2025-09-10'),
('Alice', 'Notebook', 'Books', 10, 50, '2025-09-11'),
('Bob', 'T-shirt', 'Clothing', 3, 800, '2025-09-12'),
('Eve', 'Jeans', 'Clothing', 2, 2000, '2025-09-13'),
('Frank', 'Jacket', 'Clothing', 1, 4500, '2025-09-14');

-- View the contents of a table
SELECT * FROM orders;

-- Find the total quantity ordered for each product
SELECT product_name, SUM(quantity) FROM orders GROUP BY product_name;

-- Find the total sales amount
SELECT product_name, SUM(quantity*price) AS total_price FROM orders GROUP BY product_name;

-- Find customers who have ordered more than 5 items in total
SELECT customer_name, SUM(quantity) FROM orders GROUP BY customer_name HAVING SUM(quantity)>5;

-- Find customers who have ordered more than 5 items in total
SELECT category, COUNT(order_id) FROM orders GROUP BY category HAVING COUNT(order_id)>2;

-- Find customers whose total purchase amount exceeds 50,000
SELECT customer_name, SUM(quantity*price) FROM orders GROUP BY customer_name HAVING SUM(quantity*price)>50000;

-- Find the maximum and minimum sales amount per category
SELECT category , MAX(quantity*price) AS max_sale, MIN(quantity*price) AS min_sale FROM orders GROUP BY category;

-- Find customers who have ordered more than one type of product
SELECT customer_name, COUNT(DISTINCT category) AS total_categories, GROUP_CONCAT(DISTINCT category SEPARATOR ' | ')
FROM orders GROUP BY customer_name HAVING COUNT(DISTINCT category)>1;

-- Top 2 customers by order value
SELECT customer_name , SUM(price*quantity) FROM orders GROUP BY customer_name ORDER BY SUM(price*quantity) DESC LIMIT 2;