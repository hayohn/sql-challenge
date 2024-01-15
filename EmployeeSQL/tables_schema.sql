CREATE TABLE departments (
    dept_no VARCHAR(10) PRIMARY KEY,
    dept_name VARCHAR(255) UNIQUE
);

CREATE TABLE dept_emp (
    emp_no VARCHAR(10),
    dept_no VARCHAR(10),
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager (
    dept_no VARCHAR(10),
    emp_no VARCHAR(10),
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE employees (
    emp_no VARCHAR(10) PRIMARY KEY,
    emp_title_id VARCHAR(10),
    birth_date DATE,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    sex CHAR(1),
    hire_date DATE
);

CREATE TABLE salaries (
    emp_no VARCHAR(10) PRIMARY KEY,
    salary INT,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE titles (
    title_id VARCHAR(10) PRIMARY KEY,
    title VARCHAR(255) UNIQUE
);

COPY departments FROM '/Users/owner/Library/CloudStorage/OneDrive-Personal/EmployeeSQL/data/departments.csv' DELIMITER ',' CSV HEADER;

COPY dept_emp FROM '/Users/owner/Library/CloudStorage/OneDrive-Personal/EmployeeSQL/data/dept_emp.csv' DELIMITER ',' CSV HEADER;

COPY dept_manager FROM '/Users/owner/Library/CloudStorage/OneDrive-Personal/EmployeeSQL/data/dept_manager.csv' DELIMITER ',' CSV HEADER;

COPY employees FROM '/Users/owner/Library/CloudStorage/OneDrive-Personal/EmployeeSQL/data/employees.csv' DELIMITER ',' CSV HEADER;

COPY salaries FROM '/Users/owner/Library/CloudStorage/OneDrive-Personal/EmployeeSQL/data/salaries.csv' DELIMITER ',' CSV HEADER;

COPY titles FROM '/Users/owner/Library/CloudStorage/OneDrive-Personal/EmployeeSQL/data/titles.csv' DELIMITER ',' CSV HEADER;


