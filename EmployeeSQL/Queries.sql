--List employee details (employee number, last name, first name, sex, and salary):
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no;

--List employees hired in 1986 (first name, last name, and hire date):
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

--List managers of each department with additional details:
SELECT dm.emp_no AS manager_emp_no, m.last_name AS manager_last_name, m.first_name AS manager_first_name,
       d.dept_no, d.dept_name, e.emp_no AS employee_emp_no, e.last_name AS employee_last_name, e.first_name AS employee_first_name
FROM departments d
JOIN dept_manager dm ON d.dept_no = dm.dept_no
JOIN employees e ON dm.emp_no = e.emp_no
JOIN employees m ON dm.emp_no = m.emp_no;

--List department number for each employee along with their details:
SELECT d.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
JOIN employees e ON de.emp_no = e.emp_no
JOIN departments d ON de.dept_no = d.dept_no;

--SELECT first_name, last_name, sex
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--List Sales department employees:
SELECT e.emp_no, e.last_name, e.first_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

--List Sales and Development department employees:
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');

--Frequency counts of employee last names (descending order):
SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;