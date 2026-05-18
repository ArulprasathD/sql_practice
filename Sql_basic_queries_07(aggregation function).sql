CREATE DATABASE DE_PROJECT;

USE DE_PROJECT;


DROP TABLE IF EXISTS CUSTOMER_TRANSATIONS;
CREATE TABLE CUSTOMER_TRANSATIONS (
                            ID INT PRIMARY KEY,
                            LOGIN_DEVICE VARCHAR (50),
                            CUSTOMER_NAME VARCHAR (100),
                            IP_ADDRESS VARCHAR (20),
                            PRODUCT VARCHAR (100),
                            AMOUNT DECIMAL (10,2),
                            IS_PLACED BOOLEAN,
                            IS_VIEWED BOOLEAN,
                            TRANSACTION_STATUS VARCHAR(20)

);

INSERT INTO CUSTOMER_TRANSATIONS 
(id, login_device, customer_name, ip_address, product, amount, is_placed, is_viewed, transaction_status)
VALUES
(1, 'Mobile', 'Arun', '192.168.1.1', 'Laptop', 55000.00, TRUE, TRUE, 'Completed'),
(2, 'Desktop', 'Kavin', '192.168.1.2', 'Mouse', 1200.50, TRUE, TRUE, 'Pending'),
(3, 'Tablet', 'Priya', '192.168.1.3', 'Keyboard', 2500.75, FALSE, TRUE, 'Cancelled'),
(4, 'Mobile', 'Sneha', '192.168.1.4', 'Monitor', 15000.00, TRUE, FALSE, 'Completed'),
(5, 'Desktop', 'Rahul', '192.168.1.5', 'Headphones', 3200.99, TRUE, TRUE, 'Shipped'),
(6, 'Laptop', 'Divya', '192.168.1.6', 'Smartphone', 28000.00, FALSE, FALSE, 'Pending'),
(7, 'Mobile', 'Vijay', '192.168.1.7', 'Printer', 8500.00, TRUE, TRUE, 'Delivered'),
(8, 'Tablet', 'Meena', '192.168.1.8', 'Camera', 45000.00, TRUE, FALSE, 'Processing'),
(9, 'Desktop', 'Suresh', '192.168.1.9', 'Speaker', 5000.00, FALSE, TRUE, 'Cancelled'),
(10, 'Mobile', 'Anitha', '192.168.1.10', 'Smart Watch', 7000.50, TRUE, TRUE, 'Completed');

SELECT *FROM CUSTOMER_TRANSATIONS;

-- count

SELECT COUNT(*) FROM CUSTOMER_TRANSATIONS WHERE transaction_status = 'Cancelled';

SELECT COUNT(*) FROM CUSTOMER_TRANSATIONS WHERE transaction_status = 'COMPLETED' AND product = 'Laptop';


select count(*) from CUSTOMER_TRANSATIONS where transaction_status in ( 'Pending','Processing');

select count(*) from CUSTOMER_TRANSATIONS where transaction_status not in ( 'Pending','Processing');

-- DISTINCT

SELECT DISTINCT login_device
FROM CUSTOMER_TRANSATIONS;

