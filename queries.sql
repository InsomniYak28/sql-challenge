--each employee's number, sex, salary, first/last name
select first_name, last_name, sex, employees.emp_no, salary
from employees
inner join salaries
on employees.emp_no = salaries.emp_no;

--first/last name, hire date for employees hired in 1986
select first_name, last_name, hire_date
from employees
where hire_date between '1986-01-01' and '1986-12-30';

--manager of each department w/ their dept_no, dept_name, first/last name
select departments.dept_no, departments.dept_name, employees.emp_no, employees.first_name, employees.last_name
from dept_manager
inner join employees on employees.emp_no = dept_manager.emp_no
inner join departments on dept_manager.dept_no = departments.dept_no;

--each employee's number, dept_no, dept_name, first/last name
select dept_emp.emp_no, dept_emp.dept_no, departments.dept_name, employees.first_name, employees.last_name
from dept_emp
inner join employees on employees.emp_no = dept_emp.emp_no
inner join departments on departments.dept_no = dept_emp.dept_no;

--first/last name, sex of employees whose first name = Hercules, last name begins w/ 'B'
select first_name, last_name, sex
from employees
where first_name = 'Hercules'
and last_name like 'B%';

--each employee in Sales (d007) dept w/ their emp_no, first/last name
select employees.emp_no, first_name, last_name
from employees
inner join dept_emp on employees.emp_no = dept_emp.emp_no
inner join departments on departments.dept_no = dept_emp.dept_no
where dept_name = 'Sales';

--each employee in Sales (d007) & Development (d005) w/ their emp_no, dept_name, first/last name
select employees.emp_no, first_name, last_name, departments.dept_name
from employees
inner join dept_emp on employees.emp_no = dept_emp.emp_no
inner join departments on departments.dept_no = dept_emp.dept_no
where dept_name = 'Sales'
and dept_name = 'Development';

--list frequency counts (how many times) of employee's last names in descending order
select employees.last_name, count(employees.last_name) as last_name_frequency
from employees
group by employees.last_name
order by last_name_frequency DESC;
