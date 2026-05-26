use de_project;

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL
);

INSERT INTO customers (first_name, last_name, email, city)
VALUES
('John', 'Doe', 'john@example.com', 'New York'),
('Jane', 'Smith', 'jane.smith@example.com', 'Los Angeles'),
('Michael', 'Brown', 'michael.brown@example.com', 'Chicago'),
('Emily', 'Johnson', 'emily.johnson@example.com', 'Houston'),
('Robert', 'Green', 'robert.green@example.com', 'Phoenix');


select * from customers;


-- creating index 

create index idx_email on customers (email);

select * from customers where email = 'jane.smith@example.com';



-- explain concept

explain
select *                                         -- execution plan 
		from customers 
where 
		email = 'jane.smith@example.com'; 
        
        
-- explain analyze

explain analyze
select *                                         -- execute + plan + realtime + cost 
		from customers                           -- '-> Index lookup on customers using idx_email (email=\'jane.smith@example.com\')  (cost=0.35 rows=1) (actual time=0.0407..0.0435 rows=1 loops=1)\n' 
where 
		email = 'jane.smith@example.com'; 
        
        
-- explain json


explain format = json
select *                                          
		from customers                      
where 
		email = 'jane.smith@example.com'; 
        
/*        
output in json
  '{\n  \"query_block\": {\n    \"select_id\": 1,\n    \"cost_info\": {\n      \"query_cost\": \"0.35\"\n    },\n    \"table\": {\n      \"table_name\": \"customers\",\n      \"access_type\": \"ref\",\n      \"possible_keys\": [\n        \"idx_email\"\n      ],\n      \"key\": \"idx_email\",\n      \"used_key_parts\": [\n        \"email\"\n      ],\n      \"key_length\": \"402\",\n      \"ref\": [\n        \"const\"\n      ],\n      \"rows_examined_per_scan\": 1,\n      \"rows_produced_per_join\": 1,\n      \"filtered\": \"100.00\",\n      \"cost_info\": {\n        \"read_cost\": \"0.25\",\n        \"eval_cost\": \"0.10\",\n        \"prefix_cost\": \"0.35\",\n        \"data_read_per_join\": \"1K\"\n      },\n      \"used_columns\": [\n        \"customer_id\",\n        \"first_name\",\n        \"last_name\",\n        \"email\",\n        \"city\"\n      ]\n    }\n  }\n}'
  */
