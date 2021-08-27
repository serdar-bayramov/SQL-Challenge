# SQL-Challenge
In this SQL challenge, we are looking into the employees' database which comprises the following tables: These tables are created in the table_schemata.sql file.

1. departments
2. dept_emp
3. dept_manager
4. employees
5. salaries
6. titles

In SQL, the links were created among the tables via primary and foreign keys in order to make a number of queries. The query.sql file contains the following queries:

1. List the following details of each employee: employee number, last name, first name, sex, and salary.
2. List first name, last name, and hire date for employees who were hired in 1986.
3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
4. List the department of each employee with the following information: employee number, last name, first name, and department name.
5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

Then, the SQL database is imported into Pandas using Jupyter Notebook. The purpose of importing into Pandas is to build data frames and visualise the data. The Jupyter notebook contains the following:

1. Build histogram for salaries of employees in order to understand the salary distribution among employees
2. Groupby salaries by employees titles and create a bar chart of average salaries by title in the organisation
3. Lastly, check the title of the employee with emp_no of 499942