--Learining Subquries

select * from employee;
select * from department;

--Q1 Select Column where salary is greater than average salary 
select * from 
employee
where salary>(
 select avg(salary)
 from employee
)

--Q2 max salary in each department 

select e.*,
max(salary) over(partition by dept_name) as max_salary
from employee e;

--other way of writing 
select DEPT_NAME,SALARY as max_salary
from
(select *,
rank() over(partition by dept_name order by salary desc) as max_salary
from employee) x
where x.max_salary = 1;


--Using Sub-query understanding use of IN

--Find Department who do not have any employee using NOT IN


--Find employee in each department  who earn more than average salary in that department 






