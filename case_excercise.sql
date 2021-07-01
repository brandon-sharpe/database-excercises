USE employees;

-- 1. Write a query that returns all employees (emp_no), their department number, their start date, their end date, and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not.

SELECT de.emp_no,
    MAX(dnum.dept_no) as "Department Number",
    MIN(de.from_date) as "Start Date", MAX(de.to_date) as "End Date",
    IF (MAX(de.to_date) > NOW(), TRUE, FALSE) is_current_employee
FROM dept_emp de
LEFT JOIN (SELECT dept_no, emp_no FROM dept_emp
WHERE to_date = (SELECT MAX(to_date) FROM dept_emp)) dnum using (emp_no)
GROUP BY emp_no;

-- 2. Write a query that returns all employee names (previous and current), and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name. 
SELECT first_name, last_name,
	CASE 
		WHEN SUBSTR(last_name, 1, 1) BETWEEN 'A' and 'H' THEN 'A-H' 
		WHEN SUBSTR(last_name, 1, 1) BETWEEN 'I' and 'Q' THEN 'I-Q'
		WHEN SUBSTR(last_name, 1, 1) BETWEEN 'R' and 'Z' THEN 'R-Z'
	END AS 'alpha_group'
FROM employees;

-- 3 
SELECT
	COUNT(CASE WHEN birth_date LIKE '195%' THEN birth_date ELSE NULL END) AS "Born in the 50's",
	COUNT(CASE WHEN birth_date LIKE '196%' THEN birth_date ELSE NULL END) AS "Born in the 60's",
	COUNT(CASE WHEN birth_date LIKE '197%' THEN birth_date ELSE NULL END) AS "Born in the 70's",
	COUNT(CASE WHEN birth_date LIKE '198%' THEN birth_date ELSE NULL END) AS "Born in the 80's",
	COUNT(CASE WHEN birth_date LIKE '199%' THEN birth_date ELSE NULL END) AS "Born in the 90's"
FROM employees;

	