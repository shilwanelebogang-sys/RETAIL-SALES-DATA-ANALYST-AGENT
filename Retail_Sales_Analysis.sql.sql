-- Databricks notebook source
/*
===========================================================
EXPLORATORY DATA ANALYSIS (EDA) ON RETAIL SALES DATASET
===========================================================
Objective:
Understand the structure, quality, patterns, and trends within the retail sales dataset.
==========================================================================================
*/


/* =======================================================
1. VIEW COMPLETE DATASET
Purpose:
Display all records and columns to understand the dataset.
======================================================= */

SELECT *
FROM retail.sales.dataset;

/* =======================================================
2. CHECK TOTAL NUMBER OF RECORDS
Purpose:
Determine the size of the dataset.
The Total_rows is 1000
======================================================= */

SELECT COUNT(*) AS total_rows
FROM retail.sales.dataset;

/* =======================================================
3. VIEW UNIQUE PRODUCT CATEGORIES
Purpose:
Identify all product categories available in the dataset.
The Product categories is Beauty, Clothing & Electronics
============================================================================================================== */

SELECT DISTINCT `Product Category`
FROM retail.sales.dataset;


/* =======================================================
4. CHECK DATE RANGE
Purpose:
Find the earliest and latest transaction dates. 
The earliest and latest transaction dates is 2023-01-01 & 2024-01-01 
======================================================= */

SELECT  MIN(date) AS start_date,
        MAX(date) AS end_date
FROM retail.sales.dataset;

/* =======================================================
5. CHECK FOR MISSING VALUES
Purpose:
Identify NULL values across all columns.
There is no NULL values across all columns
======================================================= */

SELECT  COUNT(*) AS total_rows,
        SUM(CASE WHEN `Transaction ID` IS NULL THEN 1 ELSE 0 END) AS missing_transaction_id,
        SUM(CASE WHEN date IS NULL THEN 1 ELSE 0 END) AS missing_date,
        SUM(CASE WHEN `Customer ID` IS NULL THEN 1 ELSE 0 END) AS missing_customer_id,
        SUM(CASE WHEN Gender IS NULL THEN 1 ELSE 0 END) AS missing_gender,
        SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END) AS missing_age,
        SUM(CASE WHEN `Product Category` IS NULL THEN 1 ELSE 0 END) AS missing_product_category,
        SUM(CASE WHEN Quantity IS NULL THEN 1 ELSE 0 END) AS missing_quantity,
        SUM(CASE WHEN `Price Per Unit`  IS NULL THEN 1 ELSE 0 END) AS missing_price_per_unit,
        SUM(CASE WHEN `Total Amount` IS NULL THEN 1 ELSE 0 END) AS missing_total_amount
FROM retail.sales.dataset;

/* =======================================================
6. CHECK FOR DUPLICATE TRANSACTIONS
Purpose:
Detect duplicate transaction IDs in the dataset.
There is no duplicates
======================================================= */

SELECT  `Transaction ID`,
         COUNT(*) AS duplicate_count
FROM retail.sales.dataset
GROUP BY `Transaction ID`
HAVING COUNT(*) > 1;

/* =======================================================
7. DESCRIPTIVE STATISTICS FOR SALES
Purpose:
Analyze revenue-related statistics.
======================================================= */

SELECT  AVG(`Total Amount`) AS average_sales,
        MIN(`Total Amount`) AS minimum_sales,
        MAX(`Total Amount`) AS maximum_sales,
        SUM(`Total Amount`) AS total_revenue
FROM retail.sales.dataset;

/* =======================================================
8. DESCRIPTIVE STATISTICS FOR QUANTITY
Purpose:
Understand quantity purchasing patterns.
======================================================= */

SELECT  AVG(Quantity) AS average_quantity,
        MIN(Quantity) AS minimum_quantity,
        MAX(Quantity) AS maximum_quantity
FROM retail.sales.dataset;

/* =======================================================
9. CUSTOMER AGE ANALYSIS
Purpose:
Understand customer age distribution.
======================================================= */

SELECT  ROUND(AVG(Age), 0) AS average_age,
        MIN(Age) AS youngest_customer,
        MAX(Age) AS oldest_customer
FROM retail.sales.dataset;

/* =======================================================
10. TOTAL SALES BY PRODUCT CATEGORY
Purpose:
Identify highest revenue-generating categories.
======================================================= */

