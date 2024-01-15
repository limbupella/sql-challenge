-List the employee number, last name, first name, sex, and salary of each employee.
	select s.emp_no, e.last_name, e.first_name, e.sex, s.salary
	from employees AS e
	inner join salaries AS s
	on s.emp_no = e.emp_no;

-List the first name, last name, and hire date for the employees who were hired in 1986
	select emp_no, first_name, last_name, hire_date
	from employees
	where hire_date between '01-01-1986' and '12-31-1986'; 

-List the manager of each department along with their department number, department name, employee number, last name, and first name.
	select dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
	from dept_manager as dm
	inner join departments as d
	on dm.dept_no=d.dept_no
	inner join employees as e
	on dm.emp_no=e.emp_no;

-List the department number for each employee along with that employee’s employee number, last name, first name, and department name (2 points)
	select e.emp_no, e.last_name, e.first_name,d.dept_name
	from employees as e
	left join dept_emp as de
	on e.emp_no = de.emp_no
	inner join departments as d
	on de.dept_no = d.dept_no;

-List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B (2 points)
	select e.first_name, e.last_name, e.sex
	from employees as e
	where (e.first_name='Hercules') and (lower(e.last_name) LIKE 'b%');

-List each employee in the Sales department, including their employee number, last name, and first name (2 points)
	select e.emp_no, e.last_name, e.first_name
	from employees as e
	left join dept_emp as de
	on e.emp_no=de.emp_no
	inner join departments as d
	on d.dept_no=de.dept_no
	where lower(d.dept_name) = 'sales';

-List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name (4 points)
	select  e.emp_no, e.last_name, e.first_name, d.dept_name
	from employees as e
	inner join dept_emp AS de
	on e.emp_no=de.emp_no
	inner join departments AS d
	on de.dept_no=d.dept_no
	where (lower(d.dept_name) = 'sales') or (lower(d.dept_name) = 'development');

-List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name) (4 points)
	select last_name,count(last_name) as Frequency 
	from employees 
	group by last_name
	order by frequency desc;