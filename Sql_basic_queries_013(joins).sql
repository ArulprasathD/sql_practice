DROP DATABASE restaurents_data;


CREATE DATABASE RESTAURANTS_DATA;

USE RESTAURANTS_DATA;

-- Create Restaurants Table
CREATE TABLE Restaurants (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    location VARCHAR(100)
);

alter table Restaurants add column customer_id int  ;

desc Restaurants;

truncate table Restaurants;

-- Insert Data into Restaurants
INSERT INTO Restaurants (id, name, location,customer_id)
VALUES
(1, 'ABC Bistro', 'New York',1),
(2, 'The Foodie', 'Los Angeles',2),
(3, 'Tasty Treat', 'Chicago',3);


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


-- create table customer

create table customer(
           customer_name varchar(100),
           customer_id int
);

insert into customer (customer_name,customer_id)
values
('arul',1),
('vinnu',2),
('mukil',3);

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
    R.NAME AS RESTAURANT_NAME, O.ORDER_DATE
FROM
    RESTAURANTS R
        RIGHT JOIN
    ORDERS O ON R.ID = O.RESTAURANT_ID;

-- FULL JOIN



-- TWO OR MORE TABLE 


SELECT 
     R.NAME AS RESTAURANT_NAME,
     O.ORDER_DATE,
     c.customer_name as CUSTOMER_NAME
FROM RESTAURANTS R 
LEFT JOIN ORDERS O 
ON R.ID = O.RESTAURANT_ID
LEFT JOIN CUSTOMER C 
ON R.CUSTOMER_ID = C.CUSTOMER_ID;



-- SELF JOIN
USE WORKER_DETAILS;


CREATE TABLE EMPLOYEES(
                     ID INT PRIMARY KEY,
                     NAME VARCHAR (100),
                     MANAGER_ID INT
);

TRUNCATE TABLE EMPLOYEES;

INSERT INTO EMPLOYEES (ID,NAME,MANAGER_ID)
VALUES
(1,'ALICE',3),
(2,'MAX',3),
(3,'BOB',NULL),
(4,'CHARLI',3);


SELECT * FROM EMPLOYEES;


SELECT 
      E.NAME AS EMPLOYEE_NAME,
      M.NAME AS MANAGER_NAME
      
FROM EMPLOYEES E
LEFT JOIN EMPLOYEES M 
ON E.MANAGER_ID =m.ID;
     
     
     
     
