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
SELECT 
	CONCAT(first_name," ",last_name), last_name,
	CASE 
		WHEN last_name LIKE 'A%' THEN 'A-H'
		WHEN last_name LIKE 'B%' THEN 'A-H'
		WHEN last_name LIKE 'C%' THEN 'A-H'
		 WHEN last_name LIKE 'D%' THEN 'A-H'
		 WHEN last_name LIKE 'E%' THEN 'A-H'
		 WHEN last_name LIKE 'F%' THEN 'A-H'
		 WHEN last_name LIKE 'G%' THEN 'A-H'
		 WHEN last_name LIKE 'H%' THEN 'A-H'
		 WHEN last_name LIKE 'I%' THEN 'I-Q'
		 WHEN last_name LIKE 'J%' THEN 'I-Q'
		 WHEN last_name LIKE 'K%' THEN 'I-Q'
		 WHEN last_name LIKE 'L%' THEN 'I-Q'
		 WHEN last_name LIKE 'M%' THEN 'I-Q'
		 WHEN last_name LIKE 'N%' THEN 'I-Q'
		 WHEN last_name LIKE 'O%' THEN 'I-Q'
		 WHEN last_name LIKE 'P%' THEN 'I-Q'
		 WHEN last_name LIKE 'Q%' THEN 'I-Q'
		 WHEN last_name LIKE 'R%' THEN 'R-Z'
		 WHEN last_name LIKE 'S%' THEN 'R-Z'
		 WHEN last_name LIKE 'T%' THEN 'R-Z'
		 WHEN last_name LIKE 'U%' THEN 'R-Z'
		 WHEN last_name LIKE 'V%' THEN 'R-Z'
		 WHEN last_name LIKE 'W%' THEN 'R-Z'
		 WHEN last_name LIKE 'X%' THEN 'R-Z'
		 WHEN last_name LIKE 'Y%' THEN 'R-Z'
		 WHEN last_name LIKE 'Z%' THEN 'R-Z'
		 ELSE 'Other'
		END AS alpha_group
FROM employees;


	