create database altertable;
use altertable;
-- Create 'customers' table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    address VARCHAR(100)
);

-- Create 'employees' table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age VARCHAR(10),  -- This will be modified later to INT
    salary DECIMAL(10, 2),
    department_id INT
);

-- Create 'contacts' table
CREATE TABLE contacts (
    contact_id INT PRIMARY KEY,
    name VARCHAR(50),
    address VARCHAR(100)  -- This will be renamed later to 'home_address'
);

-- Create 'departments' table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

-- Create 'students' table
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);

-- Create 'users' table
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50),
    email VARCHAR(100)  -- This will have a unique constraint added later
);

-- Create 'inventory' table
CREATE TABLE inventory (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    quantity INT  -- Default value will be set later
);

-- Create 'products' table
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(50),
    price DECIMAL(10, 2)
);

-- Create 'locations' table
CREATE TABLE locations (
    location_id INT,
    street_address VARCHAR(100),
    postal_code VARCHAR(20),
    city VARCHAR(50),
    state_province VARCHAR(50),  -- This will be renamed to 'state' later
    country_id VARCHAR(2),
    PRIMARY KEY (location_id)
);

-- Create 'job_history' table
CREATE TABLE job_history (
    employee_id INT,
    job_id VARCHAR(10),
    department_id INT,
    start_date DATE,
    end_date DATE
);

-- Create 'jobs' table
CREATE TABLE jobs (
    job_id VARCHAR(10) PRIMARY KEY,
    job_title VARCHAR(50),
    min_salary DECIMAL(10, 2),
    max_salary DECIMAL(10, 2)
);

-- 1. Write a query to add a new column named 'phone_number' of type VARCHAR(20) to a table named 'customers'.
alter table customers add column phone_number varchar(20);
select * from customers;
-- 2. Write a query to modify the data type of the column 'age' in a table named 'employees' to INT.
alter table employees modify age int;
-- 3. Write a query to rename the column 'address' to 'home_address' in a table named 'contacts'.
alter table contacts rename column address to home_address;
-- 4. Write a query to add a foreign key constraint named 'fk_department' to a column named 'department_id' in a table named 'employees', 
-- referencing the 'department_id' column in a table named 'departments'.

-- alter table departments add foreign key(fk_department) references(department_id)
-- 5. Write a query to drop the primary key constraint from a table named 'students'.
alter table students drop primary key;
-- 6. Write a query to add a unique constraint named 'uc_email' to a column named 'email' in a table named 'users'.
alter table users add constraint uc_email unique(email);
-- 7. Write a query to add a default value of '0' to a column named 'quantity' in a table named 'inventory'.
alter table inventory modify column  quantity int default 0;
-- 8. Write a query to modify the position of the column 'last_name' to be the first column in a table named 'customers'.
 alter table customers modify column last_name varchar(50) first;
 desc customers;
