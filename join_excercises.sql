USE join_example_db;

-- 2. Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson. Before you run each query, guess the expected number of results.
SELECT * 
FROM users
JOIN roles ON users.role_id = roles.id;

SELECT *
FROM users
LEFT JOIN roles ON users.role_id = roles.id;

SELECT * 
FROM users
RIGHT JOIN roles ON users.role_id = roles.id;

-- 3. Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries. Use count and the appropriate join type to get a list of roles along with the number of users that has the role. Hint: You will also need to use group by in the query.
SELECT roles.id, COUNT(roles.id)
FROM users
RIGHT JOIN roles ON users.role_id = roles.id
GROUP BY roles.name;


-- swap to employees db
USE employees;


-- 2. Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.
SELECT d.dept_name, CONCAT(e.first_name, ' ', e.last_name) AS dept_manager
FROM employees AS e
JOIN dept_manager AS dm
  ON dm.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = dm.dept_no
WHERE dm.to_date = '9999-01-01'
ORDER BY dept_name;

-- 3. Find the name of all departments currently managed by women.
SELECT d.dept_name, CONCAT(e.first_name, ' ', e.last_name) AS dept_manager
FROM employees AS e
JOIN dept_manager AS dm
  ON dm.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = dm.dept_no
WHERE dm.to_date = '9999-01-01' AND gender = 'f'
ORDER BY dept_name;

-- 4. Find the current titles of employees currently working in the Customer Service department.
SELECT  title, COUNT(title) as count
FROM titles 
JOIN dept_emp as de 
	ON titles.emp_no = de.emp_no 
	and de.to_date >= NOW()
JOIN departments as d
	on de.dept_no = d.dept_no
	AND d.dept_no = 'd009'
WHERE titles.to_date >= NOW()
GROUP BY title
ORDER BY title;

-- 5. Find the current salary of all current managers.

SELECT d.dept_name, CONCAT(e.first_name, ' ', e.last_name) AS name, s.salary
FROM employees AS e
JOIN dept_manager AS dm
	ON dm.emp_no = e.emp_no
	AND to_date >= NOW()
JOIN departments AS d
	ON d.dept_no = dm.dept_no
JOIN salaries AS s
	ON s.emp_no = e.emp_no
	AND s.to_date >= NOW()
ORDER BY d.dept_name;


-- 6. Find the number of current employees in each department.

SELECT d.dept_no, d.dept_name, COUNT(de.dept_no) as number_of_emp
FROM dept_emp AS de
JOIN departments AS d
	on d.dept_no = de.dept_no
WHERE de.to_date >= NOW()
GROUP BY d.dept_no
ORDER BY d.dept_no;

-- 7. Which department has the highest average salary? Hint: Use current not historic information.
SELECT d.dept_name, avg(s.salary)
FROM employees AS e
JOIN salaries AS s
	ON s.emp_no = e.emp_no
	AND s.to_date >= NOW()
JOIN dept_emp AS de
	ON de.emp_no = e.emp_no
	AND de.to_date >= NOW()
JOIN departments AS d
	ON d.dept_no = de.dept_no
JOIN dept_manager as dm
	ON dm.dept_no = d.dept_no
	AND dm.to_date >= NOW()
GROUP BY d.dept_name
ORDER BY avg(s.salary) DESC
LIMIT 1;

-- 8. Who is the highest paid employee in the Marketing department?
SELECT first_name, last_name
FROM employees AS e
JOIN salaries AS s
	ON s.emp_no = e.emp_no
	AND s.to_date >= NOW()
JOIN dept_emp AS de
	ON de.emp_no = e.emp_no
	AND de.to_date >= NOW()
JOIN departments AS d
	ON d.dept_no = de.dept_no
JOIN dept_manager AS dm
	ON dm.dept_no = d.dept_no
	AND dm.to_date >= NOW()
WHERE d.dept_no = 'd001'
ORDER BY s.salary DESC
LIMIT 1;

-- 9. Which current department manager has the highest salary?
SELECT first_name, last_name, s.salary, d.dept_name
FROM dept_manager AS dm

JOIN salaries AS s
	ON s.emp_no = dm.emp_no
	AND s.to_date >= NOW()
JOIN departments AS d
	ON d.dept_no = dm.dept_no
JOIN employees AS e
	ON e.emp_no = dm.emp_no

WHERE dm.to_date >= NOW()
ORDER BY s.salary DESC
LIMIT 1;

-- 10. Bonus Find the names of all current employees, their department name, and their current manager's name.
SELECT CONCAT(e.first_name, ' ', e.last_name) AS employee_name, d.dept_name, CONCAT(mgr.first_name, ' ', mgr.last_name)  as manager_name

FROM employees as e
JOIN dept_emp AS de
	ON de.emp_no = e.emp_no
	AND de.to_date >= NOW()

JOIN departments AS d
	ON d.dept_no = de.dept_no

JOIN dept_manager AS dm
	ON dm.dept_no = de.dept_no
	AND dm.to_date >= NOW()

JOIN employees as mgr
	ON mgr.emp_no = dm.emp_no
ORDER BY d.dept_name;

-- 11
SELECT 
	t1.dept_name AS 'Department Name',
	t1.salary AS 'Salary',
	CONCAT(first_name,' ', last_name) AS 'Employee Name'
FROM 
	(
	-- Part 1 which builds the base table to employee names, salaries and dept names
	SELECT
		salary, dept_name, first_name, last_name
	FROM
		salaries
	JOIN
		dept_emp 
	USING(emp_no)
	JOIN 
		departments 
	USING(dept_no)
	JOIN 
		employees
	USING(emp_no)
	WHERE 
		dept_emp.to_date >= NOW()
	AND 
		salaries.to_date >= NOW()
	) AS t1 # This is table_1 result created
INNER JOIN
	(
	-- Part 2 builds another table to cross reference the previous part with the calculated max salaries
	SELECT dept_name, MAX(salary) as max_salary
	FROM 
		(
		SELECT
			salary, dept_name, first_name, last_name
		FROM
			salaries
		JOIN
			dept_emp 
		USING(emp_no)
		JOIN 
			departments 
		USING(dept_no)
		JOIN 
			employees
		USING(emp_no)
		WHERE 
			dept_emp.to_date >= NOW()
			AND 
			salaries.to_date >= NOW()
		) as t2
	GROUP BY dept_name
	) AS t2 # This is table_2 result created
	-- Joins both tables based on the dept_name and matches the salary & department name with the max_salary
	ON 
	t1.dept_name = t2.dept_name
	AND
	t1.salary = t2.max_salary
ORDER BY 'Department Name' DESC;


