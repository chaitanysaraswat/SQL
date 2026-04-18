-- ==================== 1stv ===================
CREATE TABLE statement(
task_id INT Primary Key Auto_Increment, task_name VARCHAR(30) NOT NULL,
 due_date DATE
)ENGINE=InnoDB;
 INSERT INTO STATEMENT(task_name,due_date) VALUES ('Data Cleaning', '2025-03-01')
,('Model Training', '2025-03-15');
set sql_safe_update=0;
update statement set task_name = 'ML Training' where task_name = 'Model Training';

-- Retrieve all tasks where task_name starts with 'D'.
select task_name from statement where task_name like 'D%';


-- =============================== 2nd question =================
-- Q2. DDL & DML Operations (2 Marks)
-- a) Add a column:
--  profit_margin DECIMAL(5,2) NOT NULL DEFAULT 0.00
--  to the products table.
-- Then update it to 20.00 for all products where productLine = 'Classic Cars'.

-- b) Perform the following on customers table:
-- Add column: contact_name VARCHAR(120)
-- Populate using CONCAT(contactFirstName, ' ', contactLastName)
alter table products add column profit_margin DECIMAL(5,2) NOT NULL DEFAULT 0.00;
update products set profit_margin=20.0 where productLine = 'Classic Cars';

alter table customers add column contact_name VARCHAR(120);
update customers set contact_name=CONCAT(contactFirstName, ' ', contactLastName);
-- ==================================
-- Q3. Aggregation & Joins (4 Marks)
-- List the following for all orders placed in February 2005:
-- orderNumber
-- customer_name (use CONCAT)
-- total_quantity
-- total_amount
-- Order the result by total_quantity (descending).
select o.orderNumber,concat(c.contactFirstName, ' ', c.contactLastName) AS customer_name,sum(od.quantityOrdered) AS total_quantity,
sum(od.quantityOrdered * od.priceEach) AS total_amount
from orders o join customers c on c.customerNumber = o.customerNumber
join orderdetails od on od.orderNumber = o.orderNumber
where month(o.orderDate) = 2 and year(o.orderDate) = 2005
group by o.orderNumber, customer_name
order by total_quantity desc;

-- ===================================
-- Q4. Analytical Query (3 Marks)
-- Find the top 5 products by total quantity sold.
-- Display:
-- productCode
-- productName
-- total_quantity
-- Break ties using higher revenue.

select p.productCode,p.productName,sum(od.quantityOrdered)  total_quantity,sum(od.quantityOrdered * od.priceEach) as total_revenue
from products p
join orderdetails od on p.productCode = od.productCode
group by p.productCode, p.productName
order by total_quantity desc,total_revenue desc
limit 5;




-- ==========================================
-- Q5. Trigger (6 Marks)
-- Create a BEFORE UPDATE trigger on products such that:
-- If MSRP < buyPrice, automatically set MSRP = buyPrice * 1.10


delimiter $$
create trigger productstrigger
before update on products
for each row
begin
if new.MSRP<new.buyPrice then set  new.MSRP = new.buyPrice * 1.10;
end if;
end $$
delimiter ;
-- ==================================================
-- Q6. Stored Procedure (5 Marks)
-- Write a stored procedure:
-- get_customer_orders(p_customer_id INT)
-- It should return:
-- orderNumber
-- orderDate
-- status
-- total_amount (calculated)
-- Sorted by most recent orders first

-- Also show how to call it for:
-- customerNumber = 112

delimiter $$
create procedure  get_customer_orders(p_customer_id INT)
begin
 select o.orderNumber,o.orderDate,status,(od.quantityOrdered*od.priceEach)total_amount
 from orders o join orderdetails od on od.orderNumber=o.orderNumber where o.customerNumber=p_customer_id  order by o.orderDate;
end $$
delimiter ;
call  get_customer_orders(112);



-- ===================================================
-- Q7. Function (5 Marks)
-- Create a deterministic function:
-- fn_total_quantity(p_orderNumber INT)
-- Return total quantity using:
-- SUM(quantityOrdered)
-- Demonstrate usage:
-- SELECT orderNumber, fn_total_quantity(orderNumber)
-- FROM orders;

delimiter $$
create function  fn_total_quantity(p_orderNumber INT)
returns int
deterministic
begin 
declare total_quantity int;
select  SUM(od.quantityOrdered) into total_quantity from orderdetails od join orders o on o.orderNumber=od.orderNumber where od.orderNumber=p_orderNumber;
return total_quantity;
end $$
delimiter ;
select fn_total_quantity(10100);


-- ====================================================================
-- Q8. CTE + Window Function (5 Marks)
-- Using a CTE + Window Function, rank customers by total payments made.
-- Output:
-- customerNumber
-- customer_name
-- total_payment
-- rank
-- Rank 1 = highest payment
with cte1 as (
select c.customerNumber,
c.customerName ,
p.amount as total_payment,
rank()over(order by p.amount) rankbypayment 
from customers c 
join payments p 
on p.customerNumber=c.customerNumber)
select * from cte1;

-- ====================================================
-- Q9. (4 Marks)
-- Write a query to display:
-- orderNumber
-- orderDate
-- customer_name
-- total_products
-- Only include orders having total quantity greater than 100
-- Order result by orderDate.

select o.orderNumber,o.orderDate,concat(c.contactFirstName, ' ', c.contactLastName) AS customer_name,sum(od.quantityOrdered) AS total_products
from orders o
join customers c on c.customerNumber = o.customerNumber
join orderdetails od on od.orderNumber = o.orderNumber
group by o.orderNumber, o.orderDate, customer_name
having sum(od.quantityOrdered)>100
order by o.orderDate;