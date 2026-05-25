DROP DATABASE restaurents_data;


CREATE DATABASE RESTAURANTS_DATA;

USE RESTAURANTS_DATA;

-- Create Restaurants Table
CREATE TABLE Restaurants (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    location VARCHAR(100)
);

-- Insert Data into Restaurants
INSERT INTO Restaurants (id, name, location)
VALUES
(1, 'ABC Bistro', 'New York'),
(2, 'The Foodie', 'Los Angeles'),
(3, 'Tasty Treat', 'Chicago');


-- Create Orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    restaurant_id INT,
    order_date DATE
);

-- Insert Data into Orders
INSERT INTO orders (order_id, restaurant_id, order_date)
VALUES
(1, 1, '2023-01-01'),
(2, 1, '2023-01-02'),
(3, 2, '2023-01-05'),
(4, 4, '2023-01-07');

SELECT * FROM restaurants;
SELECT * FROM ORDERS;

-- JOINS

SELECT 
     R.NAME AS RESTAURANT_NAME,
     O.ORDER_DATE
FROM restaurants R 
JOIN ORDERS O 
ON R.ID = O.RESTAURANT_ID;

-- LEFT JOIN

SELECT 
     R.NAME AS RESTAURANT_NAME,
     O.ORDER_DATE
FROM RESTAURANTS R 
LEFT JOIN ORDERS O 
ON R.ID = O.RESTAURANT_ID;


-- RIGHT JOIN

SELECT 
     R.NAME AS RESTAURANT_NAME,
     O.ORDER_DATE
FROM RESTAURANTS R 
RIGHT JOIN ORDERS O 
ON R.ID = O.RESTAURANT_ID;

-- FULL JOIN

