-- Levar McKnight
-- Data Analytics Bootcamp
-- Module 9 Challenge

-- TITLES Table

drop table if exists titles cascade; -- Delete existing table and references

-- Create new table
create table titles(
	title_id varchar not null primary key, -- primary keys cannot be null
	title varchar
);

-- EMPLOYEES Table

drop table if exists employees cascade; -- Delete existing table and references

-- Create new table
create table employees(
	emp_no int not null primary key,
	emp_title_id varchar,
	birth_date date,
	first_name varchar,
	last_name varchar,
	sex varchar,
	hire_date date,
	foreign key (emp_title_id) references titles(title_id)
);

-- DEPARTMENTS Table

drop table if exists departments cascade; -- Delete existing table and references
	
-- Create new table
create table departments(
	dept_no varchar not null primary key,
	dept_name varchar 
);

-- DEPT_MANAGER Table

drop table if exists dept_manager cascade; -- Delete existing table and references

-- Create new table
create table dept_manager(
	dept_no varchar not null,
	emp_no int not null,
	primary key (dept_no, emp_no),
	foreign key (dept_no) references departments(dept_no),
	foreign key (emp_no) references employees(emp_no)
);

-- DEPT_EMP Table

drop table if exists dept_emp cascade; -- Delete existing table and references

-- Create new table
create table dept_emp(
	emp_no int not null,
	dept_no varchar not null,
	primary key (emp_no, dept_no),
	foreign key (emp_no) references employees(emp_no),
	foreign key (dept_no) references departments(dept_no)
);

-- SALARIES Table

drop table if exists salaries cascade; -- Delete existing table and references

-- Create new table
create table salaries(
	emp_no int not null primary key,
	salary int,
	foreign key (emp_no) references employees(emp_no)
);