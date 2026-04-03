-- Create the database
CREATE DATABASE sales_analytics;
-- Select the database for use
USE sales_analytics;
-- Verify the active database
SELECT DATABASE();
-- Create TABLE: customer
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    region VARCHAR(50)
);
-- View all tables in the database
SHOW TABLES;
-- Insert sample customer data
INSERT INTO customers VALUES
(1, 'Ada', 'Lagos'),
(2, 'John', 'Abuja'),
(3, 'Fatima', 'Kano'),
(4, 'Emeka', 'Enugu');
-- Preview customers table
SELECT * FROM customers;
-- Create Table: orders
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
-- View all tables in the database
SHOW TABLES;
-- Create TABLE; products
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);
-- View all tables in the database
SHOW TABLES;
-- Insert sample product data
INSERT INTO products VALUES
(1, 'Laptop', 'Electronics', 500000),
(2, 'Phone', 'Electronics', 200000),
(3, 'Shoes', 'Fashion', 50000),
(4, 'Watch', 'Accessories', 30000);
-- Preview products table
SELECT * FROM products;
-- Create TABLE: order_items
-- Link orders to products (many-to-many relationship)
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
-- Insert sample order_items data
INSERT INTO order_items VALUES
(1, 1, 1, 1),
(2, 1, 2, 1),
(3, 2, 2, 1),
(4, 3, 1, 1),
(5, 4, 3, 1);
-- Preview order_items table
SELECT * FROM order_items;
-- Preview orders table
SELECT * FROM orders;
-- Preview products table
SELECT * FROM products;
-- Insert sample orders data
INSERT INTO orders VALUES
(1, 1, '2025-01-10', 700000),
(2, 2, '2025-01-15', 200000),
(3, 1, '2025-02-05', 300000),
(4, 3, '2025-02-10', 50000);
-- Preview orders table
SELECT * FROM orders;
-- I re-inserted the sample order_items data to nsure the records were properly added as the first insertion did not execute successfully
INSERT INTO order_items VALUES
(1, 1, 1, 1),
(2, 1, 2, 1),
(3, 2, 2, 1),
(4, 3, 1, 1),
(5, 4, 3, 1);
-- Preview order_items table
SELECT * FROM order_items;
-- Total spending per customer
SELECT 
    c.customer_name,
    SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o 
    ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_spent DESC;
-- Monthly revenue trend
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(total_amount) AS revenue
FROM orders
GROUP BY month
ORDER BY month;
-- Revenue by region
SELECT 
    c.region,
    SUM(o.total_amount) AS revenue
FROM customers c
JOIN orders o 
    ON c.customer_id = o.customer_id
GROUP BY c.region
ORDER BY revenue DESC;
-- Numbers of orders per customer
SELECT 
    c.customer_name,
    COUNT(o.order_id) AS number_of_orders
FROM customers c
JOIN orders o 
    ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY number_of_orders DESC;
-- Customer ranking based on total spending
SELECT 
    c.customer_name,
    SUM(o.total_amount) AS total_spent,
    RANK() OVER (ORDER BY SUM(o.total_amount) DESC) AS rank_position
FROM customers c
JOIN orders o 
    ON c.customer_id = o.customer_id
GROUP BY c.customer_name;