use hr;
-- 1. Write a query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments.
SELECT  l.location_id, l.street_address,l.state_province, cn.COUNTRY_NAME
FROM locations l
join country_new cn
on cn.country_id=l.country_id;


-- 2. Write a query to find the name (first_name, last name), department ID and name of all the employees
select e.first_name, e.last_name,d.department_ID
from employees e
join departments d
on d.DEPARTMENT_ID=e.DEPARTMENT_ID;

 
-- 3. Write a query to find the name (first_name, last_name), job, department ID and name of the employees who works in London.
select FIRST_NAME ,LAST_NAME,job_description,DEPARTMENT_ID,concat(first_name,last_name)
from employees;

-- 4. Write a query to find the employee id, name (last_name) along with their manager_id and name (last_name).
select employee_id, last_name,MANAGER_ID
from employees;
-- 5. Write a query to find the name (first_name, last_name) and hire date of the employees who was hired after 'Jones'.
select first_name, last_name,HIRE_DATE
from employees
where hire_date>(select hire_date from employees where last_name='Jones');

-- 6. Write a query to get the department name and number of employees in the department.
select department_name,count(EMPLOYEE_ID) no_of_emp_perdept
from employees e
join departments d 
on d.department_id=e.department_id
group by department_name;


-- 7. Write a query to find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90.
-- select  
-- 8. Write a query to display the department ID and name and first name of manager.
select d.department_ID,d.department_name,e.first_name
from departments d
join employees e
on e.MANAGER_ID=d.MANAGER_ID;
-- 9. Write a query to display the department name, manager name, and city.
select d.department_name, e.FIRST_NAME manager_name
from  departments d
join employees e 
on d.DEPARTMENT_ID=e.DEPARTMENT_ID;
-- 10. Write a query to display the job title and average salary of employees.
select j.JOB_TITLE,round(avg(e.salary),2) avg_salary
from employees e
join jobs j
on j.job_id=e.job_id
group by j.JOB_TITLE
order by avg_salary desc;

-- 11. Write a query to display job title, employee name, and the difference between salary of the employee and minimum salary for the job.
select j.job_title,e.first_name,(j.max_salary-j.min_salary) as diff
from employees e
join jobs j
on e.job_id=j.job_id
order by   diff desc ;
-- 12. Write a query to display the job history that were done by any employee who is currently drawing more than 10000 of salary.
select 
-- 13. Write a query to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years.

-- waq to display country_id  and no of employee working in each department  that has more than 5 employees
select country_id,count(*) no_ofe from employees e
inner join departments d
on e.department_id=d.department_id
inner join locations l
l
on d.location_id=l.location_id
group by l.country_id
having no_ofe>5
order by no_ofe desc;

-- from-->where-->group by -->inner join -->group by --->having -->selct-->order by

--  give the count of employees and avg salary per deparment where department_name is it fiannce,sales
select d.department_id,d.department_name,count(*) ,avg(salary)
from employees e
join departments d
on d.department_id=e.department_id
where department_name  in ('IT','finance','Sales')
group by d.department_id
order by count(*);

-- find all the non executive manager who lead teams of 3 more emp earning above 4000 where avg salary exceed 5000
-- select avg(salary),
-- from employees e
-- join jobs j 
-- on j.job_id=e.job_id
-- where avg(salary)>4000 and count(e.employeeid) and job_title like '%President%' 

-- as hr u want city level breakdown of job roles  across america in each city in america should have distinct 
-- job roles total no of cities having more than 2 emolyees and avg salary >5000 and exclude employee salary 3000

SELECT 
    r.region_name,
    COUNT(e.employee_id) AS emp_count,
    COUNT(DISTINCT e.job_id) AS job_count,
    AVG(e.salary) AS avg_sal
FROM regions r
JOIN country_new c ON r.region_id = c.region_id
JOIN locations l ON c.country_id = l.country_id
JOIN departments d ON l.location_id = d.location_id
JOIN employees e ON d.department_id = e.department_id
WHERE r.region_name = 'Americas'
  AND e.salary > 3000
GROUP BY r.region_name
HAVING COUNT(e.employee_id) > 2
   AND AVG(e.salary) > 5000
ORDER BY emp_count;

















-- =========================================== subquery ========================================




select count(*) from employees
where department_id=90;

select first_name,(select department_name from departments where department_id=90) as no_of_emp_dept
from employees;

select concat(first_name,' ',last_name) job_id,department_id
from employees where job_id=(select job_id from employees where employee_id=100);


-- find the employees working in dept located in new york

select employee_id,first_name,department_id
from employees
where department_id=(select department_id 
						from departments
                        where location_id=(select location_id
											from locations 
                                            where State_province="Texas"));
									
	select employee_id, first_name,departmnent_id from employees
    where department_id=(select d.department_id from departments d inner join locations l on d.location_id=l.location_id where state_province='texas');
    
    
    -- find the employee working in department located at seatle
select employee_id,first_name,department_id
from employees
where department_id=(select department_id 
						from departments
                        where location_id=2900);
                                            
select location_id
from locations
where State_province="Geneve";


-- find employee who have past job records
show tables;
select * from job_history;

select first_name,employee_id,department_id
from employees
where employee_id in (select employee_id from job_history);

 -- Write a query to get 3 maximum salaries.
 select max(salary)
 from employees
 where salary <(select max(salary)
						from employees
						where salary < (select max(salary)
												from employees)
                                                 );

select department_id,avg(salary)
from employees
group by department_id
having avg(salary) >(select avg(salary) from employees);

-- ==================== CTE ================================

with  to_check_manager as(
select department_id,location_id ,manager_id from departments)
select distinct e.manager_id,first_name,salary
from employees e ,to_check_manager t
where e.manager_id=t.manager_id;

with more_5_emp as(
select count(employee_id) no_of,department_id from employees
group by department_id )
select distinct m.department_id,m.no_of
from departments,more_5_emp  m
where m.no_of>5;
-- find the highest salary in  dept_id first,last_name,salary


with max_5 as(
select max(salary) as sal,department_id from employees
group by department_id )
select first_name,salary, e.department_id
from employees e,max_5 a
where e.department_id=a.department_id and e.salary=a.sal;
create database movie_db;

with sal_band as(
select first_name,salary,
case 
	when salary <10000 then 'low salary'
    when salary>=10000 and salary<15000 then 'mid range salary'
    when salary>=10000 and salary<15000 then 'high range salary'
    else 'other'
    end as salary_band
    from employees
    )
    select count(*),salary_band
    from sal_band
    group by salary_band;
    
    -- find the employees who are earning more than manager
    -- cte- manager/salary
    -- emp salry>manager salry
    
    with manager_sal as (
    select employee_id as manager_id ,salary
    from employees
    )
    select e.first_name ,e.salary
    from employees e 
    join manager_sal m
    on e.manager_id=m.manager_id 
    where m.salary<e.salary;
    
    -- find employee who earn than avg sala
    -- and have been in the company more than  the avh tenure
   --  with avg_sal as
--     (select first_name, avg(salary)as sal_avg from employees)
--     
--     yrs_exp as (select year(hire_date) h_date from employees)
--     
--     select first_name,sal_avg,h_date from avg_sal s join yrs_exp y
--     on 
--     on 
--     
--     select first_name
--     