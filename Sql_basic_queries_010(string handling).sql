-- string handling
use market_data;

CREATE TABLE CustomerDetails(
    ID INT,
    CUSTOMER_NAME VARCHAR(50),
    EMAIL VARCHAR(100),
    CITY VARCHAR(50),
    PHONE_NUMBER BIGINT
);

INSERT INTO CustomerDetails VALUES
(1, 'Arun', 'arun@gmail.com', 'Chennai', 9876543210),
(2, 'Kavin', 'kavin@gmail.com', 'Coimbatore', 9123456780),
(3, 'Priya', 'priya@gmail.com', 'Madurai', 9988776655),
(4, 'Rahul', 'rahul@gmail.com', 'Salem', NULL),
(5, 'Divya', 'divya@gmail.com', 'Trichy', 9090909090);


select * from customerdetails;

-- length funcation 
-- upper funcation



select 
       CUSTOMER_NAME,
       length (CUSTOMER_NAME) as name_length,                         -- find length
        upper(city) as city_uppercase                                 -- change upper
from CustomerDetails;

-- try with when (example)

select 
       CUSTOMER_NAME,
       length (CUSTOMER_NAME) as name_length,
       
       case
          when length(customer_name) > 4 then 'f'
          else 'not f'
		end,
        upper(city) as city_uppercase
from CustomerDetails;