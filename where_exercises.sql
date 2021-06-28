USE employees;
DESCRIBE employees;

-- 2. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. Enter a comment with the number of records returne
SELECT emp_no,first_name,last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya');  -- 709


-- 3. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. Enter a comment with the number of records returned. Does it match number of rows from Q2?
SELECT emp_no,first_name,last_name
FROM employees
WHERE first_name = 'Irena' 
OR  first_name ='Vidya' 
OR first_name = 'Maya'; -- 709 


-- 4. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. Enter a comment with the number of records returned.
SELECT emp_no,first_name,last_name, gender
FROM employees
WHERE gender = 'M'
AND first_name IN ('Irena', 'Vidya', 'Maya'); -- 441


-- 5. Find all current or previous employees whose last name starts with 'E'. Enter a comment with the number of employees whose last name starts with E.
SELECT emp_no, first_name,last_name
FROM employees
WHERE last_name LIKE 'e%'; -- 7330

-- 6.Find all current or previous employees whose last name starts or ends with 'E'. Enter a comment with the number of employees whose last name starts or ends with E. How many employees have a last name that ends with E, but does not start with E?
SELECT emp_no, first_name,last_name
FROM employees
WHERE last_name LIKE 'e%'
OR last_name LIKE '%e'; -- 30723, 23393

SELECT emp_no, first_name,last_name
FROM employees
WHERE last_name NOT LIKE 'e%'
AND last_name LIKE '%e';

-- 7. Find all current or previous employees employees whose last name starts and ends with 'E'. Enter a comment with the number of employees whose last name starts and ends with E. How many employees' last names end with E, regardless of whether they start with E?
SELECT emp_no, first_name,last_name
FROM employees
WHERE last_name LIKE '%e'
AND last_name LIKE 'e%'; -- 899, 24292



-- .8 Find all current or previous employees hired in the 90s. Enter a comment with the number of employees returned.
SELECT emp_no, first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '199%'; -- 135214


-- 9 Find all current or previous employees born on Christmas. Enter a comment with the number of employees returned.
SELECT emp_no, first_name, last_name, birth_date
FROM employees
WHERE birth_date LIKE '%-12-25'; -- 842

-- 10. Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with the number of employees returned.
SELECT emp_no, first_name, last_name, birth_date, hire_date
FROM employees
WHERE birth_date LIKE '%-12-25'
AND hire_date LIKE '199%'; -- 362


-- 11. Find all current or previous employees with a 'q' in their last name. Enter a comment with the number of records returned.
SELECT emp_no, first_name, last_name
FROM employees
WHERE last_name LIKE '%q%'; -- 1873

-- 12Find all current or previous employees with a 'q' in their last name but not 'qu'. How many employees are found?
SELECT emp_no, first_name, last_name
FROM employees
WHERE last_name LIKE '%q%'
AND last_name NOT LIKE '%qu%' -- 547; 







