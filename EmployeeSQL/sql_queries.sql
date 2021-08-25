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


SELECT employees.emp_no, employees.last_name,
employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no;


SELECT employees.first_name,employees.last_name,employees.hire_date
FROM employees WHERE extract(year from employees.hire_date)=1986;


SELECT dept_manager.dept_no,departments.dept_name,dept_manager.emp_no,
employees.first_name, employees.last_name
FROM dept_manager
JOIN departments
ON dept_manager.dept_no=departments.dept_no
JOIN employees
ON dept_manager.emp_no=employees.emp_no;


SELECT employees.emp_no,employees.last_name, employees.first_name,departments.dept_name
FROM employees
JOIN dept_emp
ON employees.emp_no=dept_emp.emp_no
JOIN departments
ON dept_emp.dept_no=departments.dept_no;

SELECT first_name, last_name, sex
FROM employees
WHERE first_name='Hercules' AND last_name like 'B%';

SELECT employees.emp_no,employees.last_name, employees.first_name,departments.dept_name
FROM employees 
JOIN dept_emp
ON employees.emp_no=dept_emp.emp_no
JOIN departments
ON dept_emp.dept_no=departments.dept_no
WHERE departments.dept_name='Sales';

SELECT employees.emp_no,employees.last_name, employees.first_name,departments.dept_name
FROM employees 
JOIN dept_emp
ON employees.emp_no=dept_emp.emp_no
JOIN departments
ON dept_emp.dept_no=departments.dept_no
WHERE departments.dept_name='Sales' OR departments.dept_name='Development';

SELECT employees.last_name, COUNT(employees.last_name) AS "Count Last Name"
FROM employees
GROUP BY employees.last_name ORDER BY "Count Last Name" DESC;