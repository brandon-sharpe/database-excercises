USE employees;

DESCRIBE employees; 

SELECT emp_no, first_name, last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name; -- Irena Reutenauer, Vidya Simmen


SELECT emp_no, first_name, last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name, last_name; -- Irena Acton, Vidya Zweizig


SELECT emp_no, first_name, last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name, first_name; -- Irena Acton, Maya Zyda



SELECT emp_no, first_name, last_name
FROM employees
WHERE last_name LIKE 'e%e'
ORDER BY emp_no; -- 899, 10021 Ramzi Erde, 499648 Tadahiro Erde


SELECT hire_date, first_name, last_name
FROM employees
WHERE last_name LIKE 'e%e'
ORDER BY hire_date DESC; -- 899, 1999-11-27	Teiji	Eldridge, 1985-02-02	Sergi	Erde


SELECT hire_date, first_name, last_name, birth_date
FROM employees
WHERE hire_date LIKE '199%'
AND birth_date LIKE '%-12-25'
ORDER BY  hire_date DESC, birth_date ASC; -- 362,1999-08-31	Khun	Bernini	1952-12-25, 1990-01-01	Alselm	Cappello	1962-12-25


-- START OF FUNCTIONS_EXERCISES.SQL

-- 2. Write a query to to find all employees whose last name starts and ends with 'E'. Use concat() to combine their first and last name together as a single column named full_name.

SELECT  CONCAT(first_name, " ", last_name) AS full_name
FROM employees
WHERE last_name LIKE 'e%e';


--  3. Convert the names produced in your last query to all uppercase.
SELECT  CONCAT(upper(first_name), " ", upper(last_name)) AS full_name
FROM employees
WHERE last_name LIKE 'e%e';

-- 4. Find all employees hired in the 90s and born on Christmas. Use datediff() function to find how many days they have been working at the company (Hint: You will also need to use NOW() or CURDATE()),
SELECT CONCAT(first_name, " ", last_name) AS full_name,
DATEDIFF(CURDATE(),hire_date) AS days_at_company
FROM employees
WHERE hire_date LIKE '199%'
AND birth_date LIKE '%-12-25';

-- 5. Find the smallest and largest current salary from the salaries table.
SELECT MIN(salary)
FROM salaries;

SELECT MAX(salary)
FROM salaries;

-- 6. Use your knowledge of built in SQL functions to generate a username for all of the employees. A username should be all lowercase, and consist of the first character of the employees first name, the first 4 characters of the employees last name, an underscore, the month the employee was born, and the last two digits of the year that they were born. Below is an example of what the first 10 rows will look like:
SELECT CONCAT
	(
	SUBSTR(LOWER(first_name),1,1),
	SUBSTR(LOWER(last_name),1,4),
	"_",
	DATE_FORMAT((birth_date),'%m'),
	DATE_FORMAT((birth_date),'%y')
	),
first_name,last_name, birth_date
FROM employees;
