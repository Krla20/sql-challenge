-- Create table schema

DROP TABLE IF EXISTS departments;
-- DROP TABLE departments CASCADE;
DROP TABLE IF EXISTS titles;
-- DROP TABLE employees CASCADE;
DROP TABLE IF EXISTS employees;
-- DROP TABLE employees CASCADE;
DROP TABLE IF EXISTS dept_emp;
-- DROP TABLE dept_emp CASCADE;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS salaries;

-- Create table departments

CREATE TABLE departments (
	dept_no VARCHAR (10) NOT NULL,
	dept_name VARCHAR (50) NOT NULL,
	PRIMARY KEY (dept_no)
);

SELECT * FROM departments

-- Create table titles

CREATE TABLE titles (
	title_id VARCHAR NOT NULL,
	title VARCHAR (50) NOT NULL,
	PRIMARY KEY (title_id)
);

SELECT * FROM titles

-- Create table employees

CREATE TABLE employees (
	emp_no INT NOT NULL,
	emp_title_id VARCHAR NOT NULL,
	birth_date DATE DEFAULT ('now'::text)::date NOT NULL,
	first_name VARCHAR (50) NOT NULL,
	last_name VARCHAR (50) NOT NULL,
	sex VARCHAR (10) NOT NULL,
	hire_date DATE DEFAULT ('now'::text)::date NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

SELECT * FROM employees

-- Create table dept_emp

CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR (10) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

SELECT * FROM dept_emp

-- Create table dept_manager

CREATE TABLE dept_manager (
	dept_no VARCHAR (10) NOT NULL,
	emp_no INT NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

SELECT * FROM dept_manager

-- Create table salaries

CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

SELECT * FROM salaries

