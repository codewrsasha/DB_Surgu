-- Задание 1 
SELECT * FROM READERS;

-- Задание 2
SELECT name, publication_year FROM BOOKS;

-- Задание 3 
SELECT name, publication_year FROM BOOKS WHERE publication_year < 1900;

-- Задание 4 
SELECT name, publication_year FROM BOOKS WHERE publication_year BETWEEN 1917 AND 1991;

-- Задание 5
SELECT * FROM readers WHERE number = '79001112233';

-- Задание 6 
SELECT * FROM readers WHERE name LIKE '%ов%';

-- Задание 7 
SELECT * FROM distribute WHERE fact_return_date IS NULL;

-- Задание 8 
SELECT name, publication_year FROM BOOKS ORDER BY name;

-- Задание 9
SELECT * FROM distribute WHERE fact_return_date IS NULL ORDER BY plan_return_date;

-- Задание 10 
SELECT name, publication_year FROM BOOKS ORDER BY publication_year LIMIT 3; -- От старых к новым
SELECT name, publication_year FROM BOOKS ORDER BY publication_year DESC LIMIT 3; -- От новых к старым
SELECT name, publication_year FROM BOOKS ORDER BY name LIMIT 3; -- По алфавиту
