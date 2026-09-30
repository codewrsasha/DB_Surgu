-- Задание 1
SELECT
    c.full_name,
    o.order_date
FROM Orders o 
JOIN Customers c ON o.customer_id = c.customer_id;

-- Задание 2
SELECT
    c.full_name
FROM Customers c 
LEFT JOIN Orders o ON o.customer_id = c.customer_id
WHERE o.order_date IS NULL;

-- Задание 3
SELECT
    p.product_name,
    oi.quantity,
    oi.price_per_unit
FROM order_items oi
FULL OUTER JOIN products p ON p.product_id = oi.product_id
WHERE oi.order_id = 1;

-- Задание 4
SELECT
    c.full_name
FROM Customers c
JOIN Orders o ON o.customer_id = c.customer_id
JOIN Order_Items oi ON oi.order_id = o.order_id
WHERE oi.product_id = 1;

-- Задание 5
SELECT
    product_name
    price
FROM products
WHERE price > (SELECT avg(price) FROM products);

-- Задание 6
SELECT o.order_id, o.order_date
FROM orders o
WHERE EXISTS (
    SELECT *
    FROM order_items oi
    WHERE oi.order_id = o.order_id
      AND oi.price_per_unit > 100000
);

-- Задание 7
-- LEFT JOIN
SELECT 
    c.full_name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN order_items oi ON o.order_id = oi.order_id
LEFT JOIN products p ON oi.product_id = p.product_id AND p.product_name = 'Ноутбук'
WHERE p.product_id IS NULL;

-- NOT IN


-- Задание 8


-- Задание 9


-- Задание 10


-- Задание 11


-- Задание 12

