-- get dept current budget sum sala check few of dept

delimiter $$

create function budget(dept_id int)
returns decimal(9,2)
deterministic
begin
    declare budget decimal(9,2);
    select sum(salary)  from employees where DEPARTMENT_ID=dept_id group by DEPARTMENT_ID; 
	return budget;
end$$

delimiter ;

select budget(90);

select budget(90);


-- get departmnet name and employe_name\

delimiter $$

create function first1(dept_name1 varchar(60),first_name1 varchar(60))
returns varchar(60)
deterministic
begin
    declare first_dept varchar(60);
    select group_concat(e.first_name,d.department_name) into first_dept
	from employees e
	join departments d 
	on e.DEPARTMENT_ID=d.department_id
	where department_name=dept_name1 and e.first_name=first_name1;
	return first_dept;
end ;;
$$

delimiter ;

select first1('Steven','Executive');


-- ===================stored procedure ========================
delimiter $$
create procedure read_all()
deterministic 
begin 
	select * from employees;
end$$

delimiter ;
call read_all();

-- ============================= multiple rows and columns fetched in procedure ===========
delimiter $$
create procedure read_all()
deterministic 
begin 
	select FIRST_NAME,d.department_name from employees e ;
end$$

delimiter ;
call read_all();

-- ==============================================================
delimiter $$
create procedure read_all_dept(in dept_id int)
deterministic 
begin 
	select * from employees where DEPARTMENT_ID=dept_id;
end$$

delimiter ;
call read_all_dept(80);

delimiter $$
create procedure read_all_emp(in emp_id int)
deterministic 
begin 
	select * from employees where EMPLOYEE_ID=emp_id;
end$$

delimiter ;
call read_all_emp(100);

create table student (id int,name1 varchar(20),marks int )
delimiter $$
create procedure insertion(in st_id int ,in name2 varchar(20),in marks int)
deterministic
begin
insert into student values(st_id ,name2 , marks);
end $$
delimiter ;
call insertion(11,'abc',70);
delimiter $$
create procedure updation(in name2 varchar(20))
deterministic
begin
 update student  set name1="cahit" WHERE NAME1=name2;
end $$
delimiter ;
call updation('abc');

-- ==================================================
delimiter $$
create procedure emp_detail(in emp_id int,out full_name varchar(50),out sal decimal(10,2) ,dept_name varchar(2))
deterministic 
begin 
	select concat(first_name,' ',last_name),
    salary,department_name into full_name,sal,dept_name
    from employees e
    join departments d
    on d.DEPARTMENT_ID=e.DEPARTMENT_ID
    where e.EMPLOYEE_ID=emp_id;
end$$

delimiter ;
call read_all_emp(100
-- =======================================================
delimiter $$
create procedure dept_name_city(in dept_id int,out dept_name varchar(50),out c_name varchar(20))
deterministic 
begin 
	select 
    department_name ,STATE_PROVINCE into dept_name,c_name
    from locations l
    join departments d
    on l.LOCATION_ID=l.LOCATION_ID
    where d.DEPARTMENT_ID=dept_id;
end$$

delimiter ;
call dept_name_city(20,@dept_name,@c_name);-- error