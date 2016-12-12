DROP TABLE customers;
DROP TABLE films;
DROP TABLE tickets;

CREATE TABLE customers(
  id SERIAL4 Primary key,
  name VARCHAR(255),
  funds MONEY
);

CREATE TABLE films(
  id SERIAL4 Primary key,
  title VARCHAR(255),
  price MONEY
);

CREATE TABLE tickets(
  id  SERIAL4 PRIMARY KEY,
  customer_id INT4 references customers(id) ON DELETE CASCADE,
  film_id INT4 references films(id) ON DELETE CASCADE
);


