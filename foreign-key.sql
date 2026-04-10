create database assignment3;
USE assignment3;
-- Q1
-- create database assignment3;
Create table authors
(
author_id INT Primary Key Auto_Increment,
author_name VARCHAR(50)
);
-- Q2.
 Create table books(
book_id INT Primary Key Auto_Increment,
book_name VARCHAR(50),
author_id int,
Foreign Key (author_id) references authors(author_id)
ON DELETE CASCADE ON UPDATE CASCADE
);
-- q3
Create table members(
member_id INT Primary Key Auto_Increment,
member_name VARCHAR(50));
-- q4

Create table issued_books(
issue_id INT Primary Key Auto_Increment,
book_id INT, 
member_id INT, 
foreign key (book_id) references books(book_id)ON DELETE SET NULL ,
Foreign Key(member_id) references members(member_id)ON DELETE RESTRICT
);

INSERT INTO authors (author_name) VALUES 
('Chetan Bhagat'),
('J.K. Rowling'),
('George Orwell');

INSERT INTO books (book_name, author_id) VALUES 
('Five Point Someone', 1),
('2 States', 1),
('Harry Potter and the Sorcerer''s Stone', 2),
('Harry Potter and the Chamber of Secrets', 2),
('1984', 3);
INSERT INTO members (member_name) VALUES 
('Rahul Sharma'),
('Priya Verma'),
('Amit Singh');

INSERT INTO issued_books (book_id, member_id) VALUES 
(1, 1),
(2, 2),
(3, 3),
(5, 1);
select * from issued_books;
-- 22:35:36	INSERT INTO issued_books (book_id, member_id) VALUES  (1, 1), (2, 2), (3, 3), (5, 1)	Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`hr`.`issued_books`, CONSTRAINT `issued_books_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE SET NULL)	0.000 sec
-- USE assignment3;
SELECT * FROM books;
-- 22:38:34	SELECT * FROM books LIMIT 0, 1000	Error Code: 1146. Table 'assignment3.books' doesn't exist	0.000 sec
-- Q7. Delete an author who has written multiple books.
select * from books;
delete from authors where author_id=1;-- 7
update authors set author_id=1 where author_id=3;-- 8
delete from books where book_id=4; -- 9
delete from issued_books where book_id=1;-- 11
insert into issued_books(book_id, member_id) values(999, 1);-- 12
update issued_books set book_id=4 where book_id=3; -- 13

-- 23:04:56	insert into issued_books(book_id, member_id) values(999, 1)	Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`assignment3`.`issued_books`, CONSTRAINT `issued_books_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE SET NULL)	0.015 sec


-- show indexes;
select * from issued_books;
select * from issued_books;

-- Section B: Hospital Database
-- 15
Create table doctors(
doctor_id int Primary Key Auto_increment,
doctor_name varchar(20),
specialization varchar(20));
-- 16
Create table patients_cascade(
patient_id int Primary Key auto_increment,
patient_name varchar(30),
doctor_id int,
Foreign Key(doctor_id) references doctors(doctor_id)ON DELETE CASCADE);

-- 17
INSERT INTO doctors (doctor_name, specialization) VALUES
('Dr. Sharma', 'Cardiologist'),
('Dr. Mehta', 'Dermatologist'),
('Dr. Khan', 'Neurologist');

INSERT INTO patients_cascade (patient_name, doctor_id) VALUES
('Aman', 1),
('Riya', 1),  
('Suresh', 2),
('Neha', 2),  
('Karan', 3);

delete from doctors where doctor_id=1;
update doctors set doctor_id=1 where doctor_id=3;-- 19
-- 00:26:50	update doctors set doctor_id=1 where doctor_id=3	Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`assignment3`.`patients_cascade`, CONSTRAINT `patients_cascade_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`) ON DELETE CASCADE)	0.015 sec



select * FROM DOCTORS;
select * FROM patients_cascade;


Create table courses(
course_id int Primary Key auto_increment,
course_name varchar(30));-- 20

Create table students_setnull(
student_id int primary key auto_increment,
student_name varchar(30),
course_id int ,
Foreign Key(course_id) references courses(course_id) 
ON DELETE SET NULL);-- 21

INSERT INTO courses (course_id, course_name) VALUES
(1, 'Computer Science'),
(2, 'Mathematics'),
(3, 'Physics');-- 22

INSERT INTO students_setnull (student_id, student_name, course_id) VALUES
(101, 'Amit', 1),
(102, 'Priya', 2),
(103, 'Rahul', 3),
(104, 'Sneha', 1);
-- 22
SELECT * FROM courses;
SELECT * FROM students_setnull;

-- Q23.Delete a course.
delete from courses where course_id=3; 
-- Q24. INSERT INTO students_setnull VALUES ('X', 999);
INSERT INTO students_setnull VALUES ('X', 999);-- error

-- Section D: E-Commerce Database
-- Table Creation
-- Q25.
-- Create categories:
-- category_id (Primary Key)
-- category_name

 Create table categories (category_id int Primary Key auto_increment,
category_name varchar(30));

-- Q26. (RESTRICT)
-- Create products_restrict:
-- product_id
-- product_name
-- category_id (Foreign Key)
-- ON DELETE RESTRICT

Create table products_restrict(
product_id int,
product_name varchar(30),
category_id int ,
Foreign Key (category_id) references categories(category_id)ON DELETE RESTRICT);

-- Q27.insert categories and products.
INSERT INTO categories (category_id, category_name) VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Groceries');

INSERT INTO products_restrict (product_id, product_name, category_id) VALUES
(101, 'Laptop', 1),
(102, 'Mobile', 1),
(103, 'T-Shirt', 2),
(104, 'Rice Bag', 3);
SELECT * FROM categories;
SELECT * FROM products_restrict;
-- Q28. Attempt to delete a category that is referenced by products.
delete from categories where category_id=1;
-- 01:01:17	delete from categories where category_id=1	Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`assignment3`.`products_restrict`, CONSTRAINT `products_restrict_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE RESTRICT)	0.016 sec

-- Q29. Delete dependent products and then delete the category.
delete from products_restrict where product_id=101; 
delete from categories where category_id=1;
-- 01:04:54	delete from products_restrict where product_id=101	Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.	0.000 sec

