Use employees;

-- 1. Find all the current employees with the same hire date as employee 101010 using a sub-query.

SELECT CONCAT(first_name, ' ', last_name) as "full_name"
FROM employees AS e 
WHERE e.hire_date = ( -- matches the original query to the emp.no 101010
	SELECT hire_date
	FROM employees
	WHERE emp_no = '101010' AND emp_no in 
		(select emp_no
		from dept_emp
		where to_date > NOW() 
)
);

-- 2. Find all the titles ever held by all current employees with the first name Aamod.
SELECT distinct title
FROM titles
WHERE emp_no IN (
	SELECT emp_no 
	FROM employees
	WHERE first_name = 'Aamod'
);
-- 3. How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.
SELECT CONCAT(first_name, ' ', last_name) as "full_name"
FROM employees
WHERE emp_no IN (
	SELECT emp_no 
	FROM dept_emp
	WHERE to_date < NOW() -- 85108
);
-- 4. Find all the current department managers that are female. List their names in a comment in your code.
SELECT CONCAT(first_name, ' ', last_name) as "full_name"
FROM employees
WHERE emp_no IN (
	SELECT emp_no 
	FROM dept_manager
	WHERE to_date < NOW()
) AND gender = "F";

/* 
Shirish Ossenbruggen
Krassimir Wegerle
Rosine Cools
Peternela Onuegbe
Rutger Hofmeyr
Sanjoy Quadeer
Tonny Butterworth
Marjo Giarratana
Xiaobin Spinelli 
*/

-- 5s Find all the employees who currently have a higher salary than the companies overall, historical average salary.