use de_project;

CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    position VARCHAR(50),
    salary DECIMAL(10,2)
);

CREATE TABLE contractors (
    contractor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    position VARCHAR(50),
    hourly_rate DECIMAL(10,2)
);

CREATE TABLE contractors1 (
    contractor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50)
);

INSERT INTO employees (first_name, last_name, position, salary)
VALUES
('Alice', 'Smith', 'Developer', 70000.00),
('Bob', 'Johnson', 'Developer', 75000.00),
('Charlie', 'Lee', 'Manager', 90000.00);

INSERT INTO contractors (first_name, last_name, position, hourly_rate)
VALUES
('Dave', 'Williams', 'Developer', 40.00),
('Eve', 'Brown', 'Tester', 35.00),
('Bob', 'Johnson', 'Developer', 45.00);

INSERT INTO contractors1 (first_name)
VALUES
('Dave'),
('Eve'),
('Bob');



select * from employees;
select * from contractors;
select * from contractors1;
delete from contractors where contractor_id in(6,7,8,9);

-- union all

select * from employees                               --  same columns and acptable datatypes 
union all
select * from contractors;

select first_name,last_name from employees
union all
select first_name,last_name from contractors;

-- union 


select * from employees
union 
select * from contractors;


select first_name,last_name,position from employees
union                                                                 -- remove duplicates based on coloum names 
select first_name,last_name,position from contractors;


select first_name from employees
unionf
select first_name from contractors
union
select first_name from contractors1;