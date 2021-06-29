-- 2. In your script, use DISTINCT to find the unique titles in the titles table. How many unique titles have there ever been? Answer that in a comment in your SQL file. (7 unique titles)

USE employees;


SELECT DISTINCT
	title
FROM titles;


SELECT
	COUNT(DISTINCT title) AS number_of_unique_titles
FROM titles;

-- 3. Write a query to find a list of all unique last names of all employees that start and end with 'E' using GROUP BY.

SELECT
	last_name
FROM employees
WHERE last_name LIKE 'E%E'
GROUP BY last_name;

/*
Eldridge
Erbe
Erde
Erie
Etalle
*/

-- What if I want to know how many employees have that last name in the table?
SELECT
	last_name,
	COUNT(*) AS number_of_employees_with_last_name
FROM employees
WHERE last_name LIKE 'E%E'
GROUP BY last_name;


-- 4. Write a query to to find all unique combinations of first and last names of all employees whose last names start and end with 'E'. (846 unique combinations)

SELECT
	first_name,
	last_name
FROM employees
WHERE last_name LIKE 'E%E'
GROUP BY first_name, last_name;

-- What if I want to see the number of people with each unique combintion of first_name and last_name?
SELECT
	first_name,
	last_name,
	COUNT(*) AS number_of_employees
FROM employees
WHERE last_name LIKE 'E%E'
GROUP BY first_name, last_name
ORDER BY number_of_employees DESC;

-- What if I want to know how many employees share the same unique combination of first_name and last_name with at least one other person at their company? (129 employees share their name with at least one other person.)
SELECT
	first_name,
	last_name,
	COUNT(*) AS number_of_employees
FROM employees
WHERE last_name LIKE 'E%E'
GROUP BY first_name, last_name
HAVING number_of_employees > 1
ORDER BY number_of_employees DESC;

-- 5. Write a query to find the unique last names with a 'q' but not 'qu'. Include those names in a comment in your sql code. (3 unique last names)

SELECT
	last_name
FROM employees
WHERE last_name LIKE '%q%' 
	AND last_name NOT LIKE '%qu%'
GROUP BY last_name;

/*
Chleq
Lindqvist
Qiwen
*/

-- If I just want the the unique last names, I can use the DISTINCT keyword, too.
SELECT DISTINCT
	last_name
FROM employees
WHERE last_name LIKE '%q%' 
	AND last_name NOT LIKE '%qu%';

-- 6. Add a COUNT() to your results (the query above) and use ORDER BY to make it easier to find employees whose unusual name is shared with others.

SELECT
	last_name,
	COUNT(last_name) AS count_of_names
FROM employees
WHERE last_name LIKE '%q%' 
	AND last_name NOT LIKE '%qu%'
GROUP BY last_name
ORDER BY count_of_names DESC;

/*
Lindqvist	190
Chleq	    189
Qiwen	    168
*/

-- 7. Find all all employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names.

SELECT
	first_name,
	gender,
	COUNT(*) AS number_of_employees
FROM employees
WHERE first_name IN('Irena', 'Vidya', 'Maya')
GROUP BY gender, first_name
ORDER BY first_name, number_of_employees DESC;

/*
Irena	M	144
Irena	F	97
Maya	M	146
Maya	F	90
Vidya	M	151
Vidya	F	81
*/

-- 8. Using your query that generates a username for all of the employees, generate a count of employees for each unique username. Are there any duplicate usernames? 

-- Yes, there are duplicate usernames. (285_872 usernames in total)

SELECT 
	LOWER(
			CONCAT(
				SUBSTR(first_name, 1, 1),
				SUBSTR(last_name, 1, 4),
				'_',
				SUBSTR(birth_date, 6, 2),
				SUBSTR(birth_date, 3, 2)
				)
			) AS username,
	COUNT(*) AS number_of_duplicates
FROM employees
GROUP BY username
ORDER BY number_of_duplicates DESC;