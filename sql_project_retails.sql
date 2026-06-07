-- create database
CREATE DATABASE retails_project;

-- create table
CREATE TABLE retail_sales (
            transactions_id INT PRIMARY KEY,
            sale_date DATE,
            sale_time TIME,
            customer_id	INT,
            gender VARCHAR(19),
            age	INT,
            category VARCHAR(19),	
            quantiy	INT,
            price_per_unit INT,	
            cogs DECIMAL,
            total_sale INT
);

SELECT * FROM retail_sales;


SELECT COUNT(*) 
FROM 
    retail_sales;

-- data cleaning

SELECT * FROM retail_sales
WHERE 
    transactions_id IS NULL 
    OR 
    sale_date IS NULL
    OR
    sale_time IS NULL
    OR 
    customer_id IS NULL
    OR 
    gender IS NULL
    OR
    category IS NULL
    OR
    quantiy IS NULL
    OR
    price_per_unit IS NULL
    OR
    cogs IS NULL
    OR
    total_sale IS NULL ;


DELETE FROM retail_sales 
WHERE 
        transactions_id IS NULL 
    OR 
    sale_date IS NULL
    OR
    sale_time IS NULL
    OR 
    customer_id IS NULL
    OR 
    gender IS NULL
    OR
    category IS NULL
    OR
    quantiy IS NULL
    OR
    price_per_unit IS NULL
    OR
    cogs IS NULL
    OR
    total_sale IS NULL ;



SELECT * FROM retail_sales;


-- data exploration

-- how many sales we have?

SELECT COUNT(*) AS TOTAL_SALES FROM retail_sales;

-- how many unique customer we have?

SELECT COUNT(DISTINCT customer_id) AS customer FROM retail_sales;

SELECT DISTINCT category AS categroy FROM retail_sales;

SELECT COUNT(DISTINCT category) AS customer_count FROM retail_sales;

-- - My Analysis & Findings
-- - Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
-- - Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 inthe month of Nov2022
-- - Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
-- - Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
-- - Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
-- - Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
-- - Q.8 Write a SQL query to find the top 5 customers based on the highest total sales
-- - Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
-- - Q.10 Write a SQL query to create each shift and number of orders (Example Morning <= 12, Afternoon Between 12 & 17, Evening >17)

-- data analysis  and business key problems

-- - Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05

SELECT * FROM retail_sales
WHERE sale_date = '2022-11-05';


-- - Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov2022

SELECT *
FROM retail_sales
WHERE 
    category = 'Clothing'
    AND
    TO_CHAR(sale_date, 'YYYY-MM') = '2022-11'
    AND
    quantiy >= 4;


-- - Q.3 Write a SQL query to calculate the total sales (total_sale) for each category

SELECT 
    category,
    SUM(total_sale) AS net_sales,
    COUNT(*) AS total_orders
FROM retail_sales
GROUP BY 1;


-- - Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.


SELECT 
    category,
    ROUND(AVG(age),2) AS avg_age
FROM retail_sales
WHERE category = 'Beauty'
GROUP BY category;


-- - Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.

SELECT *
FROM retail_sales
WHERE 
    total_sale >= 1000
ORDER BY total_sale;


-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.


