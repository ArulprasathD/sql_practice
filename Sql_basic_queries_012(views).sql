use org;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    hire_date DATE,
    job_title VARCHAR(50),
    salary DECIMAL(10,2)
);

INSERT INTO employees (employee_id,first_name,last_name,email,hire_date,job_title,salary)
VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '2022-05-01', 'Software Engineer', 85000.00),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '2023-03-15', 'Data Scientist', 92000.00),
(3, 'Alice', 'Johnson', 'alice.johnson@example.com', '2024-05-01', 'Engineer', 95000.00),
(4, 'Mark', 'Taylor', 'mark.taylor@example.com', '2022-11-15', 'Manager', 100000.00),
(5, 'Gowtham', 'SB', 'gowtham.sb@example.com', '2022-11-15', 'Data Engineer', 100000.00),
(6, 'Peter', 'SB', 'peter.sb@example.com', '2022-11-15', 'Data Engineer', 120000.00);


select * from employees;

-- VIEWS

SELECT
     EMPLOYEE_ID,
     CONCAT(FIRST_NAME,' ',LAST_NAME) AS NAME,
     SALARY
     FROM 
         EMPLOYEES
     WHERE SALARY > 90000;
     
CREATE VIEW HIGH_EARNERS AS
           SELECT
     EMPLOYEE_ID,
     CONCAT(FIRST_NAME,' ',LAST_NAME) AS NAME,
     SALARY
     FROM 
         EMPLOYEES
     WHERE SALARY > 90000;

SELECT * FROM HIGH_EARNERS;

/*AFTER INSERT THE VIEW CAN
 AUTOMATICALLY ACCESS THE LAST INDEX*/

INSERT INTO employees (employee_id,first_name,last_name,email,hire_date,job_title,salary)
VALUES
(7, 'Peter', 'SB', 'peter.sb@example.com', '2022-11-15', 'Data Engineer', 140000.00);

SELECT * FROM HIGH_EARNERS;


CREATE VIEW DETAILS AS
     SELECT 
           EMPLOYEE_ID AS ID,
		   UPPER(CONCAT(FIRST_NAME," ",LAST_NAME)) AS NAME,
           LOWER(EMAIL) AS EMAIL
     FROM
           EMPLOYEES;
           
           
SELECT * FROM DETAILS;

/*DELETE FROM EMPLOYEES WHERE EMPLOYEE_ID = 5;*/

UPDATE EMPLOYEES SET FIRST_NAME = 'MAXXI' WHERE EMPLOYEE_ID = 7; 
UPDATE EMPLOYEES SET LAST_NAME = 'S' WHERE EMPLOYEE_ID = 7;
 