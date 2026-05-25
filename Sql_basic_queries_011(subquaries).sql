USE MARKET_DATA;

CREATE TABLE CUSTOMER_PERSONAL_DETAILS(
									  CUSTOMER_ID INT PRIMARY KEY,
                                      CUSTOMER_NAME VARCHAR(100),
                                      CITY VARCHAR(100)
);

INSERT INTO CUSTOMER_PERSONAL_DETAILS 
VALUES
(1,'ARUL PRSASTH','CHENNAI'),
(2,'JEEVAN','NAGAPATTINAM'),
(3,'VINNARASU','MANNARGUDI'),
(4,'YOGESH','THIRVARUR'),
(5,'MUKILAN','PATTUKOTTAI');


CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_amount DECIMAL(10,2),
    order_date DATE
);


INSERT INTO orders (order_id, customer_id, order_amount, order_date)
VALUES
(101, 1, 5000.00, '2025-01-01'),
(102, 2, 10000.00, '2025-01-02'),
(103, 3, 3000.00, '2025-01-03'),
(104, 4, 1500.00, '2025-01-04'),
(105, 1, 7000.00, '2025-01-05'),
(106, 5, 8000.00, '2025-01-06');

SELECT * FROM ORDERS;

/*Display all customer names along with
 the maximum order amount from the orders table*/

SELECT 
CUSTOMER_NAME,
(SELECT MAX(ORDER_AMOUNT) FROM ORDERS) AS MAX_AMOUNT
FROM CUSTOMER_PERSONAL_DETAILS;


SELECT 
CUSTOMER_NAME
FROM CUSTOMER_PERSONAL_DETAILS
WHERE CUSTOMER_ID IN (
          SELECT DISTINCT (CUSTOMER_ID)
          FROM ORDERS
          WHERE
          ORDER_AMOUNT >= 5000

);

-- EXIST

SELECT 
CUSTOMER_NAME
FROM CUSTOMER_PERSONAL_DETAILS
WHERE EXISTS(
           SELECT * FROM CUSTOMER_PERSONAL_DETAILS WHERE CITY = 'CHENNAI'
);


-- SUBQUERY IN JOINS

SELECT 
      CUSTOMER_NAME,
	  CITY,
					(SELECT SUM(ORDER_AMOUNT)
					 FROM ORDERS O 
					 WHERE O.CUSTOMER_ID = C.CUSTOMER_ID
                     )AS TOTAL_ORDERS
FROM CUSTOMER_PERSONAL_DETAILS C;

SELECT 
     ID,
     CUSTOMER_NAME,
     name_length,
     city_uppercase,
     cust_lower,
     name_a,
     prefix_name,
     trimed_city,
     left_padded,
     right_padded,
     replaced,
     position_of_a,
     first_2_char,
     last_2_char,
     reverse_name,
     formated_number
     FROM (
select 
       CUSTOMER_NAME,
       ID,
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
from CustomerDetails) AS SUBQUREY;

-- SUBQUREY IN CASE STATEMENT

SELECT 
     CUSTOMER_NAME,
     CASE
        WHEN (SELECT SUM(ORDER_AMOUNT)FROM ORDERS WHERE ORDERS.CUSTOMER_ID = CUSTOMER_PERSONAL_DETAILS.CUSTOMER_ID) >
             (SELECT AVG(ORDER_AMOUNT)FROM ORDERS) THEN 'ABOVE AVERAGE'
		ELSE 'BELOW AVERAGE'
	 END AS AVERAGE_TABLE
FROM CUSTOMER_PERSONAL_DETAILS;





SELECT distinct(customer_id) from orders;






