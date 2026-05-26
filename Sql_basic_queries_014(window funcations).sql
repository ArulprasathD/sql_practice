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

USE TEST;

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
    
    
select 
	StudentID,
    StudentName,
    ExamScore,
			DENSE_RANK() over ( ORDER BY EXAMSCORE DESC ) AS RANKING
from students;


select 
	StudentID,
    StudentName,
    ExamScore,
			RANK() over ( ORDER BY EXAMSCORE DESC ) AS RANKING
from students;


-- PERCENT RANK

USE MARKET_DATA;

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    SalesAmount INT
);


INSERT INTO Products (ProductID, ProductName, SalesAmount) VALUES
(1, 'Product 1', 500),
(2, 'Product 2', 1200),
(3, 'Product 3', 750),
(4, 'Product 4', 1800),
(5, 'Product 5', 950),
(6, 'Product 6', 2200),
(7, 'Product 7', 1300),
(8, 'Product 8', 2700),
(9, 'Product 9', 1600),
(10, 'Product 10', 3000),
(11, 'Product 11', 850),
(12, 'Product 12', 1950),
(13, 'Product 13', 1450),
(14, 'Product 14', 2500),
(15, 'Product 15', 1100),
(16, 'Product 16', 2800),
(17, 'Product 17', 1750),
(18, 'Product 18', 3200),
(19, 'Product 19', 900),
(20, 'Product 20', 2100),
(21, 'Product 21', 1250),
(22, 'Product 22', 2600),
(23, 'Product 23', 1550),
(24, 'Product 24', 3400),
(25, 'Product 25', 1000),
(26, 'Product 26', 2300),
(27, 'Product 27', 1400),
(28, 'Product 28', 2900),
(29, 'Product 29', 1650),
(30, 'Product 30', 3600),
(31, 'Product 31', 1150),
(32, 'Product 32', 2400),
(33, 'Product 33', 1500),
(34, 'Product 34', 3100),
(35, 'Product 35', 1850),
(36, 'Product 36', 3700),
(37, 'Product 37', 950),
(38, 'Product 38', 2250),
(39, 'Product 39', 1350),
(40, 'Product 40', 2800),
(41, 'Product 41', 1700),
(42, 'Product 42', 3900),
(43, 'Product 43', 1050),
(44, 'Product 44', 2450),
(45, 'Product 45', 1550),
(46, 'Product 46', 3300),
(47, 'Product 47', 1900),
(48, 'Product 48', 4100),
(49, 'Product 49', 1200),
(50, 'Product 50', 3500);


/*PERCENT_RANK = 
					RANK OF THE ROW -1 / TOTAL NUMBER OF ROW -1 */


SELECT
		ProductID,
        ProductName,
        SalesAmount,
					PERCENT_RANK() OVER (ORDER BY SalesAmount DESC) AS SALES_PERCENT,
                    RANK() OVER (ORDER BY SalesAmount DESC) AS RANK_S
FROM
	PRODUCTS;
    
    
-- NTILE()
use organisation;

CREATE TABLE EmployeeSales (
    EmployeeID INT,
    EmployeeName VARCHAR(50),
    SalesAmount INT
);

INSERT INTO EmployeeSales (EmployeeID, EmployeeName, SalesAmount)
VALUES
(1, 'Alice', 10000),
(2, 'Bob', 8500),
(3, 'Charlie', 7500),
(4, 'David', 6000),
(5, 'Eva', 11000),
(6, 'Frank', 4500),
(7, 'Grace', 3000),
(8, 'Hank', 4000),
(9, 'Ivy', 8000),
(10, 'Jack', 9500);


select
		EmployeeID,
        EmployeeName,
        SalesAmount,
					NTILE(4) OVER (ORDER BY SALESAMOUNT DESC) AS PERFORMANCE_TABLE
		FROM
			EMPLOYEESALES;
            
            
-- VALUES

     -- LAG()
     
     
CREATE TABLE EmployeeSalary (
    EmployeeID INT,
    EmployeeName VARCHAR(50),
    Salary DECIMAL(10,2),
    Year INT
);



INSERT INTO EmployeeSalary (EmployeeID, EmployeeName, Salary, Year)
VALUES
(1, 'Alice', 5000.00, 2023),
(1, 'Alice', 5500.00, 2024),

(2, 'Bob', 4500.00, 2023),
(2, 'Bob', 4800.00, 2024),

(3, 'Charlie', 4000.00, 2023),
(3, 'Charlie', 4200.00, 2024),

