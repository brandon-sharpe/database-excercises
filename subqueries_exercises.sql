Use employees;

-- 1. Find all the current employees with the same hire date as employee 101010 using a sub-query.

SELECT *
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

