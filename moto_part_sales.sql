-- Select all records from the motorcycle parts sales table
SELECT * FROM projects.motorcycle_part_sales;

-- Use the projects database
USE projects;

-- Check the first 10 rows
SELECT * 
FROM motorcycle_part_sales
LIMIT 10;

-- Summary statistics
SELECT 
    COUNT(*) AS total_rows,
    ROUND(AVG(quantity), 2) AS avg_quantity, 
    ROUND(AVG(unit_price), 2) AS avg_price_per_unit, 
    ROUND(AVG(total), 2) AS avg_total_amount
FROM motorcycle_part_sales;


-- Top-Selling Product Lines
SELECT
    product_line,
    ROUND(SUM(quantity),2) AS total_quantity,
    ROUND(SUM(total),2) AS total_sales
FROM motorcycle_part_sales
GROUP BY product_line
ORDER BY total_sales DESC;

-- Sales by Warehouse
SELECT
    warehouse,
    ROUND(SUM(total),2) AS total_sales
FROM motorcycle_part_sales
GROUP BY warehouse
ORDER BY total_sales DESC;

-- Sales by Payment Method
SELECT
    payment,
    ROUND(SUM(total),2) AS total_sales
FROM motorcycle_part_sales
GROUP BY payment
ORDER BY total_sales DESC;

-- Calculate Total Orders Per Client Type
WITH ClientOrderCount AS (
    SELECT
        client_type,
        COUNT(order_number) AS total_orders
    FROM motorcycle_part_sales
    GROUP BY client_type
)
SELECT
    client_type,
    ROUND(AVG(total_orders),2) AS avg_orders_per_client_type
FROM ClientOrderCount
GROUP BY client_type;

## Note: even though there are more orders made by retail client, we are more interested in the net revenue. 

-- Calculate Net Revenue Per Client Type
WITH ClientNetRevenue AS (
SELECT
client_type,
ROUND(SUM(total) - SUM(payment_fee), 2) AS net_revenue
FROM motorcycle_part_sales
GROUP BY client_type
)
SELECT
client_type,
ROUND(AVG(net_revenue), 2) AS avg_net_revenue_per_client_type
FROM ClientNetRevenue
GROUP BY client_type
order by  avg_net_revenue_per_client_type desc;

## Note: On average, we saw that Wholesale client type is making more revenue than retialsales

## Here, I will calcualte net revenue to better understand wholesale revenue by product line and how this varies month-to-month and across warehouses.

-- Calculate Net Revenue by Product Line, Warehouse, and Month (Wholesale Orders Only)
SELECT
    product_line, 
    warehouse,
    CASE 
        WHEN EXTRACT(MONTH FROM date) = 6 THEN 'June'
        WHEN EXTRACT(MONTH FROM date) = 7 THEN 'July'
        WHEN EXTRACT(MONTH FROM date) = 8 THEN 'August'
    END AS month,
ROUND(SUM(total) - SUM(payment_fee), 2) AS net_revenue
FROM motorcycle_part_sales
WHERE client_type = 'Wholesale'
GROUP BY product_line, warehouse, month
ORDER BY net_revenue DESC;

