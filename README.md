# Customer Order Management System (PostgreSQL)

## 📌 Project Overview

This project is a **Customer & Order Management System** built using **PostgreSQL**.  
It focuses on real-world **data cleaning, SQL analytics, and business insights generation** using relational data.

The project simulates how companies manage customer and order data and extract meaningful insights using SQL.


# Database Tables

# 1. Customer Table (customerdata_raw)
Stores customer-related information such as:
- Customer details (name, email, phone)
- Location (city, state)
- Registration details
- Customer segment
- Account status

# 2. Order Table (orderdata_raw)
Stores order transaction data such as:
- Order details
- Product category
- Order amount
- Payment method
- Order status
- Delivery city

---

# Features Implemented

# Data Engineering
- Table creation using `CREATE TABLE`
- Schema modification using `ALTER TABLE`
- Bulk insert using `INSERT INTO`
- Transaction control using `BEGIN` and `COMMIT`

# Data Cleaning
- Handling NULL values using `COALESCE`
- Removing duplicate records check
- Removing extra spaces using `TRIM`
- Standardizing text using `INITCAP`
- Fixing inconsistent data formats

# Data Exploration
- Row count analysis
- Distinct customer identification
- Null value profiling


#SQL Analysis Performed

# Customer Analysis
- Active vs Inactive customers
- Customer distribution by state
- City-wise customer segmentation
- Latest and oldest registrations
- Duplicate customer detection

# Order Analysis
- Total revenue calculation
- Average order value
- Order status distribution
- Payment method analysis
- Top product categories


# SQL Concepts Used

- CREATE TABLE / DROP VIEW
- INSERT / UPDATE / TRUNCATE
- JOINs (INNER JOIN, LEFT JOIN, RIGHT JOIN)
- GROUP BY / ORDER BY / HAVING
- Aggregate functions (SUM, AVG, COUNT)
- Window Functions:
  - RANK()
  - ROW_NUMBER()
  - DENSE_RANK()
- Views (CREATE / REPLACE VIEW)
- UNION / UNION ALL
- Data Cleaning functions:
  - COALESCE()
  - TRIM()
  - INITCAP()


# Key Insights Generated

- Total revenue from orders
- Most used payment methods
- High performing product categories
- Customer distribution across states
- Active vs inactive customer ratio
- Top orders per product category

---

# Project Structure

```
Customer-Order-Management-PostgreSQL/
│
├── SQL_Scripts/
│   └── customer_order_project.sql
│
├── Dataset/
│
├── Documentation/
│
└── Screenshots/
```

---

## 🚀 How to  this project 


1. Install PostgreSQL
2. Create a new database
3. Run `01_create_tables.sql`
4. Insert data using `02_insert_data.sql`
5. Perform cleaning using `03_data_cleaning.sql`
6. Run analysis queries from `04_analysis_queries.sql`



# Learning Outcome

This project demonstrates:
- Real-world SQL problem solving
- Data cleaning techniques used in industry
- Business analytics using SQL
- Strong understanding of relational databases
- Writing optimized queries for business insights


---

# Author

**Sagar Shrivas**
