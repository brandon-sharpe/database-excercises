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








