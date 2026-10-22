CREATE TABLE superstore_sales (
    row_id INTEGER,
    order_id VARCHAR(30),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(30),
    customer_id VARCHAR(30),
    customer_name VARCHAR(100),
    segment VARCHAR(30),
    country VARCHAR(50),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code VARCHAR(20),
    region VARCHAR(30),
    product_id VARCHAR(30),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(255),
    sales NUMERIC(12,2),
    quantity INTEGER,
    discount NUMERIC(5,2),
    profit NUMERIC(12,2)
);

SET datestyle = 'MDY';
select * 
from superstore_sales;

ALTER DATABASE retail_revenue_leak
SET datestyle TO 'ISO, MDY';

SELECT COUNT(*)
FROM superstore_sales;

SELECT SUM(sales) as total_sales, SUM(profit) as total_profit
FROM superstore_sales;

SELECT sub_category,SUM(profit) AS total_profit
FROM superstore_sales
GROUP BY sub_category
ORDER BY total_profit ASC;

SELECT COUNT(*)
FROM superstore_sales
WHERE profit < 0;

SELECT discount,AVG(profit) AS avg_profit
FROM superstore_sales
GROUP BY discount
ORDER BY discount DESC;

SELECT region,SUM(sales) AS total_sales,SUM(profit) AS total_profit
FROM superstore_sales
GROUP BY region
ORDER BY total_profit DESC;


SELECT product_name,SUM(sales) AS total_sales,SUM(profit) AS total_profit
FROM superstore_sales
GROUP BY product_name
ORDER BY total_profit ASC
LIMIT 5;


SELECT COUNT(*) AS total_records
FROM superstore_sales;