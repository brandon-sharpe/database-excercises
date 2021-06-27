USE employees;
DESCRIBE employees;

SELECT emp_no,first_name,last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya');  -- 709


SELECT emp_no,first_name,last_name
FROM employees
WHERE first_name = 'Irena' 
OR  first_name ='Vidya' 
OR first_name = 'Maya'; -- 709 


SELECT emp_no,first_name,last_name, gender
FROM employees
WHERE gender = 'M'
AND first_name IN ('Irena', 'Vidya', 'Maya'); -- 441


SELECT emp_no, first_name,last_name
FROM employees
WHERE last_name LIKE 'e%'; -- 7330


SELECT emp_no, first_name,last_name
FROM employees
WHERE last_name LIKE 'e%'
OR last_name LIKE '%e'; -- 30723, 24292


SELECT emp_no, first_name,last_name
FROM employees
WHERE last_name LIKE '%e'
AND last_name LIKE 'e%'; -- 899, 24292


SELECT emp_no, first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '199%'; -- 135214


SELECT emp_no, first_name, last_name, birth_date
FROM employees
WHERE birth_date LIKE '%-12-25'; -- 842


SELECT emp_no, first_name, last_name, birth_date, hire_date
FROM employees
WHERE birth_date LIKE '%-12-25'
AND hire_date LIKE '199%'; -- 362


SELECT emp_no, first_name, last_name
FROM employees
WHERE last_name LIKE '%q%'; -- 1873


SELECT emp_no, first_name, last_name
FROM employees
WHERE last_name LIKE '%q%'
AND last_name NOT LIKE '%qu%' -- 547; -- completed







