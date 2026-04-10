--  2 Which data type would you use to store: (a) a student age, (b) a 
-- product price, (c) a blog post body, (d) a yes/no flag? Write the type 
-- name only
--  3 Write a SELECT query to check the current date in MySQL. 1 SELECT 
-- CURDATE()
-- 4 Write a SELECT query that calculates 7 * 8 without using any table. 1 SELECT 7 * 8
-- 5 What is the maximum value that can be stored in a TINYINT 
-- UNSIGNED column?

select curdate();
select 7*8;
create table maximum_value(id int);

create table student(
student_id int auto_increment primary key,
first_name varchar(60),
last_name varchar(60),
age tinyint unsigned not null,
city varchar(80)default "mumbai",
enroll_date DATE not null,
is_active bool default true);
insert student(student_id,first_name,last_name,age,city,enroll_date,is_active)values
(8,"nitin","Saraaswat",23,"Agra","2021-02-21",true),
(2,"Shachi","Saraswat",13,"mumbai","2021-02-23",true),
(3,"mamta","Saraswat",14,"mumbai","2021-02-23",true),
(4,"gopal","Saraswat",15,"delhi","2021-02-23",false);

select* from student;
select first_name,last_name,city from student;
select * from student where city="mumbai";
select * from student where is_active=true order by last_name;
select * from student where age>20 and age<25;
select * from student order by enroll_date asc;
select count(*) from student where is_active=true;
update student set  student_id = "Delhi" where student_id = 1;
-- 21:45:40	update student set  student_id = "Delhi" where student_id = 1	Error Code: 1366. Incorrect integer value: 'Delhi' for column 'stu-- dent_id' at--  row 1	0.000 sec

-- Part C — Products Table (VARCHAR, DECIMAL, SMALLINT, INT)

select * from products(
product_id INT primary key AUTO_INCREMENT,
 name VARCHAR (150) NOT NULL, 
description VARCHAR (300),
 price DECIMAL (10,2) NOT NULL, 
stock_qty SMALLINT UNSIGNED DEFAULT 12000 ,
category VARCHAR (60)
);

insert into products(product_id,name,description,price,stock_qty,category)
values(141,"chaitany","it is a good product",1234545,0,"fryfan"),
(144,"sheetal","it is a good product",0,124,"pan"),
(143,"kirti","it is a nice product",12345.45,125,"spoon"),
(142,"harshit","it is a good product",12345.45,126,"cuttlery");

SELECT * from products where price  between 100 and 5000;
select name,price from products order by price desc limit 3;
Select avg(price) from products;

-- Part D — Library Books Table (YEAR, DATE, CHAR, SMALLINT)


Create table books(book_id INT Primary key AUTO_INCREMENT,
 title VARCHAR (200) NOT NULL,
 author VARCHAR (100) NOT NULL, 
isbn CHAR(13) NOT NULL UNIQUE , 
pub_year YEAR, 
total_copies TINYINT UNSIGNED DEFAULT 1, 
available_copies TINYINT UNSIGNED DEFAULT 1);

INSERT INTO books (title, author, isbn, pub_year, total_copies, available_copies) VALUES
('The Great Gatsby', 'F. Scott Fitzgerald', '9780743273565', 1925, 5, 2),
('A Brief History of Time', 'Stephen Hawking', '9780553380163', 1988, 3, 3),
('The Midnight Library', 'Matt Haig', '9780525559474', 2020, 2, 0),
('Project Hail Mary', 'Andy Weir', '9780593135204', 2021, 4, 4);

select * from books where pub_year>2010 order by pub_year;

select *from books where available_copies=0;
Select title ,(total_copies-available_copies) as checked_out from books;

-- Part E — Daily Attendance Table (TIME, DATE, BOOLEAN)
Create table attendance (att_id INT Primary key AUTO_INCREMENT, 
emp_name VARCHAR (100) NOT NULL,
 att_date DATE NOT NULL,
 clock_in TIME,
 clock_out TIME,
 is_present BOOLEAN DEFAULT TRUE);
 
 insert into attendance(att_id,emp_name,att_date,clock_in,clock_out,is_present)values
 (3,"chaitany","2026-04-06","05:03:56","09:03:34",TRUE),
 (2,"shachi","2021-03-27","05:03:56","09:03:34",FALSE);
 select * from attendance where att_date=curdate();
 select emp_name ,timediff(clock_out,clock_in) as hours_worked from attendance where att_date=curdate();
 select * from attendance where clock_in<"09:00:00";


-- SECTION 2 — INTERMEDIATE LEVEL   [ 40 Marks ] 
-- Q1 — Order Management (ENUM, DECIMAL, DATETIME, TIMESTAMP) 
  Create table orders( order_id INT Primary key AUTO_INCREMENT, 
customer VARCHAR (100), 
status ENUM ('pending','confirmed','shipped','delivered','cancelled') DEFAULT 'pending', 
total DECIMAL (12,2),
 scheduled_at DATETIME , 
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);
 
 insert into orders values(1,"chaitany",'cancelled',1200.00,"2021-02-21","2021-02-16","2021-02-21");
 
 