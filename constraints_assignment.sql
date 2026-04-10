Create table students(
id INT, 
name VARCHAR(30) NOT NULL,
age INT default 18
);-- q1

 Insert into students values(1, NULL, 20); -- q2
-- 09:24:23	Insert into students values(1, NULL, 20)	Error Code: 1048. Column 'name' cannot be null	0.016 sec

 Insert into students(id,name) values(2, 'Ravi');-- q3
  
INSERT INTO students (id) VALUES (3);-- q4

Alter table students modify age int default 21;-- q5

alter table students modify  name varchar(20);-- q6

Create  table department (dept_id INT PRIMARY KEY, dept_name VARCHAR(20));-- q7

 Insert into department values (1,'IT'),(1,'HR');-- q8
 -- 09:51:12	Insert into department values (1,'IT'),(1,'HR')	Error Code: 1062. Duplicate entry '1' for key 'department.PRIMARY'	0.000 sec

Alter table students modify age int primary key default 21;-- q9

Create table enrollment( 
student_id int ,
course_id int,
course_name varchar(20),
primary key (student_id, course_id));-- q10
 
insert into enrollment(course_id,course_name)  values(101,"DBMS");-- q11
insert into enrollment values(101,"DBMS");
-- 10:05:47	insert into enrollment(course_id,course_name)  values(101,"DBMS")	Error Code: 1364. Field 'student_id' doesn't have a default value	0.000 sec

Create table users (
user_id INT PRIMARY KEY AUTO_INCREMENT,
 email VARCHAR(20) UNIQUE
 );-- q12

 Insert into users (email) values ('abc@mail.com');-- 13
select * from users;

select * from enrollment;

INSERT INTO users (email) VALUES (NULL);-- q 14
INSERT INTO users (email) VALUES (NULL);

Create table products (ski varchar(20) UNIQUE,
region varchar(20) unique);-- q15

Insert into products(ski, region) values ('AI','US');
insert into products(ski, region) values ('AI','US');

-- 10:25:45	insert into products(ski, region) values ('AI','US')	Error Code: 1062. Duplicate entry 'AI' for key 'products.ski'	0.016 sec

select * from products;

 Create  table department(
 dept_id int primary key
 );
 create table employee (
 emp_id int,
 dept_id int ,
 foreign key (dept_id) references department(dept_id));

