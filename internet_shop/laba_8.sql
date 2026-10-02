-- Active: 1790599198554@@127.0.0.1@5432@internet_shop
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
LEFT JOIN products p ON oi.product_id = p.product_id
WHERE o.order_date IS NULL OR p.product_name != 'Ноутбук';

-- NOT IN
SELECT 
    c.full_name
FROM customers c
WHERE c.customer_id NOT IN (
    SELECT 
        o.customer_id
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    WHERE p.product_name = 'Ноутбук'
);

-- Задание 8
SELECT 
    p.product_name
FROM order_items oi
RIGHT JOIN products p ON oi.product_id = p.product_id
WHERE oi.product_id IS NULL;

-- Задание 9
SELECT 
    c.full_name,
    p.product_name,
    oi.quantity
FROM customers c
FULL OUTER JOIN orders o ON c.customer_id = o.customer_id
FULL OUTER JOIN order_items oi ON o.order_id = oi.order_id
FULL OUTER JOIN products p ON oi.product_id = p.product_id;

-- Задание 10
-- C JOIN
SELECT 
    c.full_name,
    p.product_name,
    oi.quantity
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE p.price = (SELECT MAX(price) FROM products);

-- Без JOIN
SELECT full_name
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
    WHERE order_id IN (
        SELECT order_id
        FROM order_items
        WHERE product_id IN (
            SELECT product_id
            FROM products
            WHERE price = (SELECT MAX(price) FROM products)
        )
    )
);

-- Задание 11
SELECT 
    c.full_name,
    p.category
FROM customers c
CROSS JOIN (
    SELECT category 
    FROM products
) p;

-- Задание 12
SELECT 
    new_c.full_name AS new_customer,
    rec_c.full_name AS recommended_by
FROM customers new_c
JOIN customers rec_c ON new_c.recommended_by = rec_c.customer_id;