-- 9. Write a query to change the auto-increment value of a column named 'product_id' to start from 1001 in a table named 'products'.
alter table products  auto_increment=1001;
desc products;
-- 10. Write a query to add a check constraint named 'chk_salary' to a column named 'salary' in a table named 'employees', 
-- ensuring that the salary is greater than or equal to 2000.
alter table employees add constraint chk_salary check (salary>=2000);
use hr;
-- Based on hr database
-- 1. Write a SQL statement to rename the table countries to country_new.
alter table countries rename country_new;
select * from country_new;
-- 2. Write a SQL statement to add a column region_id to the table locations.
alter table locations add column region_id int;
-- 3. Write a SQL statement to add a column ID as the first column of the table locations.
alter table locations add column ID int first;
-- 4. Write a SQL statement to add a column region_id after state_province to the table locations.
alter table locations add column region_id1 int after state_province;
-- 5. Write a SQL statement to change the data type of the column country_id to integer in the table locations.
show tables;
desc locations;
alter table locations modify column country_id int;-- error
-- 6. Write a SQL statement to drop the column city from the table locations.
alter table locations drop column city;
-- 7. Write a SQL statement to change the name of the column state_province to state, keeping the data type and size same.
alter table locations change column STATE_PROVINCE  state varchar(30);
-- 8. Write a SQL statement to add a primary key for the columns location_id in the locations table.
alter table locations drop primary key, add column location_id int primary key;
-- 9. Write a SQL statement to add a primary key for a combination of columns location_id and country_id.
alter table locations drop  primary key ,add  primary key (location_id,country_id);
-- 10. Write a SQL statement to drop the existing primary from the table locations on a combination of columns location_id and country_id.
alter table locations drop primary key;
-- 11. Write a SQL statement to add a foreign key on the job_id column of the job_history table
-- referencing the primary key job_id of jobs table.
desc job_history;
alter table locations add column job_id int;
alter table locations add constraint foreign key(job_id) references job_history(job_id);
-- 12. Write a SQL statement to add a foreign key constraint named fk_job_id on the job_id column of the job_history table 
-- referencing the primary key job_id of the jobs table.
-- alter table locations add constraint fk_job_id foreign key references job_history(job_id) ; error 
ALTER TABLE locations
ADD CONSTRAINT fk_job_id
FOREIGN KEY (job_id)
REFERENCES job_history(job_id);
-- 13. Write a SQL statement to drop the existing foreign key fk_job_id from the job_history table on job_id column which is referencing the job_id of jobs table.
alter table locations drop foreign key fk_job_id;
-- 14. Write a SQL statement to add an index named indx_job_id on job_id column in the table job_history.
alter table job_history add  index indx_job_id(job_id);
-- 15. Write a SQL statement to drop the index indx_job_id from job_history table.
SET sql_mode = '';
alter table job_history drop index indx_job_id;
desc job_history;
-- 16. Write a query to change the length of the email column in the customers table to VARCHAR(150).
alter table customers modify column email varchar(150);
-- 17. Write a query to add a new column status of type VARCHAR(10) with a default value of 'active' to the employees table.
alter table employees add column type varchar(10);
-- 18. Write a query to drop the phone_number column from the customers table.
alter table customers add column phone_number int;
alter table customers drop column phone_number;
-- 19. Write a query to modify the department_name column in the departments table to ensure it cannot contain NULL values.
desc users;
show tables;
alter table departments modify department_name varchar(30) not null;
-- 20. Write a query to drop the UNIQUE constraint on the email column in the users table.

-- alter table users modify column 
use hr;
-- 21. Write a query to rename the inventory table to product_inventory.
create table inventory(
inentory_id int);
alter table inventory rename to product_inventory;
-- 22.Write a query to add a foreign key constraint on the employee_id column of the job_history table, referencing the employee_id column of the employees table, with ON DELETE CASCADE.
alter table job_history add constraint foreign key(employee_id) references employees(employee_id) on delete cascade;
-- 23.Write a query to change the default value of the status column in the employees table to 'inactive'.
desc employees;
alter table employees add column status varchar(30);
alter table employees modify column  status varchar(30) default'inactive';
-- 24.Write a query to drop the foreign key constraint named fk_department from the employees table.

alter table employees drop constraint fk_department;
-- 25.Write a query to move the salary column to be after the last_name column in the employees table.
alter table employees modify  salary int after last_name;
-- 26.Write a query to remove the default value from the status column in the employees table.
desc users;
alter table employees modify column status varchar(30);
-- 27. Write a query to rename the uc_email constraint on the email column in the users table to unique_email_constraint.
alter table users rename column uc_email  to unique_email_constraint;
-- 28.Write a query to disable the foreign key constraint fk_department on the employees table and then re-enable it.
SET FOREIGN_KEY_CHECKS=0;
SET FOREIGN_KEY_CHECKS=1;
-- 29.Write a query to change the age column in the employees table to SMALLINT and allow it to accept NULL values.
desc employees;
alter table employees 

