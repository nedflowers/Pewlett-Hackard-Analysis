---Drop table if exists ----
DROP TABLE departments;

DROP TABLE dept_emp;

DROP TABLE dept_manager;

DROP TABLE emp_count;

DROP TABLE employees;

DROP TABLE mentor_dept;

DROP TABLE mentor_emp;

DROP TABLE mentorship_eliibiity;

DROP TABLE mentorship_titles;

DROP TABLE retirement_info;

DROP TABLE retirement_titles;

DROP TABLE retiring_titles;

DROP TABLE salaries;

DROP TABLE titles;

DROP TABLE tiles_info;

DROP TABLE unique_titles;

-- Creating tables for PH-EmployeeDB
CREATE TABLE departments (
     dept_no VARCHAR(4) NOT NULL,
     dept_name VARCHAR(40) NOT NULL,
     PRIMARY KEY (dept_no),
     UNIQUE (dept_name)
);

CREATE TABLE employees (
	emp_no INT NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	gender VARCHAR NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no)
);

CREATE TABLE dept_manager (
	dept_no VARCHAR(4) NOT NULL,
	emp_no INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE salaries (
  emp_no INT NOT NULL,
  salary INT NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  PRIMARY KEY (emp_no)
);

CREATE TABLE titles (
	emp_no INT NOT NULL,
	title VARCHAR(20) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(4) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

SELECT * FROM departments;

SELECT * FROM employees;

SELECT * FROM dept_manager;

SELECT * FROM dept_emp;

SELECT * FROM salaries;

SELECT * FROM titles;

-- Retrieve emp_no, first_name, last_name columns from the Employees table
-- Create a new table using the INTO clause.
SELECT emp_no, birth_date, first_name, last_name
INTO retirement_info
FROM employees

SELECT * FROM retirement_info;

-- Retrieve the title, from_date, and to_date columns from the Titles table.
-- Create a new table using the INTO clause.
SELECT emp_no, title, from_date, to_date
INTO titles_info
FROM titles

SELECT * FROM titles_info;

-- Join tables on primary key
-- Filter the data on the birth_date column to retrieve the employees who were born between 1952 and 1955. 
-- Order by the employee number.
SELECT retirement_info.emp_no,
	 retirement_info.first_name,
retirement_info.last_name,
	 titles_info.title,
		titles_info.from_date,
	 titles_info.to_date
INTO  retirement_titles
FROM retirement_info
INNER JOIN titles_info
ON retirement_info.emp_no = titles_info.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no

-- Export table to CSV
-- Display table
SELECT * FROM retirement_titles;

-- Retrieve the employee number, first and last name, and title columns from rt table
-- Use the DISTINCT ON, get first occurrence of emp_no
-- Filter only current employees
-- Create unique_titles table and sort emp_no ASC, to_date DESC
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
	rt.first_name,
		rt.last_name,
		rt.title
-- INTO unique_titles
FROM retirement_titles AS rt
WHERE (rt.to_date = '9999-01-01')
ORDER BY rt.emp_no ASC, rt.to_date DESC

-- Export table to CSV
-- Display table
SELECT * FROM unique_titles;

-- Get count of titles from unique_titles table
-- Create retiring_titles table
-- Group by title and count column DESC
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT DESC

-- Export table to CSV
-- Display table
SELECT * FROM retiring_titles;


--- DELIVERABLE 2 ---
-- Get emp_no, first_name, last_name, birth_date columns from the employees table
SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
		last_name,
	birth_date
INTO mentor_emp
FROM employees

SELECT * FROM mentor_emp;

-- Get from_date and to_date columns from the dept_emp table
SELECT DISTINCT ON (emp_no) emp_no,
	from_date,
		to_date
INTO mentor_dept
FROM dept_emp

SELECT * FROM mentor_dept;

-- Get title column from the Titles table
SELECT DISTINCT ON (emp_no)
		emp_no,
	title
INTO mentor_title
FROM titles

SELECT * FROM mentor_title;

-- Join all 3 tables 
SELECT me.emp_no,
		me.first_name,
	me.last_name,
		me.birth_date,
	md.from_date,
		md.to_date,
	mt.title
INTO mentorship_eligibilty
-- Def aliases with join and from statemnets
FROM mentor_emp as me
INNER JOIN mentor_dept AS md
ON (me.emp_no = md.emp_no)
LEFT JOIN mentor_title as mt
ON (md.emp_no = mt.emp_no)
WHERE (md.to_date = '9999-01-01')
	AND (me.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no

SELECT * FROM mentorship_eligibilty;

-- Find sum of positions becoming vacant
SELECT SUM (COUNT) FROM retiring_titles;

--- Dettermine if enough employees for membership program
SELECT COUNT(title), title
INTO mentorship_titles
FROM mentorship_eligibilty
GROUP BY mentorship_eligibilty.title
ORDER BY COUNT DESC

SELECT* FROM mentorship_titles;

----- Total current employees-----
SELECT DISTINCT ON (ri.emp_no) ri.emp_no,
	 	ri.first_name,
	ri.last_name,
	 ri.title,
		ti.from_date,
	 ti.to_date
INTO  emp_count
FROM retirement_info AS ri
INNER JOIN titles_info AS ti
ON (retirement_info.emp_no = titles_info.emp_no)
WHERE (titles_info.to_date = '9999-01-01')
ORDER BY emp_no

SELECT COUNT (emp_no) FROM emp_count;