(4, 'David', 4600.00, 2023),
(4, 'David', 4700.00, 2024),

(5, 'Eva', 5200.00, 2023),
(5, 'Eva', 5400.00, 2024);


SELECT *,
		LAG(SALARY)OVER(PARTITION BY EmployeeID ORDER BY YEAR) AS PREVIOUSYEARSALARY,
        SALARY - LAG(SALARY)OVER(PARTITION BY EmployeeID ORDER BY YEAR) AS SALARYCHANGE
	FROM
        EMPLOYEESALARY;

-- LEAD()

USE MARKET_DATA;


CREATE TABLE ProductSales (
    ProductID INT,
    ProductName VARCHAR(50),
    SaleAmount DECIMAL(10,2),
    SaleDate DATE
);

INSERT INTO ProductSales
(ProductID, ProductName, SaleAmount, SaleDate)
VALUES
(1, 'Product A', 500.00, '2025-01-01'),
(2, 'Product A', 400.00, '2025-02-02'),
(3, 'Product A', 700.00, '2025-03-01'),
(4, 'Product A', 500.00, '2025-04-02');


SELECT
		productid,productname,saledate,saleamount,
        lead(saleamount)over(order by saledate) as next_sales              -- lead the next value
	from productsales;
    
 SELECT
		productid,productname,saledate,saleamount,
        lead(saleamount)over(order by saledate) as nextmonthsales,              -- lead the next value
        lead(saleamount)over(order by saledate) - saleamount as sales_difference
	from productsales;   
    
    
    
-- first value ()

use org;


CREATE TABLE EmployeeSalary (
    EmployeeID INT,
    EmployeeName VARCHAR(100),
    Salary DECIMAL(10,2),
    Year INT
);



INSERT INTO EmployeeSalary (EmployeeID, EmployeeName, Salary, Year)
VALUES
(1, 'Alice', 5000.00, 2021),
(1, 'Alice', 5500.00, 2022),
(1, 'Alice', 6000.00, 2023),
(1, 'Alice', 6500.00, 2024),
(1, 'Alice', 7000.00, 2025),

(2, 'Bob', 4500.00, 2023),
(2, 'Bob', 4800.00, 2024),

(3, 'Charlie', 4000.00, 2023),
(3, 'Charlie', 4200.00, 2024),

(4, 'David', 4600.00, 2023),
(4, 'David', 4700.00, 2024),

(5, 'Eva', 5200.00, 2023),
(5, 'Eva', 5400.00, 2024);


select
		EmployeeID,
        EmployeeName,
        Salary,
        Year,
			first_value(salary) over (partition by employeeid order by year)as first_salary
		from
            EmployeeSalary;
            
            
            
-- last_value()



select
		EmployeeID,
        EmployeeName,
        Salary,
        Year,
			last_value(salary) over (partition by employeeid order by year 
            rows between current row and unbounded following)as last_salary
		from
            EmployeeSalary;
            
            
select
		EmployeeID,
        EmployeeName,
        Salary,
        Year,
			last_value(salary) over (partition by employeeid order by year 
            rows between current row and unbounded following)as last_salary,
            last_value(salary) over (partition by employeeid order by year 
            rows between current row and unbounded following) - salary as difference
		from
            EmployeeSalary;

-- nth_value()

CREATE TABLE EmployeeDetails (
    EmployeeID INT,
    EmployeeName VARCHAR(100),
    Department VARCHAR(100),
    Salary DECIMAL(10,2),
    SalaryDate DATE
);

INSERT INTO EmployeeDetails
(EmployeeID, EmployeeName, Department, Salary, SalaryDate)
VALUES
(1, 'Alice', 'HR', 5000.00, '2025-01-01'),
(7, 'Grace', 'HR', 5500.00, '2025-01-07'),
(4, 'David', 'HR', 6000.00, '2025-01-04'),

(6, 'Frank', 'Engineering', 6500.00, '2025-01-06'),
(2, 'Bob', 'Engineering', 7000.00, '2025-01-02'),
(5, 'Eva', 'Engineering', 7500.00, '2025-01-05'),
(3, 'Charlie', 'Engineering', 8000.00, '2025-01-03'),
(8, 'Hank', 'Engineering', 8500.00, '2025-01-08');


select
		employeeid,
        employeename,
        department,
        salary,
        salarydate,
        nth_value(salary,2) over (partition by department order by salary desc
        rows between unbounded preceding and unbounded following) as nth
        from EmployeeDetails;