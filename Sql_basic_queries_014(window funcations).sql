use market_data;


-- Create Table
CREATE TABLE Sales (
    TransactionID INT PRIMARY KEY,
    Store CHAR(1),
    SalesAmount DECIMAL(10,2)
);

-- Insert Values
INSERT INTO Sales (TransactionID, Store, SalesAmount)
VALUES
(1, 'A', 100.00),
(2, 'A', 200.00),
(3, 'A', 150.00),
(4, 'B', 250.00),
(5, 'B', 300.00);


-- group by

select store,sum(salesamount) as total_amount
from sales
group by store;


-- partition  by

select transactionID,
       store,
       salesamount,
              sum(salesamount) over(partition by store) as total_sales
		from sales;
        
 -- partition  by and order by

select transactionID,
       store,
       salesamount,
              sum(salesamount) over(partition by store order by transactionid desc) as total_sales
		from  
			sales;      
        
        
-- ROW_NUMBBER()

SELECT 
       TransactionID,
       Store,
       SalesAmount,
       ROW_NUMBER() OVER (ORDER BY SalesAmount DESC) AS ROWNUM
FROM
    SALES;
    
    
/* REAL USE CASE */

-- Create Employees Table

USE WORKER_DETAILS;

CREATE TABLE Employee (
    EmployeeID INT,
    Name VARCHAR(50),
    Department VARCHAR(50),
    HireDate DATE
);

-- Insert Records into Employees Table

INSERT INTO Employee (EmployeeID, Name, Department, HireDate)
VALUES
(1, 'Alice', 'HR', '2020-05-01'),
(1, 'Alice', 'HR', '2022-06-15'),
(2, 'Bob', 'IT', '2021-07-10'),
(3, 'Charlie', 'Finance', '2020-09-30'),
(3, 'Charlie', 'Finance', '2022-05-22');

WITH EMPLOYEERANK AS(
	SELECT 
		EmployeeID,
		Name,
		Department,
		HireDate,
				ROW_NUMBER() OVER ( PARTITION BY EmployeeID ORDER BY HIREDATE ASC) AS ROWNUM
	FROM 
		EMPLOYEE
)

SELECT EmployeeID,
		Name,
		Department,
		HireDate FROM  EMPLOYEERANK WHERE ROWNUM = 1 ;
        
        
-- RANK AND DENSE RANK ()

USE TEST

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    ExamScore INT
);

INSERT INTO Students (StudentID, StudentName, ExamScore)
VALUES
    (1, 'Alice', 95),
    (2, 'Bob', 90),
    (3, 'Charlie', 95),
    (4, 'David', 85),
    (5, 'Eva', 90);



    

        