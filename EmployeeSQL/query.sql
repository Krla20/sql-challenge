-- DATA ANALYSIS

-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT * FROM employees

SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
FROM employees AS emp
LEFT JOIN salaries AS sal
ON emp.emp_no = sal.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT * FROM employees
-- Method 1
SELECT emp.first_name, emp.last_name, emp.hire_date 
FROM employees AS emp
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
-- ORDER BY hire_date; -- check 1
-- ORDER BY hire_date DESC; -- check 2

SELECT * FROM employees
-- Method 2
SELECT emp.first_name, emp.last_name, emp.hire_date
FROM employees AS emp
WHERE DATE_PART('year',hire_date) = 1986
-- ORDER BY hire_date; -- check 1
-- ORDER BY hire_date DESC; -- check 2

-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.

SELECT * FROM dept_manager
-- dm.dept_no*, dm.emp_no*
SELECT * FROM departments
-- deps.dept_no, deps.dept_name* 
SELECT * FROM employees
-- emp.emp_no*, emp.last_name, emp.first_name,

SELECT dm.dept_no, deps.dept_name, dm.emp_no, emp.last_name, emp.first_name 
FROM dept_manager AS dm
LEFT JOIN departments AS deps
ON dm.dept_no = deps.dept_no
LEFT JOIN employees AS emp
ON dm.emp_no = emp.emp_no

-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.

SELECT * FROM employees
-- emp.emp_no*, emp.last_name, emp.first_name,
SELECT * FROM departments
-- deps.dept_no*, deps.dept_name
