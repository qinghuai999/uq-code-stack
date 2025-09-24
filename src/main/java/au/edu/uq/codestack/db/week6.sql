-- 2025-09-21 13:22:30
-- 1. Return the youngest Employee's Date Of Birth.
SELECT * FROM employee order by birthday DESC LIMIT 1;
-- 2. For each website URI, find the number of roles that can access it.
SELECT p.website_url, p.role_id, r.name FROM permission p 
LEFT JOIN role r 
ON r.role_id = p.role_id;

-- 3. Return all last names that are shared by multiple employees.
SELECT last_name, COUNT(*) FROM employee GROUP BY last_name HAVING COUNT(*) > 1;

-- 4. Return the highest AdministrativeEmployee level, the lowest AdministrativeEmployee Level and the difference between both levels.
SELECT MAX(admin_level) as high, MIN(admin_level) as low, MAX(admin_level) - MIN(admin_level) as difference FROM administrative_employee;

/*
5
1. What will you observe when using an aggregation function without a GROUP BY clause?
Why?
2. What will you observe when performing an aggregation function over the primary key or
unique fields in a table? Why?
*/
-- 1. Whtiout group by, aggregation treats the entire table as one group, result is a single row.
-- 2. count(column) = number of rows, because no nulls. count(distinct column) also number of rows.
-- 		max, min, sum, avg behave normally, but uniqueness doesn't change their semantics.

-- 6. Return the average salary of Employees born after January 1st, 1990.
DESCRIBE employee;
SELECT AVG(salary) FROM employee WHERE birthday > '1990-01-01';

-- 7. Return the roleID of all roles which have at two associated website URI's with a grantType of Edit
SELECT role_id FROM permission WHERE grant_type = 2 GROUP BY role_id HAVING COUNT(DISTINCT website_url) >= 2;



-- Task 1a
SELECT VehiclePurpose, COUNT(*) as total FROM Vehicle GROUP BY VehiclePurpose ORDER BY total DESC;

-- Task 1b
SELECT VehicleID, VehiclePurpose FROM Vehicle ORDER BY VehicleID, VehiclePurpose;

SELECT
	SUM(CASE WHEN VehiclePurpose = 'Private' THEN 1 ELSE 0 END) AS private_cnt,
	SUM(CASE WHEN VehiclePurpose = 'Business' THEN 1 ELSE 0 END) AS business_cnt 
FROM Vehicle;

-- Task 2
SELECT CustomerID, COUNT(*) AS num FROM Policy GROUP BY CustomerID HAVING num >= 2 ORDER BY num DESC, CustomerID;

-- Task 3
SELECT Suburb as suburb_name, COUNT(*) as street_count FROM Address group by suburb_name ORDER BY street_count desc LIMIT 2;

-- Tast 4a
SELECT * FROM Customer WHERE AddressID = (SELECT AddressID FROM Address where SUBSTRING_INDEX(StreetName,' ',1) like '%et%')

SELECT StreetName FROM Address s JOIN Customer c ON s.AddressID = c.AddressID WHERE StreetName LIKE '%et%' GROUP BY s.StreetName;

SELECT a.StreetName, COUNT(DISTINCT c.CustomerID) AS customer_count
FROM Customer c
JOIN Address  a ON a.AddressID = c.AddressID
WHERE LOWER(a.StreetName) LIKE '%et%'
GROUP BY a.StreetName
HAVING COUNT(DISTINCT c.CustomerID) >= 2
ORDER BY a.StreetName;
-- Task 4b
