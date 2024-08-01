CREATE TABLE employees(
  employee_id  SERIAL PRIMARY KEY,
  name VARCHAR(100),
  department VARCHAR(50),
  salary DECIMAL (10,2)
);

SELECT * FROM employees

INSERT INTO employees (name,department,salary) VALUES
('JOHN','Enginnering',63000),
('Jane','Enginnering',55000),
('Michael Johnson', 'Engineering', 64000),
('Emily Davis', 'Marketing', 58000),
('Chris Brown', 'Marketing', 56000),
('Emma Wilson', 'Marketing', 59000),
('Alex Lee', 'Sales', 58000),
('Sarah Adams', 'Sales', 58000),
('Ryan Clark', 'Sales', 61000);



-- Write a SQL Query to find second Highest Salary 

-- Approach 1
SELECT MAX(salary) AS salary 
FROM employees WHERE salary NOT IN (SELECT MAX(SALARY) FROM employees)

-- Approach 2
-- Question: Get the details of the employee with the second-highest salary from each department
SELECT name AS Name, department AS Department, salary
FROM employees
WHERE salary = (SELECT MAX(salary) 
                FROM employees 
                WHERE salary < (SELECT MAX(salary) FROM employees));
                
-- Approach 3 
-- Using Window Function 
SELECT name,department,salary
(SELECT name,department,salary,
DENSE_RANK() OVER(ORDER BY salary DESC) AS rnk,
FROM employees) x
WHERE x.rnk = 2;

-- Approach 4
SELECT * FROM employees
ORDER BY salary DESC
LIMIT 1 OFFSET 1
