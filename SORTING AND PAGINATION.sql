-- ORDER BY, LIMIT AND OFFSET

-- Create and Use a database
CREATE DATABASE ordering;
USE ordering;

-- Create a products table and insert values 
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock INT
);

INSERT INTO products (product_name, category, price, stock) VALUES
('Laptop', 'Electronics', 75000.00, 12),
('Smartphone', 'Electronics', 55000.00, 25),
('Headphones', 'Electronics', 3500.00, 50),
('Refrigerator', 'Appliances', 42000.00, 8),
('Microwave', 'Appliances', 12000.00, 15),
('Sofa', 'Furniture', 30000.00, 5),
('Dining Table', 'Furniture', 18000.00, 7),
('Bed', 'Furniture', 25000.00, 6),
('Novel', 'Books', 500.00, 100),
('Notebook', 'Books', 50.00, 200),
('T-shirt', 'Clothing', 800.00, 80),
('Jeans', 'Clothing', 2000.00, 40),
('Jacket', 'Clothing', 4500.00, 20);

-- View the product details
SELECT * FROM products;

-- List all products sorted by price (low → high)
SELECT * FROM products ORDER BY price;

-- Show the top 5 most expensive products
SELECT * FROM products ORDER BY price DESC LIMIT 5;

-- Show the 3 cheapest products in the Furniture category
SELECT * FROM products WHERE category='Furniture' ORDER BY price LIMIT 3;

-- Show the product with the highest stock
SELECT * FROM products ORDER BY stock DESC LIMIT 1;

-- Show products ranked 4th to 6th by price (middle range)
SELECT * FROM products ORDER BY price LIMIT 3 OFFSET 3;

-- Show products in Clothing, sorted by name alphabetically, only the first 2
SELECT * FROM products WHERE category='Clothing' ORDER BY product_name LIMIT 2;

-- Show products in Electronics, sorted by stock (descending), skip the first result, then show the next 2
SELECT * FROM products WHERE category='Electronics' ORDER BY stock LIMIT 2 OFFSET 1;

-- Show the 5 most recently added products (highest product_id)
SELECT * FROM products ORDER BY product_id DESC LIMIT 5;

-- Show all products in Appliances, but paginate them: page 1 = 2 results
SELECT * FROM products WHERE category='ApplianceS' LIMIT 2 OFFSET 0;

-- Show next page
SELECT * FROM products WHERE category='ApplianceS' LIMIT 2 OFFSET 2;
