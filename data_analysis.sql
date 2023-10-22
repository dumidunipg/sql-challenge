SELECT * FROM departments
SELECT * FROM dept_employees
SELECT * FROM dept_managers
SELECT * FROM employees
SELECT * FROM salaries
SELECT * FROM titles

--1. List the employee number, last name, first name, sex, and salary of each employee.

SELECT employees.employee_number, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
INNER JOIN salaries ON employees.employee_number = salaries.employee_number;

--2. List the first name, last name, and hire date for the employees who were hired in 1986.
--https://www.sqltutorial.org/sql-date-functions/how-to-extract-year-from-date-in-sql/ 

SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT (YEAR FROM hire_date) = 1986;

--3. List the manager of each department along with their department number, department name, employee number, last name, and first name.

--dept_managers,  departments(dept_name), employees(first_name, last_name)


SELECT employees.last_name, employees.first_name, dept_managers.dept_number, departments.dept_name, dept_managers.employee_number
FROM dept_managers
INNER JOIN employees ON dept_managers.employee_number = employees.employee_number
INNER JOIN departments ON dept_managers.dept_number = departments.dept_number;


--4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

-- dept_employees(employee_number, dept_number), employees(last_name, first_name) , departments(dept_name), 

SELECT employees.last_name, employees.first_name, dept_employees.employee_number, dept_employees.dept_number, departments.dept_name
FROM dept_employees
INNER JOIN departments ON dept_employees.dept_number = departments.dept_number
INNER JOIN employees ON dept_employees.employee_number = employees.employee_number;

--5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT first_name, last_name 
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE '%B%';


--6. List each employee in the Sales department, including their employee number, last name, and first name.


SELECT employees.last_name, employees.first_name, dept_employees.employee_number
FROM dept_employees
INNER JOIN employees ON dept_employees.employee_number = employees.employee_number
INNER JOIN departments ON dept_employees.dept_number = departments.dept_number
WHERE departments.dept_name = 'Sales';


--7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT employees.last_name, employees.first_name, dept_employees.employee_number, departments.dept_name
FROM dept_employees
INNER JOIN employees ON dept_employees.employee_number = employees.employee_number
INNER JOIN departments ON dept_employees.dept_number = departments.dept_number
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';


--8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT last_name, COUNT(employee_number)
FROM employees
GROUP BY last_name;




