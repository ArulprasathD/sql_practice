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

select length(customer_name) as name_length from customerdetails;


select 
       CUSTOMER_NAME,
       length (CUSTOMER_NAME) as name_length,                        
	   upper(city) as city_uppercase     ,                            
       lower(customer_name) as cust_lower,
       concat(customer_name,' - ',city,' - ',' TN') as name_a,
       substring(customer_name,1,2) as prefix_name,
       trim('   CHENNAI  ') AS trimed_city,
       lpad(customer_name,10,'#') as left_padded,
       rpad(customer_name,10,'#') as right_padded,
       replace(customer_name,'r','R') as replaced,
       instr(customer_name,'a') as position_of_a,
       left(customer_name,2) as first_2_char,
       right(customer_name,2) as last_2_char,
       reverse(customer_name) as reverse_name,
       format(23143842946,2) as formated_number
from CustomerDetails;




-- funcation inside another funcation
select 
       upper(concat(customer_name,' - ',city,' - ',' TN')) as name_a
from CustomerDetails;



-- try with when (example)

select 
       CUSTOMER_NAME,
       length (CUSTOMER_NAME) as name_length,
       
       case
          when length(customer_name)  > 4 then 'f'
          else 'not f'
		end as updated,
        upper(city) as city_uppercase
from CustomerDetails;


