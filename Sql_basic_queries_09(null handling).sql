-- NULL HANDLING

use market_data;


CREATE TABLE CustomerData (
    id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(15),
    address VARCHAR(50),
    amount DECIMAL(10,2)
);

INSERT INTO CustomerData VALUES
(1, 'Ravi', 'ravi@example.com', '9876543210', 'Chennai', 5000.00),
(2, 'Priya', NULL, '9876543211', 'Bangalore', NULL),
(3, 'Arjun', 'arjun@example.com', NULL, 'Hyderabad', 1500.00),
(4, 'Meena', NULL, NULL, 'Mumbai', 2500.00),
(5, 'Karthik', 'karthik@example.com', '9876543212', NULL, 3000.00);


select * from CustomerData;                            

select count(*) from CustomerData where phone_number is null;

select count(*) from CustomerData where phone_number is not null;

insert into customerdata values
(6,'vasi','vasi@gmail.com','6482934902','null',500.00);

select count(*) from customerdata where address = 'null';                 -- once you check the null try to check the both types (is null and 'null') for easy to find 

select
	  id,
      customer_name,
      email,
      phone_number,
      address
from customerdata
where
     email is null
     or phone_number is null
     or address is null;
     
 -- COALESCE
 
select                                             -- COALESCE IS USED TO HANDLE THE NULL VALUES
     id,
     customer_name,
     amount,
     coalesce (amount,'0.00') as updated
from customerdata ;

-- IF NULL

select 
     id,
     customer_name,
     amount,
     ifnull(amount,'0.00') as updated
from customerdata;


