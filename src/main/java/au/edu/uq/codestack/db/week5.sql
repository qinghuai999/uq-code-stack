-- week5 2025-09-21 17:12:04

-- Create tables
CREATE TABLE employee (
	employee_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	birthday DATE,
	password_hash VARCHAR(50),
	password_salt VARCHAR(100),
	create_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	update_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;
ALTER TABLE employee MODIFY COLUMN password_hash VARCHAR(50) NOT NULL COMMENT 'Result of hashing the user’s password';
ALTER TABLE employee MODIFY COLUMN password_salt VARCHAR(100) NOT NULL COMMENT 'A random string added to the password before hashing.';
ALTER TABLE employee MODIFY COLUMN password_hash VARCHAR(255);
ALTER TABLE employee ADD COLUMN salary FLOAT DEFAULT 0.0;
INSERT INTO employee (first_name, last_name, birthday, password_hash, password_salt, salary)
VALUES
('Sofia', 'Gonzalez', '1992-05-14', 'hash1', 'salt1', 60000.00),
('Mei', 'Chen', '1985-09-22', 'hash2', 'salt2', 75000.00),
('John', 'Stevens', '1980-03-10', 'hash3', 'salt3', 80000.00),
('Alice', 'Wong', '1990-07-18', 'hash4', 'salt4', 70000.00),
('James', 'Moran', '2001-11-21', 'hash5', 'salt5', 55000.00),
('Carlos', 'Diaz', '1975-01-05', 'hash6', 'salt6', 90000.00);
INSERT INTO employee (first_name, last_name, birthday, password_hash, password_salt)
VALUES
('Alice','Wong','1992-03-11','hash1','salt1'),
('Bob','Smith','1989-07-22','hash2','salt2'),
('Carol','Johnson','1995-01-05','hash3','salt3'),
('David','Brown','1990-10-18','hash4','salt4'),
('Eve','Davis','1993-05-27','hash5','salt5'),
('Frank','Miller','1988-12-09','hash6','salt6'),
('Grace','Wilson','1996-04-14','hash7','salt7'),
('Hank','Moore','1991-02-02','hash8','salt8'),
('Ivy','Taylor','1994-09-29','hash9','salt9'),
('Jack','Anderson','1987-11-15','hash10','salt10'),
('Kara','Thomas','1992-06-30','hash11','salt11'),
('Leo','Jackson','1990-08-08','hash12','salt12'),
('Mia','White','1997-01-21','hash13','salt13'),
('Noah','Harris','1986-03-03','hash14','salt14'),
('Olivia','Martin','1993-12-12','hash15','salt15'),
('Paul','Thompson','1991-07-07','hash16','salt16'),
('Quinn','Garcia','1995-10-10','hash17','salt17'),
('Ruby','Martinez','1996-11-23','hash18','salt18'),
('Sam','Robinson','1989-04-04','hash19','salt19'),
('Tina','Clark','1994-02-17','hash20','salt20');

INSERT INTO employee (first_name, last_name, birthday, password_hash, password_salt, salary)
VALUES
('Alice',   'Wong',    '1985-03-15', 'hash1', 'salt1', 55000.00),  -- before 1990
('Bob',     'Smith',   '1992-07-21', 'hash2', 'salt2', 60000.00),  -- after 1990
('Carol',   'Johnson', '1995-11-02', 'hash3', 'salt3', 72000.00),  -- after 1990
('David',   'Lee',     '1988-01-10', 'hash4', 'salt4', 50000.00),  -- before 1990
('Eva',     'Miller',  '1993-05-19', 'hash5', 'salt5', 65000.00);  -- after 1990

CREATE TABLE administrative_employee(
	employee_id BIGINT UNSIGNED NOT NULL PRIMARY KEY,
	admin_level INT NOT NULL,
	type INT NOT NULL,
	CONSTRAINT fk_admin_emp_id FOREIGN KEY (employee_id) 
	REFERENCES employee(employee_id) ON DELETE CASCADE
) ENGINE=InnoDB;

INSERT INTO administrative_employee (employee_id, admin_level, `type`)
VALUES
(1,1,1),(2,2,1),(3,3,2),(4,1,2),(5,2,2),
(6,3,1),(7,1,1),(8,2,1),(9,3,2),(10,2,1),
(11,1,2),(12,2,2),(13,3,1),(14,2,1),(15,1,1),
(16,3,2),(17,2,2),(18,1,2),(19,3,1),(20,2,1);

CREATE TABLE role(
	role_id INT UNSIGNED NOT NULL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	description VARCHAR(255) NOT NULL COMMENT 'Describe the role\'s function'
) ENGINE=InnoDB;
INSERT INTO role (role_id, name, description)
VALUES
(21, 'HRManager', 'Manage HR processes'),
(22, 'EventCoordinator', 'Coordinate student and staff events'),
(23, 'FinancialPerformanceOverview', 'Access to financial dashboards'),
(24, 'SystemEngineer', 'Maintain IT systems'),
(25, 'DataAnalyst', 'Analyze business data');
INSERT INTO role (role_id, name, description)
VALUES
(1,'Viewer','Read-only access'),
(2,'Editor','Edit content'),
(3,'Admin','Full admin rights'),
(4,'Auditor','Read logs & reports'),
(5,'DevOps','Deploy & monitor'),
(6,'HR','HR operations'),
(7,'Finance','View financial data'),
(8,'Analyst','BI analytics access'),
(9,'Support','Customer support tools'),
(10,'Marketing','Campaign management'),
(11,'Sales','Sales dashboard'),
(12,'QA','Quality assurance tools'),
(13,'ContentMgr','Content management'),
(14,'Security','Security console'),
(15,'DataEng','Data pipeline ops'),
(16,'Product','Product management'),
(17,'Legal','Legal docs access'),
(18,'Vendor','Third-party portal'),
(19,'Intern','Limited sandbox'),
(20,'Research','Research datasets');

CREATE TABLE role_granting(
	employee_id BIGINT UNSIGNED NOT NULL,
	role_id INT UNSIGNED NOT NULL,
	admin_id BIGINT UNSIGNED NOT NULL COMMENT 'The employee is admin',
	granted_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (employee_id, role_id, admin_id),
	CONSTRAINT fk_grant_emp_id FOREIGN KEY (employee_id) 
	REFERENCES employee(employee_id),
	CONSTRAINT fk_grant_role_id FOREIGN KEY (role_id) 
	REFERENCES role(role_id),
	CONSTRAINT fk_grant_admin_id FOREIGN KEY (admin_id) 
	REFERENCES administrative_employee(employee_id) ON DELETE CASCADE
)ENGINE=InnoDB;
INSERT INTO role_granting (employee_id, role_id, admin_id)
VALUES
-- Sofia Gonzalez gets HRManager & EventCoordinator from Mei Chen
(27, 21, 2),
(27, 22, 2),

-- James Moran gets the same roles as Sofia, also from Mei Chen
(5, 21, 2),
(5, 22, 2),

-- Carlos Diaz gets FinancialPerformanceOverview from John Stevens
(6, 23, 3);
INSERT INTO role_granting (employee_id, role_id, admin_id)
VALUES
(1, 1, 3),
(2, 2, 3),
(3, 3, 5),
(4, 4, 2),
(5, 5, 6),
(6, 6, 1),
(7, 7, 10),
(8, 8, 11),
(9, 9, 12),
(10,10, 4),
(11,11, 9),
(12,12, 8),
(13,13, 7),
(14,14,15),
(15,15,14),
(16,16,13),
(17,17,18),
(18,18,17),
(19,19,20),
(20,20,19);

CREATE TABLE permission(
	website_url VARCHAR(255) NOT NULL,
	role_id INT UNSIGNED NOT NULL,
	grant_type INT NOT NULL,
	description VARCHAR(255) NOT NULL,
	PRIMARY KEY(website_url, role_id),
	CONSTRAINT fk_permission_role_id FOREIGN KEY (role_id)
	REFERENCES role(role_id)
)ENGINE=InnoDB;
INSERT INTO permission (website_url, role_id, grant_type, description)
VALUES
('https://hr.besttechltd.com', 21, 2, 'Edit HR information'),
('https://events.besttechltd.com', 22, 1, 'View event listings'),
('https://events.besttechltd.com/manage', 22, 2, 'Manage events'),
('https://finance.besttechltd.com/dashboard', 23, 1, 'View financial performance'),
('https://grafana.besttechltd.com', 23, 1, 'View Grafana dashboards'),
('https://systems.besttechltd.com', 24, 2, 'Edit system configs'),
('https://data.besttechltd.com', 25, 1, 'View analytics data');
INSERT INTO permission (website_url, role_id, grant_type, description)
VALUES
('https://intranet.uq.edu.au/hr',        1, 2, 'HR portal edit access'),
('https://intranet.uq.edu.au/payroll',   1, 2, 'Payroll edit access'),
('https://intranet.uq.edu.au/profile',   1, 1, 'Profile view access'),

('https://library.uq.edu.au/search',     2, 1, 'Library search view access'),
('https://library.uq.edu.au/admin',      2, 2, 'Library admin edit access'),

('https://events.uq.edu.au/manage',      3, 2, 'Event management edit access'),
('https://events.uq.edu.au/report',      3, 2, 'Event report edit access'),
('https://events.uq.edu.au/public',      3, 1, 'Event public view access');
INSERT INTO permission (website_url, role_id, grant_type, description)
VALUES
('https://intra.besttech.com/dashboard', 1,  1, 'Viewer dashboard'),
('https://intra.besttech.com/dashboard', 2,  2, 'Editor dashboard'),
('https://intra.besttech.com/admin',     3,  3, 'Admin console'),
('https://intra.besttech.com/logs',      4,  1, 'Audit logs'),
('https://deploy.besttech.com',          5,  2, 'Deploy system'),
('https://hr.besttech.com',              6,  2, 'HR portal'),
('https://fin.besttech.com',             7,  1, 'Finance portal'),
('https://bi.besttech.com',              8,  2, 'Analytics BI'),
('https://support.besttech.com',         9,  2, 'Support tools'),
('https://mkt.besttech.com',            10,  2, 'Marketing suite'),
('https://sales.besttech.com',          11,  2, 'Sales dashboard'),
('https://qa.besttech.com',             12,  2, 'QA tools'),
('https://cms.besttech.com',            13,  2, 'Content management'),
('https://sec.besttech.com',            14,  3, 'Security console'),
('https://data.besttech.com',           15,  2, 'Data pipelines'),
('https://product.besttech.com',        16,  2, 'Product portal'),
('https://legal.besttech.com',          17,  1, 'Legal docs'),
('https://vendor.besttech.com',         18,  1, 'Vendor portal'),
('https://intern.besttech.com',         19,  1, 'Intern sandbox'),
('https://research.besttech.com',       20,  2, 'Research datasets');

-- Return all the roles in the database
SELECT * FROM role;

-- Return the distinct first name and last name of all employees, in descending alphabetical order of their last name.
SELECT distinct first_name, last_name FROM employee ORDER BY last_name desc;

-- Return all the Permission websiteURI's which grant edit permissions to commercial websites.
SELECT website_url FROM permission WHERE grant_type = 2 AND website_url like '%.com%';

/** 
4. (Challenge) Create an Employee code, which is the combination of the employees 
first name, last name, and DOB year with the syntax [FirstName]-[Lastname]-[yyyy]. 
Create the code ONLY if a first name, last name, and Date Of Birth is present
*/
SELECT 
	CONCAT(first_name,'-', last_name, '-', YEAR(birthday)) AS employee_code 
FROM employee
WHERE first_name IS NOT NULL
AND last_name IS NOT NULL
AND birthday IS NOT NULL;


-- 5. Create a new table for the emp and role.
CREATE TABLE legacy_employee(
	legacy_emp_id BIGINT UNSIGNED NOT NULL PRIMARY KEY,
	grant_access_token VARCHAR(255) NOT NULL,
	role_id INT UNSIGNED NOT NULL,
	CONSTRAINT fk_legacy_admin_id FOREIGN KEY (legacy_emp_id)
	REFERENCES administrative_employee(employee_id),
	CONSTRAINT fk_legacy_role_id FOREIGN KEY (role_id)
	REFERENCES role(role_id)
)ENGINE=InnoDB;

-- 6. Create a new table for password.
CREATE TABLE credential(
	credential_id BIGINT UNSIGNED NOT NULL PRIMARY KEY,
	password_hash VARCHAR(50),
	password_salt VARCHAR(100),
	create_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	update_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	CONSTRAINT fk_credential_emp_id FOREIGN KEY (credential_id)
	REFERENCES employee(employee_id) ON DELETE CASCADE
)ENGINE=InnoDB;

-- 7. Delete all roles granted to employee_id E0008
DELETE FROM role_granting WHERE employee_id = 8;

/**
8. Delete the role(s) that were granted to John Stevens from Mei Chen at any
time during the day of 22nd July, 2024. You can assume such a role exists, and only one
John Stevens and Mei Chen exist in the database.
*/
SELECT frist_name, last_name FROM employee e JOIN employee a a.first_name = 'Meichen' on e.employee_id = a.employee_id WHERE \
SELECT role_id FROM role_granting g 
WHERE granted_at >= '2024-07-22 00:00:00' AND granted_at <  '2024-07-23 00:00:00'
AND admin_id = (SELECT employee_id FROM employee WHERE first_name = 'Chen' AND last_name = 'Mei') 
AND employee_id = (SELECT employee_id FROM employee WHERE first_name = 'John' AND last_name = 'Stevens')


-- 9. insert a new employee and add related authority.
INSERT INTO employee (first_name, last_name, birthday, password_hash, password_salt) 
VALUES ('James', 'Moran', '2001-11-21', 'e7cf3ef8d8aac2c1c93963e7a58b7b62ade24d0d0ba2c8ae0f7fb6c8b0aa0332', 'gmAlpLW8cUj');

SELECT role_id FROM role_granting WHERE employee_id = (SELECT employee_id FROM employee WHERE first_name = 'David');
INSERT INTO role_granting (employee_id, role_id, admin_id) VALUES (21, 4, 2)

DESCRIBE employee;


-- Module3 - Task1
CREATE DATABASE easy_drive;
DROP DATABASE easy_drive;

CREATE TABLE customers(
	customer_id INT UNSIGNED NOT NULL auto_increment PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	birthday DATE NOT NULL,
	email VARCHAR(50) NOT NULL,
	occupation VARCHAR(50) DEFAULT '',
	address VARCHAR(255)
)ENGINE=InnoDB;
RENAME TABLE customers to customer2;
ALTER TABLE customer2 RENAME COLUMN address to address_id;
ALTER TABLE customer2 MODIFY COLUMN address_id INT UNSIGNED;

CREATE TABLE address2(
	address_id INT UNSIGNED NOT NULL auto_increment PRIMARY KEY,
	street_name VARCHAR(100) NOT NULL,
	number INT NOT NULL,
	suburb VARCHAR(50) NOT NULL,
	postcode INT NOT NULL,
	state VARCHAR(50) NOT NULL,
	country VARCHAR(50) NOT NULL
)ENGINE=InnoDB;

INSERT INTO vehicle2 VALUES (1, 'E12', 'xxx', 2.5);
CREATE TABLE vehicle2(
	vehicle_id INT UNSIGNED NOT NULL auto_increment PRIMARY KEY,
	vehicle_code VARCHAR(50) NOT NULL,
	vehicle_purpose VARCHAR(50) NOT NULL,
	est_yearly_km FLOAT DEFAULT 0.0
)ENGINE=InnoDB;

INSERT INTO vehicle_type2 VALUES ('E12', 'xxx', 'xxx', 2024, 25.26);
CREATE TABLE vehicle_type2(
	vehicle_code VARCHAR(50) NOT NULL PRIMARY KEY,
	make VARCHAR(50) NOT NULL,
	model VARCHAR(50) NOT NULL,
	year INT NOT NULL,
	market_value FLOAT NOT NULL
)ENGINE=InnoDB;

INSERT INTO policy2 VALUES (1, 1, 1, '2024-12-20', '2025-01-01', 20, 99.9);

CREATE TABLE policy2(
	policy_id INT UNSIGNED NOT NULL PRIMARY KEY,
	customer_id INT NOT NULL,
	vehicle_id INT NOT NULL,
	policy_start_year DATE NOT NULL,
	policy_purchase_date DATE NOT NULL,
	excess INT NOT NULL,
	premium FLOAT NOT NULL
)ENGINE=InnoDB;
ALTER TABLE policy2 
MODIFY COLUMN customer_id INT UNSIGNED NOT NULL,
MODIFY COLUMN vehicle_id INT UNSIGNED NOT NULL;
ALTER TABLE customer2 ADD CONSTRAINT fk_cus_address_id FOREIGN KEY (address_id)
REFERENCES address2(address_id);

ALTER TABLE policy2 ADD CONSTRAINT fk_policy_vehicle_id FOREIGN KEY (vehicle_id)
REFERENCES vehicle2(vehicle_id);
ALTER TABLE policy2 ADD CONSTRAINT fk_cus_policy_id FOREIGN KEY (customer_id)
REFERENCES customer2(customer_id);
ALTER TABLE vehicle2 ADD CONSTRAINT fk_vehicle_type_code FOREIGN KEY (vehicle_code)
REFERENCES vehicle_type2(vehicle_code);

-- Task2
INSERT INTO customer2 VALUES (1, 'Allan', '2000-01-01', 'allan@uq, student', 'student', NULL);
UPDATE customer2 SET email = 'allan@uq' WHERE customer_id = 1;
-- Task3
INSERT INTO customer2 VALUES ('2sfsdf', 'Allan', '2000-01-01', 'allan@uq, student', 'student', NULL);

-- Task4
CREATE TABLE insurance_claim(
	claim_id INT UNSIGNED NOT NULL auto_increment PRIMARY KEY,
	policy_id INT UNSIGNED NOT NULL,
	claim_date DATETIME NOT NULL,
	claim_amount FLOAT NOT NULL,
	claim_status VARCHAR(50) NOT NULL COMMENT 'Pending, Approved, Rejected',
	claim_description VARCHAR(255) NOT NULL,
	CONSTRAINT fk_policy_insurance_id FOREIGN KEY (policy_id)
	REFERENCES policy2(policy_id),
	CONSTRAINT ck_insurance_status CHECK (claim_status IN ('Pending, Approved, Rejected'))
)ENGINE=InnoDB;
ALTER TABLE insurance_claim ADD CONSTRAINT ck_insurance_status CHECK (claim_status IN ('Pending', 'Approved', 'Rejected'));
-- Task5
INSERT INTO insurance_claim (policy_id, claim_date, claim_amount, claim_status, claim_description) 
VALUES (1, '2025-09-22', 66.66, 'Pending', 'xxxxxx');
SELECT * FROM insurance_claim;

-- Task6
ALTER TABLE customer2 ADD CONSTRAINT uni_email UNIQUE (email);
INSERT INTO customer2 VALUES (2, 'kiki', '2006-11-21', 'kiki@uq', 'student', NULL);

















