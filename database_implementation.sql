CREATE TABLE departments (
    dnum INTEGER PRIMARY KEY,
    dname VARCHAR(50)
);

CREATE TABLE employees (
    ssn VARCHAR(11) PRIMARY KEY,
    fname VARCHAR(50),
    lname VARCHAR(50),
    birth_date DATE,
    gender VARCHAR(1),
    dnum INTEGER NOT NULL,
    supervisor_ssn VARCHAR(11),
    FOREIGN KEY (dnum) REFERENCES departments(dnum),
    FOREIGN KEY (supervisor_ssn) REFERENCES employees(ssn)
);

CREATE TABLE department_locations (
    dnum INTEGER,
    location VARCHAR(50),
    PRIMARY KEY (dnum, location),
    FOREIGN KEY (dnum) REFERENCES departments(dnum)
);

CREATE TABLE projects (
    pnumber INTEGER PRIMARY KEY,
    pname VARCHAR(100),
    location VARCHAR(50),
    city VARCHAR(50),
    dnum INTEGER NOT NULL,
    FOREIGN KEY (dnum) REFERENCES departments(dnum)
);

CREATE TABLE works_on (
    ssn VARCHAR(11),
    pnumber INTEGER,
    working_hours INTEGER,
    PRIMARY KEY (ssn, pnumber),
    FOREIGN KEY (ssn) REFERENCES employees(ssn),
    FOREIGN KEY (pnumber) REFERENCES projects(pnumber)
);

CREATE TABLE manages (
    dnum INTEGER PRIMARY KEY,
    ssn VARCHAR(11),
    hire_date DATE,
    FOREIGN KEY (dnum) REFERENCES departments(dnum),
    FOREIGN KEY (ssn) REFERENCES employees(ssn)
);

CREATE TABLE dependents (
    dependent_id INTEGER IDENTITY(1,1) PRIMARY KEY,
    employee_ssn VARCHAR(11) NOT NULL,
    dependent_name VARCHAR(50),
    gender VARCHAR(1),
    birth_date DATE,
    FOREIGN KEY (employee_ssn) REFERENCES employees(ssn)
);