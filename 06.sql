
drop table employee;
create table employee
( emp_ID int
, emp_NAME varchar(50)
, DEPT_NAME varchar(50)
, SALARY int);

insert into employee values(101, 'Mohan', 'Admin', 4000);
insert into employee values(102, 'Rajkumar', 'HR', 3000);
insert into employee values(103, 'Akbar', 'IT', 4000);
insert into employee values(104, 'Dorvin', 'Finance', 6500);
insert into employee values(105, 'Rohit', 'HR', 3000);
insert into employee values(106, 'Rajesh',  'Finance', 5000);
insert into employee values(107, 'Preet', 'HR', 7000);
insert into employee values(108, 'Maryam', 'Admin', 4000);
insert into employee values(109, 'Sanjay', 'IT', 6500);
insert into employee values(110, 'Vasudha', 'IT', 7000);
insert into employee values(111, 'Melinda', 'IT', 8000);
insert into employee values(112, 'Komal', 'IT', 10000);
insert into employee values(113, 'Gautham', 'Admin', 2000);
insert into employee values(114, 'Manisha', 'HR', 3000);
insert into employee values(115, 'Chandni', 'IT', 4500);
insert into employee values(116, 'Satya', 'Finance', 6500);
insert into employee values(117, 'Adarsh', 'HR', 3500);
insert into employee values(118, 'Tejaswi', 'Finance', 5500);
insert into employee values(119, 'Cory', 'HR', 8000);
insert into employee values(120, 'Monica', 'Admin', 5000);
insert into employee values(121, 'Rosalin', 'IT', 6000);
insert into employee values(122, 'Ibrahim', 'IT', 8000);
insert into employee values(123, 'Vikram', 'IT', 8000);
insert into employee values(124, 'Dheeraj', 'IT', 11000);
COMMIT;
Select * from 	employee;

-- find top 2 employees in each dept with highest salary
select * from 
(select  e.*,
row_number() over(partition by DEPT_NAME ) as rnk
from employee e) x
where x.rnk <3;

-- fetch the first 2 employees from each deptment already join the compant 
select * from 
(select  e.*,
row_number() over(partition by DEPT_NAME order by emp_ID) as rnk
from employee e) x
where x.rnk<3;

-- rank & dense rank 
-- differnce nhi aata 
-- fetch the top 3 employees in each dept earning max salary
select * from
(select e.*,
dense_rank() over(partition by DEPT_NAME order by salary) as rnk
-- dense_rank() over(partition by DEPT_NAME order by salary) as dense_rnk
from  employee e) x
where x.rnk<4










-- find Nth highest salary 

-- Method 1 : 
-- find 4th Higest Salary
-- Using Order by and Limit 
select 
   salary 
from employee
order by salary desc 
limit 3,1;
  

-- Method 2: 
-- Using Dense Rank 
select *
from 
(select *,
  dense_rank() over(order by salary desc) as rnk1 ,
  rank() over(order by salary desc) as rnk2
from employee) x
where x.rnk2 = 3 

