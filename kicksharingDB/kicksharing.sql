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