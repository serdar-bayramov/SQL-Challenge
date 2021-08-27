SELECT COUNT(distinct dept_no), count(dept_no)
FROM departments;

CREATE TABLE departments (
dept_no VARCHAR NOT NULL, 
dept_name VARCHAR (30) NOT NULL,
PRIMARY KEY (dept_no));
SELECT * FROM departments;

CREATE TABLE dept_emp (
emp_no INT NOT NULL,
dept_no VARCHAR NOT NULL,
PRIMARY KEY (emp_no,dept_no));
ALTER TABLE dept_emp
ADD FOREIGN KEY (dept_no) REFERENCES departments(dept_no);
SELECT * FROM dept_emp;


CREATE TABLE dept_manager (
dept_no VARCHAR NOT NULL,
emp_no INT NOT NULL,
PRIMARY KEY (emp_no));
ALTER TABLE dept_manager
ADD FOREIGN KEY (dept_no) REFERENCES departments(dept_no);
SELECT * FROM dept_manager;


CREATE TABLE employees (
emp_no INT NOT NULL,
emp_title VARCHAR NOT NULL,
birth_date VARCHAR NOT NULL,
first_name VARCHAR NOT NULL,
last_name VARCHAR NOT NULL,
sex VARCHAR NOT NULL,
hire_date VARCHAR NOT NULL,
PRIMARY KEY (emp_no));
ALTER TABLE employees
ADD FOREIGN KEY (emp_title) REFERENCES titles(title_id);
SELECT * FROM employees;

ALTER TABLE employees ALTER COLUMN birth_date TYPE DATE 
using to_date(birth_date, 'MM-DD-YYYY');
ALTER TABLE employees ALTER COLUMN hire_date TYPE DATE 
using to_date(hire_date, 'MM-DD-YYYY');


CREATE TABLE salaries (
emp_no INT NOT NULL,
salary INT NOT NULL,
PRIMARY KEY (emp_no));
ALTER TABLE salaries
ADD FOREIGN KEY (emp_no) REFERENCES employees(emp_no);
SELECT * FROM salaries;


CREATE TABLE titles (
title_id VARCHAR NOT NULL,
title VARCHAR NOT NULL,
PRIMARY KEY (title_id));
SELECT * FROM titles;
