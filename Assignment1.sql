-- 1.	Create a table students_basic with the following columns:
-- ○	id (integer)
-- ○	name (varchar 50)
-- ○	age (integer)
-- INSERT INTO table_name (column1, column2, column3)
-- VALUES 
--     (value1a, value2a, value3a),
--     (value1b, value2b, value3b),
--     (value1c, value2c, value3c);
CREATE TABLE STUDENT_BASIC(ID INT,name VARCHAR(50),AGE INT);
insert INTO STUDENT_BASIC (ID ,NAME1 ,AGE ) VALUES(1,'CHAITANY',10),(2,'SARASWAT',11),(3,'SACHIN',12),(4,'SARASWAT',10),(4,'SHACHI',10);
select * FROM STUDENT_BASIC;

-- Create a table products_basic with:
-- product_id (int)
-- product_name (varchar 100)
-- price (decimal 8,2)

CREATE TABLE PRODUCT_BASIC(
product_id int,
product_name varchar (100),
price decimal( 8,2));

INSERT INTO PRODUCT_BASIC VALUES(1,"SAMSUNG",9000.00),(2,"REDMI",4000.00),(3,"OPPO",7000.00);
SELECT * FROM PRODUCT_BASIC;

-- 6.	Create a table employees_basic with:
-- ○	emp_id (int)
-- ○	emp_name (varchar 50)
-- ○	joining_date (date)
-- 7.	Insert at least 4 employees and display only names and joining dates.

CREATE TABLE EMPLOYEE_BASIC (
emp_id int,
emp_name varchar (50),
joining_date date);

INSERT INTO EMPLOYEE_BASIC VALUES
(1,"CHAITANY","2021-08-26"),
(2,"SARASWAT","2021-08-26"),
(3,"SHACHI","2021-08-26"),
(4,"SARASWAT1","2021-08-26");
SELECT emp_name,joining_date FROM EMPLOYEE_BASIC;

CREATE TABLE HEALTHCARE1(
EMP_ID varchar(50),
EM_NAME CHAR(30));

INSERT INTO HEALTHCARE1 values
('ABC1','CHA'),
("ASD2",'SAR'),
("FGH3",'SHA'),
("LKJ4",'SAR');


-- 9.	Create table flags with a BOOLEAN column. Insert TRUE/FALSE values and display results.

CREATE TABLE  TO_CHECK_LOAN(
CUSTOMERS VARCHAR(50),
LOAN_APPROVED BOOL);
INSERT INTO TO_CHECK_LOAN VALUES("CHAITANY",TRUE),("DEVDATTA",FALSE);
SELECT * FROM TO_CHECK_LOAN;
-- 10.	Create a table numbers_test using TINYINT, SMALLINT, and BIGINT. Insert sample values.
CREATE TABLE numbers_test(a TINYINT,b SMALLINT,c BIGINT);

INSERT INTO numbers_test VALUES(125,2333,67867);
SELECT * FROM numbers_test;

 
-- 11 Create  table students with:
-- id (int primary key)
-- name (varchar 100 not null)
-- marks (float)
-- grade (char 2)
-- 12 Insert at least 6 records with varying marks.
-- 13 Select students scoring more than 75 marks.
use day_3;
create  table students1(
id int primary key,
name1 varchar (100) not null,
marks float,
grade char (2));

insert into students values(1,"chaitany",78,'B'),
(2,"sujal",84,'B'),
(3,"devdatta",77,'B'),
(4,"sachin",78,'B'),
(5,"soham",78,'B'),
(6,"siddhi",78,'B');
select * from students1;
select * from students1 where marks>75;

-- 14.	Create a table orders with:
-- ●	order_id (int)
-- ●	order_date (datetime)
-- ●	amount (decimal 10,2)
-- 15.	Insert records with different timestamps and query only date part.

create table orders (
order_id int,
order_date datetime,
amount decimal 
(10,2));
insert into orders values(1,"2012-01-1",1234),
(2,"2021-02-21",1234);
select * from orders;

