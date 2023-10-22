CREATE TABLE titles(
	title_id VARCHAR(30) NOT NULL, 
	title VARCHAR(100) NOT NULL,
	PRIMARY KEY (title_id)
);

CREATE TABLE employees(
	employee_number INT NOT NULL, 
	title_id VARCHAR(30) NOT NULL, 
	birth_date DATE NOT NULL, 
	first_name VARCHAR(50) NOT NULL, 
	last_name VARCHAR(50) NOT NULL, 
	sex VARCHAR(10) NOT NULL, 
	hire_date DATE NOT NULL,
	PRIMARY KEY (employee_number), 
	FOREIGN KEY (title_id) REFERENCES titles(title_id)
);

CREATE TABLE departments(
	dept_number VARCHAR(30) NOT NULL, 
	dept_name VARCHAR(100) NOT NULL, 
	PRIMARY KEY (dept_number)
);


CREATE TABLE dept_employees(
	employee_number INT NOT NULL, 
	dept_number VARCHAR(100) NOT NULL,
	FOREIGN KEY (dept_number) REFERENCES departments(dept_number), 
	FOREIGN KEY (employee_number) REFERENCES employees(employee_number)
);

CREATE TABLE dept_managers(
	dept_number VARCHAR(100) NOT NULL,
	employee_number INT NOT NULL, 
	FOREIGN KEY (dept_number) REFERENCES departments(dept_number),
	FOREIGN KEY (employee_number) REFERENCES employees(employee_number)
);


CREATE TABLE salaries(
	employee_number INT NOT NULL, 
	salary INT NOT NULL, 
	FOREIGN KEY (employee_number) REFERENCES employees(employee_number)
);







