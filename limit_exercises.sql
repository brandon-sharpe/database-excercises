USE employees;

DESCRIBE titles;

SELECT DISTINCT title FROM titles;

DESCRIBE employees;

SELECT first_name, last_name, hire_date, birth_date
FROM employees
WHERE hire_date LIKE '199%'
AND birth_date LIKE '%-12-25'
ORDER BY hire_date
LIMIT 5; 

/* Alselm Cappello	
Utz Mandell	
Bouchung Schreiter	
Baocai Kushner	
Petter Stroustrup*/


SELECT first_name, last_name, hire_date, birth_date
FROM employees
WHERE hire_date LIKE '199%'
AND birth_date LIKE '%-12-25'
ORDER BY hire_date
LIMIT 5 OFFSET 50; 







