CREATE TABLE orders (
  order_id SERIAL PRIMARY KEY,
  customer_name VARCHAR(50),
  product VARCHAR(50),
  amount INTEGER,
  order_date DATE
);

INSERT INTO orders (customer_name, product, amount, order_date) VALUES
('Amit', 'Shoes', 2000, '2023-01-01'),
('Neha', 'Bag', 1500, '2023-01-02'),
('Rahul', 'Watch', 3000, '2023-01-03');
