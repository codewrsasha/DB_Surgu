-- Задание 1
SELECT p.category, COUNT(*) AS product_count
FROM products p
GROUP BY p.category
ORDER BY product_count DESC;

-- Задание 2
SELECT SUM(oi.quantity * oi.price_per_unit) AS total_revenue
FROM order_items oi

-- Задание 3
SELECT 
    c.full_name,
    COUNT(o.order_id) AS order_count
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.full_name
ORDER BY order_count DESC;

-- Задание 4
SELECT 
    AVG(order_total) AS average_order_value
FROM (
    SELECT SUM(oi.quantity * oi.price_per_unit) AS order_total
    FROM order_items oi
    GROUP BY oi.order_id
);

-- Задание 5
SELECT
    o.status, COUNT(*) AS order_count
FROM orders o
GROUP BY status;

-- Задание 6
SELECT p.category, COUNT(*) AS product_count
FROM products p
GROUP BY p.category
HAVING COUNT(*) > 1;

-- Задание 7
SELECT 
    c.full_name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.full_name
HAVING COUNT(o.order_id) > 1;

-- Задание 8
SELECT 
    p.product_name,
    SUM(oi.quantity) AS total_sold
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_sold DESC;
-- LIMIT 1;