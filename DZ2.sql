# ЗАДАНИЕ 1
DROP DATABASE IF EXISTS  hw2;
CREATE DATABASE IF NOT EXISTS hw2;

USE hw2;

DROP TABLE IF EXISTS sales1;
CREATE TABLE IF NOT EXISTS sales1
(id  INT PRIMARY KEY AUTO_INCREMENT,
order_date DATE NOT NULL,
count_product INT
);
#SELECT * FROM hw2.sales1;
INSERT INTO sales1 (order_date, count_product)
VALUES
('2022-01-01', 156),
('2022-01-02', 180),
('2022-01-03', 21),
('2022-01-04', 124),
('2022-01-05', 341);
# SELECT * FROM hw2.sales1;
# Задание 2
SELECT id,
	CASE
		WHEN count_product < 100 THEN "Маленький заказ"
        WHEN count_product > 300 THEN "Боьшой заказ"
        ELSE "Средний заказ"
    END AS Order_type 
FROM sales1;
#SELECT * FROM hw2.sales1;


# Задание 3

DROP TABLE IF EXISTS orders;
CREATE TABLE IF NOT EXISTS orders
(id  INT PRIMARY KEY AUTO_INCREMENT,
employee_id VARCHAR(45) NOT NULL,
amount FLOAT(4),
order_status VARCHAR(45)
);
#SELECT * FROM hw2.orders;

INSERT INTO orders (employee_id, amount, order_status)
VALUES
('e03', 15.00, 'OPEN'),
('e01', 25.50, 'OPEN'),
('e05', 100.70, 'CLOSED'),
('e02', 22.18, 'OPEN'),
('e04', 9.50, 'CANCELLED');
#SELECT * FROM hw2.orders;
SELECT order_status,
	IF(order_status = 'OPEN', "Order is in open state",
		IF(order_status = 'CLOSED', "Order is closed", "Order is cancelled")) AS full_order_status
			#IF(order_stastus = 'CANCELLED', 'Order is cancelled'))) AS 'full_order_status'
FROM orders;            
 # Вариант с CASE
 SELECT
	CASE
		WHEN order_status = 'OPEN' THEN "Order is open state"
        WHEN order_status = 'CLOSED'THEN "Order is closed"
        ELSE 'Order is cancelled'
    END AS full_order_status  
FROM orders;    
