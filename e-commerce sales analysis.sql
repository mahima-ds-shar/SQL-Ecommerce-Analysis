USE ecommerce_analysis;
SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;

-- Total Revenue Per Product
SELECT 
    p.product_name,
    SUM(o.quantity * p.price) AS total_revenue
FROM orders o
JOIN products p
ON o.product_id = p.product_id
GROUP BY p.product_name;

-- Highest Spending Customer
SELECT 
  c.customer_name,
  SUM(o.quantity * p.price) AS total_spent
FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id
JOIN products p
ON o.product_id=p.product_id
GROUP BY c.customer_name
ORDER BY total_spent DESC;
 
 -- Most Popular Category
SELECT
  p.category,
  SUM(o.quantity) AS total_quantity
FROM products p
JOIN orders o
ON p.product_id=o.product_id
GROUP BY p.category
ORDER BY total_quantity DESC;

-- Orders by City
SELECT
  c.city,
  COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id
GROUP BY c.city;