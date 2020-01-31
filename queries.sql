--combine salary and employee on employee number to get salary with all employee info
SELECT E.emp_no, E.first_name, E.last_name, E.gender, S.salary
FROM employees E
INNER JOIN salaries S ON S.emp_no = E.emp_no
ORDER BY E.emp_no ASC;

--List employees hired in 1986
SELECT * FROM employees 
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, 
--first name, and start and end employment dates.
SELECT DM.dept_no, D.dept_name, DM.emp_no, E.last_name, E.first_name, E.hire_date, DM.to_date
FROM department_manager DM
INNER JOIN department D ON D.dept_no = DM.dept_no
INNER JOIN employees E ON E.emp_no = DM.emp_no;

--List the department of each employee with the following information: employee number, 
--last name, first name, and department name.
SELECT E.emp_no, E.last_name, E.first_name, D.dept_name
FROM employees E
JOIN department_emp DE ON E.emp_no = DE.emp_no
LEFT JOIN department D ON DE.dept_no = D.dept_no;

--List all employees whose first name is "Hercules" and last names begin with "B."
SELECT * FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, 
--last name, first name, and department name
SELECT E.emp_no, E.last_name, E.first_name, D.dept_name
FROM employees E
INNER JOIN department_emp DE on DE.emp_no = E.emp_no
INNER JOIN department D ON D.dept_no = DE.dept_no
WHERE D.dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their 
--employee number, last name, first name, and department name.
SELECT DE.emp_no, E.last_name, E.first_name, D.dept_name
FROM department_emp DE
INNER JOIN employees E ON E.emp_no = DE.emp_no
INNER JOIN department D ON DE.dept_no = D.dept_no
WHERE D.dept_name = 'Sales' OR D.dept_name = 'Development';


--Descending order, list the frequency count of employee last names, i.e., 
--how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "TOTAL_NAME_OCCURENCE"
FROM employees
GROUP BY last_name
ORDER BY 2 DESC;




