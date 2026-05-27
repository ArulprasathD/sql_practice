use worker_details;
drop table orders;
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT,
    order_date DATE NOT NULL,
    customer_name VARCHAR(50),
    amount DECIMAL(10,2),
    PRIMARY KEY (order_id, order_date)
)

-- partition by range

partition by range (year(order_date))(
   partition  p_before values less than (2020),
   partition p_2021 values less than (2021),
   partition  p_2022 values less than (2022),
   partition  p_2023 values less than (2023),
   partition  p_future values less than maxvalue
   
);


INSERT INTO orders (order_date, customer_name, amount)
VALUES
('2019-05-10', 'Alice', 100.00),
('2020-01-15', 'Bob', 200.50),
('2020-12-01', 'Charlie', 300.00),
('2021-07-20', 'Diana', 150.75),
('2022-03-02', 'Edward', 500.00),
('2025-06-18', 'FutureMan', 9999.99);



select * from orders;


select *from orders where order_date = '2022-03-02';


select *from information_schema.partitions
where table_schema = 'worker_details' and table_name = 'orders';


-- partition by list

-- if it is varchar add the name list coloumn


CREATE TABLE employees1 (
    employee_id INT AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    PRIMARY KEY (employee_id, department)
)

partition by list columns (department)(
     partition p_sales values in ('sales'),
     partition p_hr values in 	('hr'),
     partition p_engineering values in ('Engineering','DevOps'),
     partition p_others values in ('finance','marketing','operations')     
);




INSERT INTO employees1 (first_name, last_name, department)
VALUES
('Alice', 'Smith', 'Sales'),
('Bob', 'Johnson', 'HR'),
('Charlie', 'Lee', 'Engineering'),
('Diana', 'Lopez', 'DevOps'),
('Eve', 'Turner', 'Marketing');

select * from employees1;


select * from employees1 where department = 'hr';

select * from employees1 where department in ('sales','hr');

select *from information_schema.partitions
where table_schema = 'worker_details' and table_name = 'employees1';

explain format = json
select * from employees1 where department in('sales','hr');


-- hash

CREATE TABLE sensor_data (
sensor_id INT NOT NULL,
reading_time DATETIME NOT NULL,
reading_value DECIMAL(10,2),
PRIMARY KEY (sensor_id, reading_time)
)

partition by hash(sensor_id)
partitions 2;


INSERT INTO sensor_data (sensor_id, reading_time, reading_value)
VALUES
(101, '2025-01-01 10:00:00', 23.50),
(102, '2025-01-01 10:05:00', 24.10),
(103, '2025-01-01 10:10:00', 22.75),
(104, '2025-01-01 10:15:00', 25.00),
(105, '2025-01-01 10:20:00', 20.00),
(106, '2025-01-01 10:25:00', 21.60);


select * from sensor_data where sensor_id = 101;


