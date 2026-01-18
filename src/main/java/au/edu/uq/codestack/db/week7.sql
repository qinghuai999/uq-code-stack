-- 2025-09-22 17:51:59

-- 1. Return the distinct role ID, name and descriptions of all roles which permit access to commercial websites (where the URI ends with “.com”).
SELECT r.role_id, r.name, p.website_url FROM permission p join role r ON r.role_id = p.role_id WHERE p. website_url LIKE '%.com';

-- 2. Return the First Name, Last Name, Level, Type and Salary of all Administrative Employees.
SELECT a.employee_id, e.first_name, e.last_name, e.salary 
FROM administrative_employee a 
JOIN employee e 
ON a.employee_id = e.employee_id;

-- 3. For every role in the database, find the number of websites it gives access to.
SELECT role_id, COUNT(DISTINCT website_url) 
FROM permission 
GROUP BY role_id;

-- 4. For Employee Sofia Gonzalez, return the distinct name and description of the role(s) she was granted, along with the description of the associated permissions.
SELECT rg.role_id, r.name, r.description, p.description 
FROM role_granting rg 
JOIN role r
ON r.role_id = rg.role_id
JOIN permission p
ON p.role_id = r.role_id
WHERE rg.employee_id IN (
	SELECT employee_id 
	FROM employee 
	WHERE first_name = 'Sofia' 
	AND last_name = 'Gonzalez');

/* 
5. 
The co-founders of BestTechLtd can be identified as either:
A) Administrative Employees with a ‘LegacyEngineer’ type;
B) Employees who have been granted the FinancialPerformanceOverview role; or
C) Permissions to view https://grafana.besttechltd.com
Return the EmployeeID, first and last name of all co-founders.
*/
SELECT * FROM administrative_employee ae 
JOIN role_granting rg 
ON ae.employee_id = rg.employee_id 
JOIN permission p 
ON p.role_id = rg.role_id WHERE ae.type = 3 OR rg.role_id = (SELECT role_id FROM role WHERE name = 'FinancialPerformanceOverview') OR p.website_url = 'https://grafana.besttechltd.com';

SELECT e.employee_id, e.first_name, e.last_name
FROM employee e 
WHERE
	EXISTS (
		SELECT 1 
		FROM administrative_employee a
		WHERE a.employee_id = e.employee_id
		AND a.type = '3'
	)
	OR
	EXISTS (
		SELECT 1 
		FROM role_granting rg 
		JOIN role r 
		ON rg.role_id = r.role_id
		WHERE rg.employee_id = e.employee_id
		AND r.name = 'FinancialPerformanceOverview'
	)
	OR
	EXISTS (
		SELECT 1
		FROM permission p 
		JOIN role_granting rg 
		ON p.role_id = p.role_id
		WHERE rg.employee_id = e.employee_id
		AND p.website_url = 'https://grafana.besttechltd.com'
		AND grant_type = 2
	)

-- 6. Return the list of all employees who have been granted at least two roles, and also can edit more than four distinct websiteURIs.
SELECT e.employee_id, e.first_name, e.last_name FROM permission p
JOIN role_granting rg 
ON p.role_id = rg.role_id
JOIN employee e 
ON rg.employee_id = e.employee_id
WHERE p.grant_type = 2 
AND rg.employee_id IN (
	SELECT employee_id 
	FROM role_granting 
	GROUP BY employee_id 
	HAVING COUNT(role_id) > 2)
GROUP BY employee_id HAVING count(website_url) > 2;



-- Task 1a
SELECT c.CustomerID, c.`Name`, COUNT(distinct p.PolicyID) 
FROM Customer c
LEFT JOIN Policy p 
ON c.CustomerID = p.CustomerID
GROUP BY c.CustomerID;

-- Task 1b


-- Task 2
SELECT v.VehicleID 
FROM Vehicle v 
LEFT JOIN Policy p 
ON v.VehicleID = p.VehicleID
WHERE v.VehicleCode = 
	(SELECT VehicleCode
	FROM VehicleCodeMapping 
	WHERE (
		Model LIKE 'T%' 
		OR Make LIKE 'T%'
		)
		AND `Year` >= 2022)
AND p.PolicyPurchaseDate >= '2022-06-30';

-- Task 3
SELECT distinct p.CustomerID
FROM  Policy p 
JOIN Vehicle v 
ON p.VehicleID = v.VehicleID
JOIN VehicleCodeMapping vm 
ON vm.VehicleCode = v.VehicleCode
WHERE vm.Make = 'Tesla'
GROUP BY p.CustomerID
HAVING COUNT(DISTINCT vm.Model) = 6;

-- Task 4
SELECT DISTINCT p.CustomerID  
FROM Policy p 
JOIN Vehicle v 
ON p.VehicleID = v.VehicleID
JOIN VehicleCodeMapping vm 
ON vm.VehicleCode = v.VehicleCode
WHERE vm.Make = 'Tesla' 
GROUP BY p.CustomerId
HAVING COUNT(DISTINCT vm.Make) = 
	(SELECT count(VehicleCode) FROM VehicleCodeMapping
	WHERE Make = 'Tesla');



	


	












