-- Levar McKnight
-- Data Analytics Bootcamp
-- Module 9 Challenge

-- DATA ANALYSIS

-- 1. List the employee number, last name, first name, sex, 
--    and salary of each employee.

select employees.emp_no, -- desired column order
	employees.last_name,
	employees.first_name,
	employees.sex,
	salaries.salary
from employees
inner join salaries -- inner join two tables by the emp_no column
on employees.emp_no = salaries.emp_no -- in ascending order
order by emp_no; 

-- 2. List the first name, last name, and hire date for the employees 
--    who were hired in 1986.

select first_name, last_name, hire_date from employees -- desired column order
where hire_date between '1986-01-01' and '1986-12-31' -- hired during 1986
order by hire_date;

-- 3. List the manager of each department along with their department number, 
--    department name, employee number, last name, and first name.

select dept_manager.dept_no, -- desired column order
	departments.dept_name,
	dept_manager.emp_no,
	employees.last_name,
	employees.first_name
from dept_manager
inner join departments -- inner join three tables by dept_no and emp_no
on dept_manager.dept_no = departments.dept_no
inner join employees
on dept_manager.emp_no = employees.emp_no;

-- 4. List the department number for each employee along with that employee’s 
--    employee number, last name, first name, and department name.

select dept_emp.dept_no, -- desired column order
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
from dept_emp
inner join employees -- inner join three tables by emp_no and dept_no 
on dept_emp.emp_no = employees.emp_no
inner join departments
on dept_emp.dept_no = departments.dept_no
order by dept_no;

-- 5. List first name, last name, and sex of each employee whose first name is 
--    Hercules and whose last name begins with the letter B.

select first_name, last_name, sex from employees -- desired column order
where first_name = 'Hercules' and last_name like 'B%' -- 'Hercules B[wild card]'
order by last_name;

-- 6. List each employee in the Sales department, including their employee number, 
--    last name, and first name.

select departments.dept_name, -- desired column order
	employees.emp_no,
	employees.last_name,
	employees.first_name
from departments
inner join dept_emp
on departments.dept_no = dept_emp.dept_no -- chained three tables together by
inner join employees                      -- dept_no and emp_no
on dept_emp.emp_no = employees.emp_no
where dept_name = 'Sales'; -- filtered for 'Sales'

-- 7. List each employee in the Sales and Development departments, including their 
--    employee number, last name, first name, and department name.

select employees.emp_no, -- desired column order
	employees.last_name,
	employees.first_name,
	departments.dept_name
from departments
inner join dept_emp
on departments.dept_no = dept_emp.dept_no -- chained three tables together by
inner join employees                      -- dept_no and emp_no
on dept_emp.emp_no = employees.emp_no
where dept_name = 'Sales' or dept_name = 'Development'; -- filtered for 'Sales' 
                                                        -- and 'Development'

-- 8. List the frequency counts, in descending order, of all the employee last names 
--    (that is, how many employees share each last name).

select last_name, count(last_name) -- tally each last name
from employees
group by last_name -- group each name
order by count desc;  -- display names in descending order of count