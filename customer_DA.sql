-- Checking Columns, Data Types and Null values 
describe customer;

-- Reviewing the data 
select * from customer;

-- Counting the rows present in the table
select Distinct count(invoice_no) from customer;

-- Checking if revenue exists
select * 
From customer
Limit 5;

-- Creating a revenue column 
ALTER TABLE customer
ADD COLUMN revenue DECIMAL(12,2);
-- Since there is DB login does NOT have permission to modify the table structure. We cannot alter the table.

-- Creating an expression for revenue and age_category
-- Expression 1: Revenue Calculation
-- (quantity * price)

-- Expression 2: Age Category CASE Logic
-- (CASE WHEN age BETWEEN 0 AND 17 THEN '0-17' WHEN age BETWEEN 18 AND 24 THEN '18-24' WHEN age BETWEEN 25 AND 34 THEN '25-34' WHEN age BETWEEN 35 AND 44 THEN '35-44' WHEN age BETWEEN 45 AND 54 THEN '45-54' WHEN age BETWEEN 55 AND 64 THEN '55-64' ELSE '65+' END)

-- Tasks(Business Problem)
-- 1. How is the shopping distribution according to gender? 
select gender, count(*) As total_transactions
From customer
group by gender;

-- 2. Which gender did we sell more products to? 
SELECT 
    gender,
    SUM(quantity) AS total_items_sold
FROM customer
GROUP BY gender
ORDER BY total_items_sold DESC;

-- 3. Which gender generated more revenue? 
Select gender, sum(quantity * price) as total_revenue 
from customer 
group by gender
order by total_revenue desc;

-- 4.Distribution of purchase categories relative to other columns? 
SELECT 
    category,
    COUNT(*) AS transactions,
    SUM(quantity) AS total_items,
    SUM(quantity * price) AS revenue
FROM customer
GROUP BY category
ORDER BY revenue DESC;

-- 5. How is the shopping distribution according to age? 
SELECT
    CASE
        WHEN age BETWEEN 0 AND 17 THEN '0-17'
        WHEN age BETWEEN 18 AND 24 THEN '18-24'
        WHEN age BETWEEN 25 AND 34 THEN '25-34'
        WHEN age BETWEEN 35 AND 44 THEN '35-44'
        WHEN age BETWEEN 45 AND 54 THEN '45-54'
        WHEN age BETWEEN 55 AND 64 THEN '55-64'
        ELSE '65+'
    END AS age_cat,
    COUNT(*) AS total_transactions
FROM customer
GROUP BY age_cat
ORDER BY total_transactions DESC;

-- 6. Which age cat did we sell more products to? 
SELECT
    CASE
        WHEN age BETWEEN 0 AND 17 THEN '0-17'
        WHEN age BETWEEN 18 AND 24 THEN '18-24'
        WHEN age BETWEEN 25 AND 34 THEN '25-34'
        WHEN age BETWEEN 35 AND 44 THEN '35-44'
        WHEN age BETWEEN 45 AND 54 THEN '45-54'
        WHEN age BETWEEN 55 AND 64 THEN '55-64'
        ELSE '65+'
    END AS age_cat,
    SUM(quantity) AS total_items
FROM customer
GROUP BY age_cat
ORDER BY total_items DESC;

-- 7. Which age cat generated more revenue? 
SELECT
    CASE
        WHEN age BETWEEN 0 AND 17 THEN '0-17'
        WHEN age BETWEEN 18 AND 24 THEN '18-24'
        WHEN age BETWEEN 25 AND 34 THEN '25-34'
        WHEN age BETWEEN 35 AND 44 THEN '35-44'
        WHEN age BETWEEN 45 AND 54 THEN '45-54'
        WHEN age BETWEEN 55 AND 64 THEN '55-64'
        ELSE '65+'
    END AS age_cat,
    SUM(quantity * price) AS total_revenue
FROM customer
GROUP BY age_cat
ORDER BY total_revenue DESC;

-- 8. Distribution of purchase categories relative to other columns? 
SELECT
    CASE
        WHEN age BETWEEN 0 AND 17 THEN '0-17'
        WHEN age BETWEEN 18 AND 24 THEN '18-24'
        WHEN age BETWEEN 25 AND 34 THEN '25-34'
        WHEN age BETWEEN 35 AND 44 THEN '35-44'
        WHEN age BETWEEN 45 AND 54 THEN '45-54'
        WHEN age BETWEEN 55 AND 64 THEN '55-64'
        ELSE '65+'
    END AS age_cat,
    category,
    COUNT(*) AS transactions,
    SUM(quantity) AS total_items,
    SUM(quantity * price) AS revenue
FROM customer
GROUP BY age_cat, category
ORDER BY age_cat, revenue DESC;
-- 9. Does the payment method have a relation with other columns? 
SELECT
    payment_method,
    gender,
    COUNT(*) AS transactions,
    SUM(quantity * price) AS revenue
FROM customer
GROUP BY payment_method, gender
ORDER BY payment_method, revenue DESC;

-- 10. How is the distribution of the payment method? 
SELECT
    payment_method,
    COUNT(*) AS transactions,
    SUM(quantity * price) AS revenue
FROM customer
GROUP BY payment_method
ORDER BY transactions DESC; 





