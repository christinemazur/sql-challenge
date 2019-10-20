-- drop table dept;
-- drop table emp;
-- drop table salary;
-- drop table titles;
-- drop table dept_emp;
-- drop table dept_mgr;

CREATE TABLE dept
( dept_no varchar NOT NULL,
  dept_name char(30) NOT NULL,
  CONSTRAINT dept_pk PRIMARY KEY (dept_no)
);

CREATE TABLE emp
( emp_no int NOT NULL,
  birth_date varchar(20) NOT NULL,
  first_name varchar(30) NOT NULL,
  last_name varchar(30) NOT NULL,
  gender varchar(5) NOT NULL,
  hire_date varchar(20) NOT NULL,
  CONSTRAINT empno_pk PRIMARY KEY (emp_no)
);

CREATE TABLE salary
( emp_no int NOT NULL,
  salary int NOT NULL,
  from_date varchar(20) NOT NULL,
  to_date varchar(20) NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES emp(emp_no)
);

CREATE TABLE titles
( emp_no int NOT NULL,
  title varchar NOT NULL,
  from_date varchar(20) NOT NULL,
  to_date varchar(20) NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES emp(emp_no)
);

CREATE TABLE dept_emp
( emp_no int NOT NULL,
  dept_no varchar NOT NULL,
  from_date varchar(20) NOT NULL,
  to_date varchar(20) NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES emp(emp_no),
  FOREIGN KEY (dept_no) REFERENCES dept(dept_no)
);

CREATE TABLE dept_mgr
( dept_no varchar NOT NULL,
  emp_no int NOT NULL,
  from_date varchar(20) NOT NULL,
  to_date varchar(20) NOT NULL,
  PRIMARY KEY (dept_no, emp_no)
);
select * from dept;
select * from dept_emp;
select * from dept_mgr;
select * from emp;
select * from salary;
select * from titles;

--List the following details of each employee: employee number, last name, first name, gender, and salary.
select salary.salary, emp.emp_no, emp.last_name, emp.first_name, gender from emp
		inner join salary on
		salary.emp_no = emp.emp_no;
-- List employees who were hired in 1986.
select * from emp
		inner join dept_emp on
		dept_emp.emp_no = emp.emp_no
		where (dept_emp.from_date) like '%1986%';
		
-- List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
select dept_mgr.dept_no, dept.dept_name, dept_mgr.emp_no, emp.last_name, emp.first_name, salary.from_date, salary.to_date
	from dept_mgr
	right join dept on dept.dept_no = dept_mgr.dept_no
	join emp on emp.emp_no = dept_mgr.emp_no
	join salary on salary.emp_no = dept_mgr.emp_no; 

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
select emp.emp_no, emp.last_name, emp.first_name, dept_emp.dept_no, dept.dept_name
	from emp
	join dept on dept.dept_no = dept_mgr.dept_no
	join dept_emp on dept_emp.dept_no = dept.dept_no;
-- List all employees whose first name is "Hercules" and last names begin with "B."
select emp.emp_no, emp.last_name, emp.first_name
from emp
where emp.first_name = 'Hercules' and emp.last_name LIKE 'B%'
-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
select emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
from dept_emp
join dept on dept.dept_no = dept_emp.dept_no
join emp on dept_emp.emp_no = emp.emp_no
where dept.dept_name = 'Sales'
-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
from dept_emp
join dept on dept.dept_no = dept_emp.dept_no
join emp on dept_emp.emp_no = emp.emp_no
where dept.dept_name = 'Sales'or dept.dept_name = 'Development'
-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, COUNT (last_name) from emp
GROUP BY last_name 