-- 16.	Create a table users with ENUM for roles ("admin", "user", "guest"). Insert records.
-- 17.	Try inserting a value outside ENUM and observe behavior.
create table  profile(
emp_id int,
emp_name char(20),
roles enum('admin','user','guest'));
insert into profile values(1,"chaitany",'admin'),(2,"bhushan",'guest');
insert into profile values(1,"chaitany",'head');
insert into profile values(1,"chaitany",'');



-- 18.	Create a table binary_test using BLOB and TEXT. Insert sample data.
create table binary_test(
emp_id int,
image blob);

insert into binary_test values(1,load_file("C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Screenshot (15)_1_11zon.png"));
select * from binary_test;
-- 19.	Create a table salary_test using DECIMAL and FLOAT. Insert same values and compare.
-- 20.	Write a query to select records where amount is between 1000 and 5000.

create table salary_test(
emp_id int,
basic_salary decimal,
gross_salary  float );
insert into salary_test values(3,1200.123456,6000.123456),(2,1000.123456,2000.123456);

select * from  salary_test; 	
select * from salary_test where basic_salary>1000 and basic_salary<5000;
-- 21.	Create a table complex_types with:
-- ●	id (int)
-- ●	json_data (JSON)
-- 22.	Insert structured JSON data and query specific keys.


create table complex_types(
id int,
json_data json);
insert into complex_types values(1,'{"car":["red","blue"]}');
select * from complex_types;


-- 23.	Create a table date_test with DATE, TIME, DATETIME, TIMESTAMP. Insert values and compare outputs.

create table date_test(
date1 date,
time1 time,
datetime1 datetime,
timestamp1 timestamp
);
insert into date_test values
('2024-01-01','12:30:00','2024-01-01 12:30:00',now());
select * from date_test;

-- 24.	Create a table auto_test with AUTO_INCREMENT primary key. Insert records without specifying id.
create table auto_test(
id int PRIMARY KEY AUTO_INCREMENT ,
emp_name char(30),
salary int 
);
insert into auto_test(emp_name,salary) values("devdatta",12000); 
select * from auto_test;
-- 25.	Create a table precision_test and test overflow in DECIMAL.
create table precision_test(
basic_salary int,
gross_salary decimal(4,2)
);
insert into precision_test values(12000,12000.123);
insert into precision_test values(1200,12.10);
    
-- 26.	Create a table string_test and test max length for VARCHAR.
create table string_test(
emp_id varchar(65355));
-- 17:24:46	create table string_test( emp_id varchar(65355))	Error Code: 1074. Column length too big for column 'emp_id' (max = 16383); use BLOB or TEXT instead	0.000 sec


-- 27.	Create a table null_test with NOT NULL constraint. Try inserting NULL values.
use day_3;
create table null_test(
id int primary key auto_increment,
salary int not null);

insert into null_test(salary) values(12000);
select * from null_test; 
-- 28.	Create a table default_test with DEFAULT values and test insert behavior.
create table default_test(
name1 char(20),
city char(20) default "agra"
);
insert into default_test(name1) values("chaitany");
select * from default_test;
-- 29.	Create a table mixed_types combining INT, FLOAT, VARCHAR, DATE, and BOOLEAN. Insert and query based on multiple conditions.
create table mixed_types(
customer_id int,
customer varchar(30),
loan float,
date1 timestamp,
loan_approved bool);
insert into mixed_types values(1,"abc123",1234.123,"2021-09-01",true);
Select * from mixed_types;
-- 30.	Create a table where incorrect datatype insertion is attempted (e.g., string in INT). Observe and document behavior.
create table testing(
customer_id int,
customer varchar(30),
name1 char(30),
loan float,
date1 timestamp,
loan_approved bool);
insert into testing values("abc","abc123",123,1234.123,"2021-09-01",True);
-- 18:47:36	insert into testing values("abc","abc123",123,1234.123,"2021-09-01",True)	Error Code: 1366. Incorrect integer value: 'abc' for column 'customer_id' at row 1	0.000 sec

insert into testing values(1,"abc123",123,1234.123,"2021-09-01",True);
Select * from testing;




   