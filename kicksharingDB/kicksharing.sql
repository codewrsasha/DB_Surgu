-- Active: 1789046660833@@127.0.0.1@5432@kicksharing
CREATE DATABASE kicksharing;

CREATE TYPE RENTAL_STATUSES as ENUM ('Свободен','Забронирован','Занят');
CREATE TYPE PAYMENT_METHODS as ENUM('СБП','QR','Списание с баланса приложения');
CREATE TYPE PAYMENT_STATUSES as ENUM('Ожидание оплаты','Списание средств','Оплата проведена');

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    phone VARCHAR UNIQUE NOT NULL,
    email VARCHAR UNIQUE,
    name VARCHAR NOT NULL,
    balance NUMERIC(10,2),
    registred_date TIMESTAMP NOT NULL
);

CREATE TABLE models (
    model_id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL,
    max_speed INTEGER,
    price_per_min NUMERIC(3,2)
);

CREATE TABLE scooters (
    serial_number SERIAL PRIMARY KEY,
    fk_model_id INTEGER NOT NULL,
    rental_status RENTAL_STATUSES,
    battery_level INTEGER,
    coordinates VARCHAR,
    FOREIGN KEY (fk_model_id) REFERENCES models(model_id)
);

CREATE TABLE rentals (
    rental_id SERIAL PRIMARY KEY,
    fk_user_id INTEGER NOT NULL,
    fk_scooter_serial_number INTEGER NOT NULL,
    start_time TIMESTAMP NOT NULL,
    end_time TIMESTAMP,
    total_cost NUMERIC(10,2),
    FOREIGN KEY (fk_user_id) REFERENCES users(user_id),
    FOREIGN KEY (fk_scooter_serial_number) REFERENCES scooters(serial_number)
);

CREATE TABLE payments (
    payment_id SERIAL PRIMARY KEY,
    fk_rental_id INTEGER NOT NULL,
    cost NUMERIC(10,2) NOT NULL,
    payment_method PAYMENT_METHODS,
    payment_status PAYMENT_STATUSES,
    paid_at TIMESTAMP,
    FOREIGN KEY (fk_rental_id) REFERENCES rentals(rental_id)
);

CREATE TABLE repairs (
    repair_id SERIAL PRIMARY KEY,
    fk_scooter_serial_number INTEGER NOT NULL,
    master_name VARCHAR,
    description TEXT,
    repair_date DATE NOT NULL
);

INSERT INTO users (phone, email, name, balance, registred_date) VALUES
    ('+7-922-862-77-88', 'ivan862@mail.ru', 'Иван Иванов', 1000.50, '2025-06-07'),
    ('+7-922-788-77-88', 'vika788@mail.ru', 'Виктория Петрова', 500, '2025-08-09'),
    ('+7-932-990-07-07', 'evgeniy990@mail.ru', 'Евгений Орлов', 200.30, '2025-09-09'),
    ('+7-932-995-87-07', 'sergey995@mail.ru', 'Сергей Шаров', 500.50, '2025-10-07'),
    ('+7-912-560-17-85', 'alla560@mail.ru', 'Алла Деревяшкина', 333.55, '2025-11-17'),
    ('+7-912-120-75-48', 'denis120@mail.ru', 'Денис Крутой', 650.50, '2025-12-22');

INSERT INTO models (name, max_speed, price_per_min) VALUES
    ('xiaomi s365', 25, 5),
    ('ninebot m3', 20, 2),
    ('ninebot m6', 30, 3),
    ('kugoo s3', 35, 4);

INSERT INTO scooters (fk_model_id, rental_status, battery_level, coordinates) VALUES
    (1, 'Свободен', 99, '62.005 43.006'),
    (1, 'Забронирован', 50, '62.045 43.067'),
    (1, 'Занят', 25, '65.555 44.706'),
    (2, 'Свободен', 85, '62.405 43.606'),
    (2, 'Забронирован', 44, '62.445 43.077'),
    (2, 'Занят', 33, '65.565 44.736'),
    (3, 'Свободен', 75, '62.405 43.456'),
    (3, 'Забронирован', 33, '62.125 43.567'),
    (3, 'Занят', 20, '65.565 47.776'),
    (4, 'Свободен', 5, '62.445 43.896'),
    (4, 'Забронирован', 40, '62.675 43.967'),
    (4, 'Занят', 3, '65.875 44.796');

INSERT INTO rentals(fk_user_id, fk_scooter_serial_number, start_time, end_time, total_cost) VALUES
    (1, 1, '2025-06-07 10:00:00', '2025-06-07 10:30:00', 150),
    (2, 2, '2025-08-09 11:00:00', '2025-08-09 11:15:00', 30),
    (3, 3, '2025-09-09 12:00:00', '2025-09-09 12:45:00', 135),
    (4, 4, '2025-10-07 13:00:00', '2025-10-07 13:20:00', 40),
    (5, 1, '2025-11-17 14:00:00', '2025-11-17 14:30:00', 75),
    (6, 2, '2025-12-22 15:00:00', '2025-12-22 15:10:00', 20),
    (1, 3, '2025-06-07 16:00:00', '2025-06-07 16:30:00', 90),
    (2, 4, '2025-08-09 17:00:00', '2025-08-09 17:15:00', 45),
    (3, 1, '2025-09-09 18:00:00', '2025-09-09 18:45:00', 135),
    (4, 2, '2025-10-07 19:00:00', '2025-10-07 19:20:00', 60),
    (5, 3, '2025-11-17 20:00:00', '2025-11-17 20:30:00', 75),
    (6, 4, '2025-12-22 21:00:00', '2025-12-22 21:10:00', 30);

INSERT INTO payments(fk_rental_id, cost, payment_method, payment_status, paid_at) VALUES
    (1, 150, 'СБП', 'Оплата проведена', '2025-06-07 10:30:00'),
    (2, 30, 'QR', 'Списание средств', '2025-08-09 11:15:00'),
    (3, 135, 'Списание с баланса приложения', 'Оплата проведена', '2025-09-09 12:45:00'),
    (4, 40, 'СБП', 'Ожидание оплаты', '2025-10-07 13:20:00'),
    (5, 75, 'QR', 'Оплата проведена', '2025-11-17 14:30:00'),
    (6, 20, 'Списание с баланса приложения', 'Оплата проведена', '2025-12-22 15:10:00');

INSERT INTO repairs(fk_scooter_serial_number, master_name, description, repair_date) VALUES
    (1, 'Иванов И.И.', 'Замена аккумулятора', '2025-06-10'),
    (2, 'Петров П.П.', 'Ремонт тормозной системы', '2025-08-12'),
    (3, 'Сидоров С.С.', 'Замена колес', '2025-09-15'),
    (4, 'Кузнецов К.К.', 'Ремонт двигателя', '2025-10-20'),
    (1, 'Иванов И.И.', 'Регулировка руля', '2025-11-05'),
    (2, 'Петров П.П.', 'Замена тормозных колодок', '2025-12-01');