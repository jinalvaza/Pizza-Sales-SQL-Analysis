# 🍕 Pizza Sales SQL Analysis

## 📖 Project Overview

This project analyzes a pizza sales dataset using **PostgreSQL** to solve real-world business problems through SQL.

The analysis focuses on revenue, sales trends, customer ordering behavior, and pizza performance by applying SQL queries ranging from basic data retrieval to advanced analytical techniques such as window functions.

## 🎯 Project Objectives

- Analyze pizza sales data using SQL.
- Practice writing efficient SQL queries.
- Solve real-world business questions.
- Improve SQL skills for Data Analyst roles.
- Demonstrate proficiency in PostgreSQL and relational databases.

## 🛠️ Technologies Used

- PostgreSQL
- DBeaver
- SQL

## 📂 Database Tables

| Table | Description |
|--------|-------------|
| orders | Stores order date and time |
| order_details | Stores pizzas ordered and quantities |
| pizza | Stores pizza sizes and prices |
| pizza_type | Stores pizza names and categories |

## 📚 SQL Concepts Covered

- SELECT
- INNER JOIN
- GROUP BY
- ORDER BY
- Aggregate Functions (COUNT, SUM, AVG, MAX)
- Subqueries
- Window Functions (RANK)
- Revenue Analysis
- Percentage Calculations
- Cumulative Revenue Analysis

## 📊 Business Questions Solved

### Basic
- Total number of orders
- Total revenue
- Highest-priced pizza
- Most common pizza size
- Top 5 ordered pizza types

### Intermediate
- Quantity by pizza category
- Orders by hour
- Category-wise pizza distribution
- Average pizzas ordered per day
- Top 3 pizza types by revenue

### Advanced
- Percentage contribution by category
- Cumulative revenue over time
- Top 3 revenue-generating pizza types within each category using RANK()

## 🚀 How to Run

1. Create the tables using `create_tables.sql`.
2. Import the CSV files.
3. Run `pizza_sales_analysis.sql`.

## 👤 Author

**Jinal Vaza**

Aspiring Data Analyst passionate about SQL, Excel, Power BI, Python, and Data Analytics.
