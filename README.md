# sales-analytics-sql-project
A sales analytics project that simulates a structured dataset and uses SQL to analyze transactions, customer behavior, and product performance.

##  Project Overview
This project demonstrates a SQL-based sales analytics workflow using a structured relational database.
The goal of the project is to analyze customer behavior, sales performance, and revenue trends by writing SQL queries across multiple related tables including customers, orders, products, and order_items.

The project covers:
- Data modeling
- Data insertion
- Table relationships using foreign keys
- Data analysis using SQL queries
- Business insights generation

## Database Structure
The database consists of the following tables:
- customers
- orders
- products
- order_items

Relationships:
- Each order is linked to a customer
- Each order contains multiple products via the order_items table
- Foreign keys are used to maintain referential integrity

## Tools & Technologies
- SQL (MySQL / PostgreSQL)
- Database design concepts
- GitHub for version control

## Business Questions
The following analytical questions were addressed:
- Who are the top customers by revenue?
- What is the monthly revenue trend?
- Which regions generate the most revenue?
- Who are the most frequent customers?
- How do customers rank based on total spending?

  ## SQL Techniques Used
- JOINs (INNER JOIN)
- Aggregations (SUM, COUNT)
- GROUP BY
- ORDER BY
- Window functions (RANK)
- Foreign key relationships

  ## Key Insights
- Ada is the highest revenue-generating customer
- Lagos is the top-performing region in terms of revenue
- Monthly revenue shows variation across time periods
- Customer purchasing frequency varies, with some customers showing higher engagement than others

  ## Project Files
- sales_analytics.sql → Contains all table creation, inserts, and queries
- screenshots/ → Contains query result screenshots
