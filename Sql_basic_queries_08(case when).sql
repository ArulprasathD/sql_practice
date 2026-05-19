
-- case when


create database market_data;

use market_data;

CREATE TABLE customers (
    id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(15),
    address VARCHAR(50),
    amount DECIMAL(10,2)
);

INSERT INTO customers VALUES
(1, 'Ravi', 'ravi@example.com', '9876543210', 'Chennai', 5000.00),
(2, 'Priya', NULL, '9876543211', 'Bangalore', NULL),
(3, 'Arjun', 'arjun@example.com', NULL, 'Hyderabad', 1500.00),
(4, 'Meena', NULL, NULL, 'Mumbai', 2500.00),
(5, 'Karthik', 'karthik@example.com', '9876543212', NULL, 3000.00),
(6, 'Divya', 'divya@example.com', '9876543213', 'Delhi', 4200.00),
(7, 'Surya', NULL, '9876543214', 'Pune', 1800.00),
(8, 'Anitha', 'anitha@example.com', NULL, NULL, 2700.00),
(9, 'Vikram', 'vikram@example.com', '9876543215', 'Kolkata', NULL),
(10, 'Nisha', NULL, NULL, 'Coimbatore', 3500.00);


select 
     customer_name,
     amount,
     case
         when amount > 4000 then 'high spender'
         when amount between 2000 and 4000 then 'medium spender'
         when amount <= 2000 then 'low spender'
         else 'no data'
	 end as spending 
     from customers;
     

                       -- case when order matter
select
customer_name,
     case
         when email is null and phone_number is null then '9999'
         when phone_number is null then email
         else phone_number
	end as contact
    from customers;
    
    
select * from customers limit 3;               -- LIMIT is used to display records within a given range and reduce the amount of data retrieved from the database. 
    