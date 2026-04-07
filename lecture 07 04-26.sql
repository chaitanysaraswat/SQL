create table dept_using_cu_fk_ex(
	dept_id int auto_increment primary key,
    dept_name varchar(50),
    emp_id int,
    project_id varchar(20)
);

create table emp_using_cu_fk_ex(
	emp_id int auto_increment primary key,
    emp_name varchar(30),
    p_id varchar(30),
    department_id int,
    foreign key (department_id) references dept_using_cu_fk_ex(dept_id) 
    on update cascade
    on delete cascade
);

insert into dept_using_cu_fk_ex(dept_name,emp_id ,project_id) value('IT',103,'P_01'),
('Admin',104,'P_02'),('HR',105,'P_011');

insert into emp_using_cu_fk_ex(emp_name,p_id ,department_id)
values
('A','P_02',3),
('B','P_02',1),
('AA','P_03',1),
('BB','P_03',3);

select * from dept_using_cu_fk_ex;
select * from emp_using_cu_fk_ex;


update emp_using_cu_fk_ex set dept_id =101 where dept_id=1;


#=======================================================================
create table dept_using_cu_fk_ex_null(
	dept_id int auto_increment primary key,
    dept_name varchar(50),
    emp_id int,
    project_id varchar(20)
);

create table emp_using_cu_fk_ex_null(
	emp_id int auto_increment primary key,
    emp_name varchar(30),
    p_id varchar(30),
    department_id int,
    foreign key (department_id) references dept_using_cu_fk_ex_null(dept_id) 
    on delete set null
);

insert into dept_using_cu_fk_ex_null(dept_name,emp_id ,project_id) value('IT',103,'P_01'),
('Admin',104,'P_02'),('HR',105,'P_011');

insert into emp_using_cu_fk_ex_null(emp_name,p_id ,department_id)
values
('A','P_02',3),
('B','P_02',2),
('AA','P_03',1),
('BB','P_03',3);
####==== not null ===== ####
delete from dept_using_cu_fk_ex_null where dept_id=1;
select * from dept_using_cu_fk_ex_null;
select * from emp_using_cu_fk_ex_null;



