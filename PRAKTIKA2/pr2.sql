CREATE DATABASE biblioteque;
CREATE TABLE readers(
    id_reader SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    number INTEGER NOT NULL
);

CREATE TABLE books(
    isbn INTEGER NOT NULL PRIMARY KEY,
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
    fk_isbn_book INTEGER NOT NULL,
    date_distribute DATE NOT NULL,
    plan_return_date DATE NOT NULL,
    fact_return_date DATE NOT NULL,
    FOREIGN KEY (fk_reader) REFERENCES readers(id_reader),
    FOREIGN KEY (fk_isbn_book) REFERENCES books(isbn)
);

CREATE TABLE authorship(
    fk_reader INTEGER NOT NULL,
    fk_isbn_book INTEGER NOT NULL,
    PRIMARY KEY (fk_reader, fk_isbn_book),
    FOREIGN KEY (fk_reader) REFERENCES readers(id_reader),
    FOREIGN KEY (fk_isbn_book) REFERENCES books(isbn)
);