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
WHERE Order_Items.product_id = 1;

-- Задание 5


-- Задание 6


-- Задание 7


-- Задание 8


-- Задание 9


-- Задание 10


-- Задание 11


-- Задание 12

