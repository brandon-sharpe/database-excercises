-- 1 Using the example from the lesson, create a temporary table called employees_with_departments that contains first_name, last_name, and dept_name for employees currently with that department.

-- Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns
-- Update the table so that full name column contains the correct data
-- Remove the first_name and last_name columns from the table.
-- What is another way you could have ended up with this same table?

USE germain_1471;

CREATE TEMPORARY TABLE employees_with_departments AS
SELECT first_name, last_name, dept_name
FROM employees.employees
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no); -- creates temp table

ALTER TABLE employees_with_departments ADD  full_name VARCHAR(100); -- Adds full name column 

UPDATE employees_with_departments 
SET full_name = CONCAT(first_name," ", last_name);-- fills full name column

ALTER TABLE employees_with_departments DROP COLUMN first_name;-- drops first_name
ALTER TABLE employees_with_departments DROP COLUMN last_name;-- drops last_name
SELECT * from employees_with_departments;





-- 2. Create a temporary table based on the payment table from the sakila database.

-- Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of cents of the payment. For example, 1.99 should become 199.
CREATE TEMPORARY TABLE payments_made AS
SELECT *
FROM sakila.payment;

ALTER TABLE payments_made MODIFY COLUMN amount decimal(10,2); -- raises the decimal limit

UPDATE payments_made 
SET amount = amount * 100; -- multiplies by 100 

SELECT FLOOR(amount) from payments_made; -- drops the decimal and remaining zeros



-- Find out how the current average pay in each department compares to the overall, historical average pay. In order to make the comparison easier, you should use the Z-score for salaries. In terms of salary, what is the best department right now to work for? The worst?