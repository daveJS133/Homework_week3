DROP TABLE customers;
DROP TABLE films;
DROP TABLE tickets;

CREATE TABLE customers(
id SERIAL4 Primary key,
name VARCHAR(255)
);

CREATE TABLE films(
title VARCHAR(255),
price MONEY
);

CREATE TABLE tickets(
id  SERIAL4 PRIMARY KEY,
customer_id INT4 references customers(id) ON DELETE CASCADE,
film_id INT4 references film(id) ON DELETE CASCADE
);


