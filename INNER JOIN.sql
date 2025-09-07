-- Understanding Inner Join

-- Create a database
CREATE DATABASE db_inner_join;
USE db_inner_join;

-- Create authors table
CREATE TABLE authors (
    author_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    birth_year INT
);

-- Create books table
CREATE TABLE books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100),
    author_id INT,
    publication_year INT,
    price DECIMAL(6,2)
);

-- Insert data into authors table
INSERT INTO authors (author_id, first_name, last_name, birth_year)
VALUES 
    (1, 'Jane', 'Austen', 1775),
    (2, 'George', 'Orwell', 1903),
    (3, 'Ernest', 'Hemingway', 1899),
    (4, 'Agatha', 'Christie', 1890),
    (5, 'J.K.', 'Rowling', 1965);

-- Insert data into books table
INSERT INTO books (book_id, title, author_id, publication_year, price)
VALUES 
    (101, 'Pride and Prejudice', 1, 1813, 12.99),
    (102, '1984', 2, 1949, 14.50),
    (103, 'Animal Farm', 2, 1945, 11.75),
    (104, 'The Old Man and the Sea', 3, 1952, 10.99),
    (105, 'Murder on the Orient Express', 4, 1934, 13.25),
    (106, 'Death on the Nile', 4, 1937, 12.50),
    (107, 'Emma', 1, 1815, 11.99),
    (108, 'For Whom the Bell Tolls', 3, 1940, 15.75);
    
-- Display values from the tables
SELECT * FROM authors;
SELECT * FROM books;

-- Retrieve books with their author's information
SELECT b.title, a.first_name, a.last_name FROM authors as a INNER JOIN books as b ON a.author_id=b.author_id;

-- Count the books written by each author
SELECT a.author_id, 
	   a.first_name,
       a.last_name,
       COUNT(*) AS number_of_books_written 
FROM authors AS a INNER JOIN books AS b 
ON a.author_id=b.author_id 
GROUP BY a.author_id;

-- Display the book and author details in ascending order of their birth years for authors publications after 1940
SELECT a.author_id,
	   a.first_name,
       a.last_name,
       a.birth_year,
       b.title 
FROM authors AS a INNER JOIN books AS b 
ON a.author_id=b.author_id 
WHERE b.publication_year>1940 
ORDER BY a.birth_year ASC;

-- Categories of the books
CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);

INSERT INTO categories (category_id, category_name)
VALUES 
    (1, 'Fiction'),
    (2, 'Classic'),
    (3, 'Romance'),
    (4, 'Political'),
    (5, 'Mystery'),
    (6, 'Adventure');
    
-- Create junction table for book-category many-to-many relationship
CREATE TABLE book_categories (
    book_id INT,
    category_id INT,
    PRIMARY KEY (book_id, category_id)
);

INSERT INTO book_categories (book_id, category_id)
VALUES 
    (101, 1), (101, 2), (101, 3), -- Pride and Prejudice: Fiction, Classic, Romance
    (102, 1), (102, 2), (102, 4), -- 1984: Fiction, Classic, Political
    (103, 1), (103, 2), (103, 4), -- Animal Farm: Fiction, Classic, Political
    (104, 1), (104, 2), (104, 6), -- The Old Man and the Sea: Fiction, Classic, Adventure
    (105, 1), (105, 5), -- Murder on the Orient Express: Fiction, Mystery
    (106, 1), (106, 5), -- Death on the Nile: Fiction, Mystery
    (107, 1), (107, 2), (107, 3), -- Emma: Fiction, Classic, Romance
    (108, 1), (108, 2), (108, 6); -- For Whom the Bell Tolls: Fiction, Classic, Adventure
    
-- Retrieve the information books, authors and categories together
SELECT b.book_id,
       b.title,
       GROUP_CONCAT(c.category_name SEPARATOR' | ') AS categories,
       COUNT(*) AS category_count
FROM authors a JOIN books b
ON a.author_id=b.author_id
JOIN book_categories bc 
ON b.book_id=bc.book_id
JOIN categories c 
ON bc.category_id=c.category_id
GROUP BY book_id;

-- Return books published before 1950 by the authors born before 1900
SELECT b.book_id,
	   b.title, 
       b.publication_year, 
       a.birth_year
FROM authors AS a JOIN books AS b
ON a.author_id=b.author_id 
WHERE b.publication_year<1950 AND a.birth_year<1900;

-- Return book details for books published more than 70 years ago
SELECT b.title,
	   b.publication_year,
       a.first_name, 
       a.last_name 
FROM authors AS a JOIN books AS b 
ON a.author_id=b.author_id
WHERE YEAR(CURRENT_DATE())-b.publication_year>70; 