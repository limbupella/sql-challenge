—Create Departments table
	dept_no varchar(5) primary key not null,
	dept_name varchar(35) not null
	);
	select * from departments;

—Create titles table
	create table titles (
	title_id varchar(5) primary key not null,
	title VARCHAR(35) not null
	);
	select * from titles;

—Create employees table
	-- Drop table if exists employees;
	-- Drop table if exists departments;
	-- Drop table if exists titles;
	-- Drop table if exists dept_emp;
	-- Drop table if exists salaries;
	-- Drop table if exists dept_manager;

	create table employees (
	emp_no int primary key not null,
	emp_title_id varchar(8) not null,
	birth_date date not null,
	first_name varchar(25) not null,
	last_name varchar(25) not null,
	sex varchar(1) not null,
	hire_date date not null,
	foreign key (emp_title_id) references titles (title_id)
	);
	select * from employees;

—Create department employee table
-- drop table if exists dept_emp;
	create table dept_emp (
	emp_no int not null,
	dept_no varchar(5) not null,
	foreign key (emp_no) references employees (emp_no),
	foreign key (dept_no) references departments (dept_no)	
	);
	select * from dept_emp;

—Create salaries table
	create table salaries (
	emp_no int primary key not  null,
	salary int not null,
	foreign key (emp_no) references employees (emp_no)
	);
	select * from salaries;

—Create department manager table
	create table dept_manager (
	dept_no varchar(8) not null,
	emp_no int primary key not null,
	foreign key (dept_no) references departments (dept_no),
	foreign key (emp_no) references employees (emp_no)    
	);
	select * from dept_manager;