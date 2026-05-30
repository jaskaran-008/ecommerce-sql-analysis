-- BQ 1 -> overall business health
-- Uses -> SELECT with aggregate functions
-- Query 
/*
SELECT SUM(quantity * unit_price) as total_revenue ,
       COUNT(DISTINCT order_id) AS number_of_orders,
       SUM(quantity * unit_price)/COUNT(DISTINCT order_id) AS average_order_value
FROM order_items
*/
-- Result -> total_revenue = 184210 , number_of_orders = 10 , average_order_value = 18421



-- BQ 2 ->  top 3 customers by total spend
-- Uses -> SELECT , aggregate function, group by, order by, join
-- Query
/*
SELECT o.customer_id, SUM(o.total_amount) as total_spend, c.name, c.city
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP by o.customer_id
order by total_spend DESC LIMIT 3
*/
-- Result -> top 3 customers spend = 59300, 55450, 22330


-- BQ 3 -> Revenue breakdown by order status and potential revenue lost
-- Uses -> Select, aggregate , group 
--Query 

-- Category wise revenue breakdown
/*
SELECT status, SUM(total_amount) as revenue
from orders
GROUP by status
order by revenue DESC
*/

-- Potential revenue lost
/*
SELECT status , SUM(total_amount) AS revenue_lost
from orders
WHERE status = 'cancelled'
*/

-- Result -> Revenue generated = 152280, Revenue Pending = 18800, Potential revenue lost = 5580

-- BQ 4 -> Which product category has highest revenue and most orderscustomers
-- Uses -> JOIN , aggregate functions, group by, order by
-- Query

--category which generated highest revenue
/*
SELECT p.category , SUM(oi.quantity * oi.unit_price) as revenue
from order_items oi
JOIN products p on p.product_id = oi.product_id
GROUP by p.category
order by revenue DESC LIMIT 1
*/
-- category having most orders
/*
SELECT p.category , SUM(oi.quantity) as most_orders
from order_items oi
JOIN products p on p.product_id = oi.product_id
GROUP by p.category
order by most_orders DESC LIMIT 1
*/

-- Result -> Category having most revenue and orders is Electronics 160000/- and 8 Respectively.

-- BQ 5 -> Number of customers who did not order yet
-- Uses -> NOT IN with 2 tables
-- Query

/*
SELECT COUNT(customer_id)
FROM customers
WHERE customer_id NOT IN (SELECT customer_id 
                          FROM orders)
*/

-- Result -> All customers in the dataset has ordered some products

-- BQ 6 -> What is the month-over-month revenue trend in 2024? 
-- Uses -> used cte, window function and arithmetic calculation
-- Query

/*

WITH month_sales AS

(SELECT strftime('%m', order_date) AS Month_Number,
	   SUM(total_amount) AS revenue
FROM orders
GROUP BY strftime('%m', order_date)
),

prev_sale AS
(
SELECT Month_Number,
	   revenue,
       LAG(revenue, 1, revenue) OVER(ORDER BY Month_Number) AS prev_month_sales
FROM month_sales
)

SELECT *, (ps.revenue - ps.prev_month_sales)/ps.prev_month_sales * 100 AS MOM_Growth
from prev_sale ps
*/

-- Result -> 3rd month of the 2024 year showed maximum growth trend

-- BQ 7 -> Find the top-selling product in each category by total units sold.
-- Uses ->
-- Query 
/*
WITH ProductSales AS (
        SELECT  p.category, 
        p.product_name, 
        SUM(s.quantity) AS total_units_sold
    FROM products p
    JOIN order_items s ON p.product_id = s.product_id
    GROUP BY p.category, p.product_name
),
RankedProducts AS (
     SELECT category, 
        product_name, 
        total_units_sold,
        RANK() OVER (PARTITION BY category ORDER BY total_units_sold DESC) AS sales_rank
    FROM ProductSales
)

SELECT category, product_name, total_units_sold
FROM RankedProducts
WHERE sales_rank = 1
ORDER BY total_units_sold DESC;
*/
-- Result -> Electronics is the category which has the highest number of products sold

-- BQ 8 ->  Rank all customers by total spend using DENSE_RANK. Show rank, name, city, spend.
-- Uses ->  dense_rank window function and aggregation with join
-- Query 

/*
SELECT name,
	   city,
       SUM(total_amount) AS total_spend,
       DENSE_RANK() OVER (ORDER BY SUM(total_amount) DESC) AS RANK
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.name
*/

-- Result -> Arjun sharma spend the highest amount of money on the orders

-- BQ 9 ->
-- Uses -> SUM window function and where clause
-- Query
/*
SELECT order_date,
       total_amount,
       SUM(total_amount) OVER (ORDER BY order_date) AS cummulative_revenue
FROM orders
WHERE status = 'delivered'
*/      
-- Result -> Total cummulative profit by the end of the time was 152280 for the orders which were delivered

-- BQ 10 ->  Build a "Customer 360" view — for each customer: name, city, total orders, total spent, avg order value, most recent order date, days since last order.
-- Uses -> cte and various types of functions ( aggregate and date )
-- Query
/*
WITH cust_data AS (
SELECT name, city, customer_id
FROM customers
),

more_data AS (
  SELECT cust_data.*,
	   SUM(total_amount) AS total_spend,
       COUNT(orders.customer_id) AS orders_num,
       SUM(total_amount)/COUNT(orders.customer_id) AS avg_order,
       MAX(orders.order_date) AS most_recent_order,
       CAST(julianday('now') - julianday(MAX(orders.order_date)) AS INTEGER) AS days_since_last_order
  
FROM cust_data
JOIN orders ON orders.customer_id = cust_data.customer_id
GROUP BY cust_data.customer_id, cust_data.name, cust_data.city
)

SELECT more_data.*
FROM more_data
*/
       

-- Result -> 360 customer view data
