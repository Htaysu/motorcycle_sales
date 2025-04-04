# Motorcycle Parts Sales Analysis – Wholesale Revenue Insights

## Project Overview

This project showcases my data analysis skills using SQL for data preparation and Power BI for visualization. It examines motorcycle parts sales from June to August 2021, providing insights into wholesale revenue trends across product lines, months, and warehouses.



![Example output](img/scr_1.png)

### Dataset Overview
The dataset consists of sales data with the following attributes:

 - `order_number` : Unique order number.
 - `date` : The Date of the order, ranging from June to August 2021.
 - `arehouse`: The Warehouse location where the order was placed (North, Central, or West).
 - `client_type` : Specifies whether the order was Retail or Wholesale.
 - `roduct_line` : Type of product ordered.
 - `quantity` : Number of products ordered.
 - `unit_price` : Price per product in dollars.
 - `total` : Total order price in dollars.
 - `payment` : Payment method used (Credit Card, Transfer, or Cash).
 - `payment_fee` : Percentage of the total order charged as a payment fee.

### Project Steps

1. Data Preparation
   - SQL Server Table Creation: Create a warehouse_sales table in SQL Server to   store the dataset.
   - Data Insertion: Insert the provided data into the retail_sales table.

2. Data Analysis & Exploration
   - Perform data cleaning and validation.
   - Analyze sales distribution across different dimensions (e.g., product line, warehouse, month).
    
2. Data Visualization with Power BI
   - Create interactive dashboards for sales trends, revenue insights, and warehouse performance.
    
3. Key Insights
   - Frame and body parts generate the highest net revenue.
   - Central and North warehouses are the top two revenue contributors.
   - August is the most profitable month for net revenue.

## Conclusion
This analysis provides crucial insights into wholesale revenue trends, helping the company optimize inventory, improve sales strategies, and enhance decision-making processes. By leveraging Power BI visualizations, the board of directors can make data-driven decisions to maximize profitability.
