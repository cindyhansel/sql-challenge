-- ************************************************
-- Create the 6 tables for Challenge 9 
-- The data is then imported from csv files
-- Order is important as there are constraints/dependencies on tables
-- ************************************************
-- create 'titles' table
CREATE TABLE titles (
	title_id VARCHAR(32) NOT NULL,
	title VARCHAR(32) NOT NULL,
	PRIMARY KEY(title_id)
);

-- create 'employees' table
CREATE TABLE employees (
	emp_no VARCHAR(32) NOT NULL,
	emp_title VARCHAR(32) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255) NOT NULL,
	sex VARCHAR(32) NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY(emp_no),
	FOREIGN KEY(emp_title) REFERENCES titles(title_id)
);

-- create 'salaries' table
CREATE TABLE salaries (
	emp_no VARCHAR(32) NOT NULL,
	salary INTEGER NOT NULL,
	PRIMARY KEY(emp_no),
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no)
);

-- create 'departments' table
CREATE TABLE departments (
	dept_no VARCHAR(32) NOT NULL,
	dept_name VARCHAR(32) NOT NULL,
	PRIMARY KEY(dept_no)
);

-- create 'dept_manager' table
CREATE TABLE dept_manager (
	dept_no VARCHAR(32) NOT NULL,
	emp_no VARCHAR(32) NOT NULL,
	PRIMARY KEY(emp_no),
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY(dept_no) REFERENCES departments(dept_no)
);

-- create 'dept_emp' table
CREATE TABLE dept_emp (
	emp_no VARCHAR(32) NOT NULL,
	dept_no VARCHAR(32) NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY(dept_no) REFERENCES departments(dept_no)	
);

SELECT * FROM titles;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM departments;
SELECT * FROM dept_manager;
SELECT * FROM dept_emp;
