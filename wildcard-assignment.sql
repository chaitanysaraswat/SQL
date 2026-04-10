create database wildcard;
use wildcard;
CREATE DATABASE sales_db;
USE sales_db;

-- Salesman table
CREATE TABLE salesman (
    salesman_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    commission DECIMAL(3,2)
);

-- Customer table
CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    cust_name VARCHAR(50),
    city VARCHAR(50),
    grade INT,
    salesman_id INT
);

-- Orders table
CREATE TABLE orders (
    ord_no INT PRIMARY KEY,
    purch_amt DECIMAL(10,2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT
);

-- Employee table
CREATE TABLE employee (
    emp_idno INT PRIMARY KEY,
    emp_fname VARCHAR(50),
    emp_lname VARCHAR(50),
    emp_dept VARCHAR(50)
);

-- Dummy table for col1 queries
CREATE TABLE test_table (
    col1 VARCHAR(50)
);
INSERT INTO salesman VALUES
(5001, 'James', 'Paris', 0.14),
(5002, 'Nolan', 'Rome', 0.13),
(5003, 'Albert', 'London', 0.12),
(5004, 'Nick', 'Paris', 0.11),
(5005, 'Liam', 'Berlin', 0.15);

INSERT INTO customer VALUES
(3001, 'Alice', 'Paris', 100, 5001),
(3002, 'Bob', 'Rome', NULL, 5002),
(3003, 'Brian', 'London', 200, 5003),
(3007, 'Ben', 'Paris', NULL, 5001),
(3008, 'Ron', 'Rome', 300, 5002),
(3009, 'John', 'Berlin', 150, 5005);

INSERT INTO orders VALUES
(7001, 500, '2024-01-01', 3001, 5001),
(7002, 948.50, '2024-01-02', 3002, 5002),
(7003, 1500, '2024-01-03', 3003, 5003),
(7004, 1983.43, '2024-01-04', 3007, 5001),
(7005, 3000, '2024-01-05', 3008, 5002);

INSERT INTO employee VALUES
(1, 'John', 'Doe', 'IT'),
(2, 'Jane', 'Davis', 'HR'),
(3, 'Mike', 'Smith', 'Finance');

INSERT INTO test_table VALUES
('abc_123'),
('abc/123'),
('abc_/123'),
('abc%123'),
('abcdef');

-- 1. write a SQL query to find the details of those salespeople who come from the 'Paris' 
-- City or 'Rome' City. Return salesman_id, name, city, commission.
select name ,city,commission from salesman where city='Paris' or city='Rome';
-- 2.write a SQL query to find the details of the salespeople who come from either 'Paris' or 'Rome'. Return salesman_id, name, city, commission.
select name ,city,commission from salesman where city='Paris' or city='Rome';
-- 3. write a SQL query to find the details of those salespeople who live in cities other than Paris and Rome. Return salesman_id, name, city, commission.  
select salesman_id, name, city, commission from salesman where city!='Paris' and city='Rome';
-- 4. write a SQL query to retrieve the details of all customers whose ID belongs to any of the values 3007, 3008 or 3009. Return customer_id, cust_name, city, grade, and salesman_id.  
select customer_id, cust_name, city, grade,salesman_id from customer where customer_id in (3007,3008,3009);
-- 5. write a SQL query to find salespeople who receive commissions between 0.12 and 0.14 (begin and end values are included). Return salesman_id, name, city, and commission.  
select  salesman_id, name, city,commission from salesman where commission between 0.12 and 0.14;  
-- 6. write a SQL query to select orders between 500 and 4000 (begin and end values are included). Exclude orders amount 948.50 and 1983.43. Return ord_no, purch_amt, ord_date, customer_id, and salesman_id. 
select ord_no, purch_amt, ord_date, customer_id,salesman_id from orders where purch_amt between 500 and 4000 and purch_amt not in (948.50,1983.43) ;
-- 7. write a SQL query to retrieve the details of the salespeople whose names begin with any letter between 'A' and 'L' (not inclusive). Return salesman_id, name, city, commission. 
select salesman_id, name, city, commission  from salesman where name >'A' AND NAME<'L'; 

-- 8.write a SQL query to find the details of all salespeople except those whose names begin with any letter between 'A' and 'L' (not inclusive). Return salesman_id, name, city, commission.  
select salesman_id, name, city, commission  from salesman where NOT (name  >'A' AND NAME<'L'); 
-- 9.write a SQL query to retrieve the details of the customers whose names begins with the letter 'B'. Return customer_id, cust_name, city, grade, salesman_id.. 
select customer_id, cust_name, city, grade, salesman_id  from CUSTOMER where cust_name like 'B%'; 
-- 10. write a SQL query to find the details of the customers whose names end with the letter 'n'. Return customer_id, cust_name, city, grade, salesman_id.
select customer_id, cust_name, city, grade, salesman_id  from CUSTOMER where cust_name like '%n'; 
-- 11. write a SQL query to find the details of those salespeople whose names begin with ‘N’ and the fourth character is 'K'. Rests may be any character. Return salesman_id, name, city, commission. 
select salesman_id, name, city, commission  from salesman where name like 'N__K%'; 
select * from salesman;
-- 12.write a SQL query to find those rows where col1 contains the escape character underscore ( _ ). Return col1.
select  col1 from test_table where col1 like '%\_%'; 
-- 13. write a SQL query to identify those rows where col1 does not contain the escape character underscore ( _ ). Return col1.
select  col1 from test_table where col1 not like ('%\_%'); 
-- 14.write a SQL query to find rows in which col1 contains the forward slash character ( / ). Return col1.
select  col1 from test_table where col1 like ('%\/%'); 
-- 15. write a SQL query to identify those rows where col1 does not contain the forward slash character ( / ). Return col1.
select  col1 from test_table where col1 not like ('%\/%'); 
-- -- 16. write a SQL query to find those rows where col1 contains the string ( _/ ). Return col1.
select  col1 from test_table where col1  like ('%\_/%'); 

-- -- 17. write a SQL query to find those rows where col1 does not contain the string ( _/ ). Return col1.
select  col1 from test_table where col1  not like ('%\_/%');
-- -- 18. write a SQL query to find those rows where col1 contains the character percent ( % ). Return col1.
select  col1 from test_table where col1  like ('%\%%');
-- -- 19. write a SQL query to find those rows where col1 does not contain the character percent ( % ). Return col1.
select  col1 from test_table where col1  not like ('%\%%');
-- -- 20. write a SQL query to find all those customers who does not have any grade. Return customer_id, cust_name, city, grade, salesman_id.
select customer_id, cust_name, city, grade, salesman_id from customer where grade is null;
-- -- 21. write a SQL query to locate all customers with a grade value. Return customer_id, cust_name,city, grade, salesman_id.
select customer_id, cust_name,city, grade, salesman_id from customer where grade is not null;
-- -- 22. write a SQL query to locate the employees whose last name begins with the letter 'D'. Return emp_idno, emp_fname, emp_lname and emp_dept. 
select emp_idno, emp_fname, emp_lname ,emp_dept  from employee where emp_lname like ('D%');
select * from employee;