SELECT  `Product Category`,
        SUM(`Total Amount`) AS total_sales
FROM retail.sales.dataset
GROUP BY  `Product Category`
ORDER BY total_sales DESC;

/* =======================================================
11. SALES ANALYSIS BY GENDER
Purpose:
Compare spending behavior across genders.
======================================================= */

SELECT  Gender,
        SUM(`Total Amount`) AS total_sales,
        COUNT(DISTINCT `Customer ID`) AS total_customers
FROM retail.sales.dataset
GROUP BY gender;

/* =======================================================
12. TOP 10 CUSTOMERS BY SPENDING
Purpose:
Identify highest-value customers.
======================================================= */

SELECT  `Customer ID`,
        SUM(`Total Amount`) AS total_spent
FROM retail.sales.dataset
GROUP BY `Customer ID`
ORDER BY total_spent DESC
LIMIT 10;

/* =======================================================
13. DAILY SALES TREND
Purpose:
Track sales performance on a daily basis.
======================================================= */

SELECT  Date,
        SUM(`Total Amount`) AS daily_sales
FROM retail.sales.dataset
GROUP BY Date
ORDER BY Date;

/* =======================================================
14. MONTHLY SALES TREND
Purpose:
Analyze monthly sales growth and seasonality.
======================================================= */

SELECT  YEAR(Date) AS sales_year,
        MONTH(Date) AS sales_month,
        SUM(`Total Amount`) AS monthly_sales
FROM retail.sales.dataset
GROUP BY sales_year, sales_month
ORDER BY sales_year, sales_month;


/* =======================================================
15. CUSTOMER SPENDING BY AGE GROUP
Purpose:
Segment customers into age groups and analyze spending.
======================================================= */

SELECT CASE WHEN Age < 20 THEN 'Teen'
            WHEN Age BETWEEN 20 AND 29 THEN '20s'
            WHEN Age BETWEEN 30 AND 39 THEN '30s'
            WHEN Age BETWEEN 40 AND 49 THEN '40s'
            ELSE '50+'
        END AS age_group,
        ROUND(AVG(`Total Amount`), 2) AS average_spending
FROM retail.sales.dataset
GROUP BY age_group
ORDER BY average_spending DESC;

/* =======================================================
16. MOST POPULAR PRODUCT CATEGORIES
Purpose:
Find categories with the highest quantity sold.
======================================================= */

SELECT  `Product Category`,
        SUM(Quantity) AS total_units_sold
FROM retail.sales.dataset
GROUP BY `Product Category`
ORDER BY total_units_sold DESC;

/* =======================================================
17. AVERAGE PRICE PER UNIT BY CATEGORY
Purpose:
Understand pricing trends across categories.
======================================================= */

SELECT  `Product Category`,
        ROUND(AVG(`Price Per Unit`), 2) AS avg_price_per_unit
FROM retail.sales.dataset
GROUP BY `Product Category`
ORDER BY avg_price_per_unit DESC;

/* =======================================================
18. Validate the Answers
======================================================= */

-- 2. Group data by product category
-- Calculate total revenue for each category
-- Sort results from highest to lowest revenue

SELECT  `Product Category`,
        SUM(`Total Amount`) AS total_revenue
FROM retail.sales.dataset
GROUP BY `Product Category`
ORDER BY total_revenue DESC;

-- I grouped data by product category and calculated total revenue. Electronics appears as the top category with approximately $156,905, confirming the agent’s answer is correct.


-- 5. Filter customers younger than 30
-- Group by product category
-- Identify which category generates the most revenue

SELECT  `Product Category`,
        SUM(`Total Amount`) AS total_revenue
FROM retail.sales.dataset
WHERE Age < 30
GROUP BY `Product Category`
ORDER BY total_revenue DESC;

-- I filtered customers under 30 and grouped by category. Clothing has the highest revenue, confirming the agent’s answer is correct.


-- 9. Compare total revenue and total quantity sold per category

SELECT  `Product Category`,
        SUM(`Total Amount`) AS total_revenue,
        SUM(Quantity) AS total_quantity
FROM retail.sales.dataset
GROUP BY `Product Category`;

-- The SQL results confirm that Electronics generates the highest revenue but does not have the highest quantity sold. Therefore, the agent’s answer is correct.

