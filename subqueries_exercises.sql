Use employees;

-- 1. Find all the current employees with the same hire date as employee 101010 using a sub-query.

SELECT *
FROM employees
JOIN salaries USING(emp_no)
WHERE to_date > NOW()
	AND hire_date = (
					SELECT hire_date
					FROM employees
					WHERE emp_no = 101010);

-- 2. Find all the titles ever held by all current employees with the first name Aamod.
SELECT distinct title
FROM titles
WHERE emp_no IN (
	SELECT emp_no 
	FROM employees
	WHERE first_name = 'Aamod'
);
-- 3. How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.
SELECT  COUNT(*)
FROM employees
WHERE emp_no not in (
	SELECT emp_no 
	FROM dept_emp
	WHERE to_date > NOW() -- 59900
);
-- 4. Find all the current department managers that are female. List their names in a comment in your code.
SELECT CONCAT(first_name, ' ', last_name) as "full_name"
FROM employees
WHERE emp_no IN (
	SELECT emp_no 
	FROM dept_manager
	WHERE to_date > NOW()
) AND gender = "F";

/* 
Isamu Legleitner
Karsten Sigstam
Leon DasSarma
Hilary Kambil
*/

-- 5. Find all the employees who currently have a higher salary than the companies overall, historical average salary.
SELECT * 
FROM employees
WHERE emp_no IN(
	SELECT emp_no
	FROM salaries 
	WHERE salary > (SELECT avg(salary) FROM salaries) 
	AND to_date >= NOW()
);
-- 6. How many current salaries are within 1 standard deviation of the current highest salary? (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?
SELECT
	COUNT(salary)
FROM salaries
WHERE to_date > CURDATE()
	AND salary >= (
					SELECT
					MAX(salary) - STDDEV(salary)
					FROM salaries
					WHERE to_date > CURDATE()
					);

SELECT
(SELECT
	COUNT(salary)
FROM salaries
WHERE to_date > CURDATE()
	AND salary >= (
					SELECT
					MAX(salary) - STDDEV(salary)
					FROM salaries
					WHERE to_date > CURDATE()
					))
/
(SELECT
	COUNT(salary)
FROM salaries
WHERE to_date > CURDATE()) * 100 AS percent_of_salaries ;

