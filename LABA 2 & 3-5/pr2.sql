-- Задание 1,2: Создание базы данных и таблиц для библиотеки --

CREATE DATABASE biblioteque;
CREATE TABLE readers(
    id_reader SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    number VARCHAR(255) NOT NULL
);

CREATE TABLE books(
    isbn VARCHAR(20) NOT NULL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    publication_year INTEGER NOT NULL
);

CREATE TABLE authors(
    id_author SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE distribute(
    id_distribute SERIAL PRIMARY KEY,
    fk_reader INTEGER NOT NULL,
    fk_isbn VARCHAR(20) NOT NULL,
    date_distribute DATE NOT NULL,
    plan_return_date DATE NOT NULL,
    fact_return_date DATE,
    FOREIGN KEY (fk_reader) REFERENCES readers(id_reader),
    FOREIGN KEY (fk_isbn) REFERENCES books(isbn)
);

CREATE TABLE authorship(
    fk_reader INTEGER NOT NULL,
    fk_isbn VARCHAR(20) NOT NULL,
    PRIMARY KEY (fk_reader, fk_isbn),
    FOREIGN KEY (fk_reader) REFERENCES readers(id_reader),
    FOREIGN KEY (fk_isbn) REFERENCES books(isbn)
);



-- Задание 3: заполнение таблиц данными --

INSERT INTO readers (name, number) VALUES
('Анна Петрова', '79001112233'),
('Иван Соколов', '79002223344'),
('Мария Ким', '79003334455'),
('Олег Васильев', '79004445566');

INSERT INTO books (isbn, name, publication_year) VALUES
(9785171183668, 'Мастер и Маргарита', 1967),
(9785389062566, 'Преступление и наказание', 1866),
(9785041167163, 'Война и мир', 1869),
(9785699120147, 'Золотой теленок', 1931),
(9785389037137, 'Пикник на обочине', 1972);

INSERT INTO authors (name) VALUES
('Михаил Булгаков'),
('Фёдор Достоевский'),
('Лев Толстой'),
('Илья Ильф'),
('Евгений Петров'),
('Аркадий и Борис Стругацкие');

insert into authorship (fk_reader, fk_isbn) values
(1, 9785171183668),
(2, 9785389062566),
(3, 9785041167163),
(4, 9785699120147),
(1, 9785389037137);

insert into distribute (fk_reader, fk_isbn, date_distribute, plan_return_date, fact_return_date) values
(1, 9785171183668, '2026-01-10', '2026-02-10', '2026-02-05'),
(2, 9785389062566, '2026-01-15', '2026-02-15', NULL),
(3, 9785041167163, '2026-01-20', '2026-02-20', '2026-02-18'),
(4, 9785699120147, '2026-01-25', '2026-02-25', NULL),
(1, 9785389037137, '2026-01-30', '2026-03-01', '2026-02-28');



-- Задание 4: Изменение и удаление данных --

UPDATE readers SET number = '79005556677' WHERE id_reader = 2;

UPDATE distribute SET fact_return_date = '2026-02-20' WHERE id_distribute = 2;

INSERT INTO readers (name, number) VALUES
('Тестовый читатель', '88888888888');

DELETE FROM readers WHERE id_reader = 5;