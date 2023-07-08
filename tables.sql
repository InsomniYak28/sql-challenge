CREATE TABLE departments(   
	dept_no VARCHAR(4) NOT NULL,
    dept_name VARCHAR(25) NOT NULL,
    CONSTRAINT departments_pkey PRIMARY KEY (dept_no));

CREATE TABLE titles(
    title_id VARCHAR(5) NOT NULL,
    title VARCHAR(25),
    CONSTRAINT titles_pkey PRIMARY KEY (title_id));

CREATE TABLE employees(
    emp_no INTEGER NOT NULL,
    title_id VARCHAR(5) NOT NULL,
    birth_date DATE,
    first_name VARCHAR(25),
    last_name VARCHAR(25),
    sex VARCHAR(1),
    hire_date DATE,
    CONSTRAINT employees_pkey PRIMARY KEY (emp_no),
    CONSTRAINT fk_titles_employees FOREIGN KEY (title_id) REFERENCES titles (title_id));

CREATE TABLE dept_emp(   
	emp_no INTEGER NOT NULL,
    dept_no VARCHAR(4) NOT NULL,
    CONSTRAINT dept_emp_pkey PRIMARY KEY (emp_no, dept_no),
    CONSTRAINT fk_dept_emp_departments FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    CONSTRAINT fk_dept_emp_employees FOREIGN KEY (emp_no) REFERENCES employees (emp_no));

CREATE TABLE dept_manager(
    dept_no VARCHAR(4) NOT NULL,
    emp_no INTEGER NOT NULL,
    CONSTRAINT dept_manager_pkey PRIMARY KEY (dept_no, emp_no),
    CONSTRAINT dept_manager_dept_no_fkey FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    CONSTRAINT fk_dept_manager_employees FOREIGN KEY (emp_no) REFERENCES employees (emp_no));

CREATE TABLE salaries(
    emp_no INTEGER NOT NULL,
    salary INTEGER,
    CONSTRAINT salaries_pkey PRIMARY KEY (emp_no),
    CONSTRAINT fk_salaries_employees FOREIGN KEY (emp_no) REFERENCES employees (emp_no));