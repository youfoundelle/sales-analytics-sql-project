CREATE DATABASE sales_analytics;
USE sales_analytics;
SELECT DATABASE();
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    region VARCHAR(50)
);
SHOW TABLES;
INSERT INTO customers VALUES
(1, 'Ada', 'Lagos'),
(2, 'John', 'Abuja'),
(3, 'Fatima', 'Kano'),
(4, 'Emeka', 'Enugu');
SELECT * FROM customers;
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
SHOW TABLES;
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);
SHOW TABLES;
INSERT INTO products VALUES
(1, 'Laptop', 'Electronics', 500000),
(2, 'Phone', 'Electronics', 200000),
(3, 'Shoes', 'Fashion', 50000),
(4, 'Watch', 'Accessories', 30000);
SELECT * FROM products;
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
INSERT INTO order_items VALUES
(1, 1, 1, 1),
(2, 1, 2, 1),
(3, 2, 2, 1),
(4, 3, 1, 1),
(5, 4, 3, 1);
SELECT * FROM order_items;
SELECT * FROM orders;
SELECT * FROM products;
INSERT INTO orders VALUES
(1, 1, '2025-01-10', 700000),
(2, 2, '2025-01-15', 200000),
(3, 1, '2025-02-05', 300000),
(4, 3, '2025-02-10', 50000);
SELECT * FROM orders;
INSERT INTO order_items VALUES
(1, 1, 1, 1),
(2, 1, 2, 1),
(3, 2, 2, 1),
(4, 3, 1, 1),
(5, 4, 3, 1);
SELECT * FROM order_items;
SELECT 
    c.customer_name,
    SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o 
    ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_spent DESC;
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(total_amount) AS revenue
FROM orders
GROUP BY month
ORDER BY month;
SELECT 
    c.region,
    SUM(o.total_amount) AS revenue
FROM customers c
JOIN orders o 
    ON c.customer_id = o.customer_id
GROUP BY c.region
ORDER BY revenue DESC;
SELECT 
    c.customer_name,
    COUNT(o.order_id) AS number_of_orders
FROM customers c
JOIN orders o 
    ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY number_of_orders DESC;
SELECT 
    c.customer_name,
    SUM(o.total_amount) AS total_spent,
    RANK() OVER (ORDER BY SUM(o.total_amount) DESC) AS rank_position
FROM customers c
JOIN orders o 
    ON c.customer_id = o.customer_id
GROUP BY c.customer_name;