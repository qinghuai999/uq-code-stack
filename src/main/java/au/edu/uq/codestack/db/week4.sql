CREATE TABLE emp (
	eid INTEGER PRIMARY KEY,
	ename VARCHAR(50) NOT NULL,
	age INTEGER DEFAULT 0,
	salary NUMERIC(10,2) constraint chk_salary CHECK (salary > 1000));
	
CREATE TABLE dept (
	did INTEGER PRIMARY KEY,
	dname VARCHAR(50) NOT NULL,
	budget NUMERIC(30,2) DEFAULT 0,
	managerid INTEGER, 
	CONSTRAINT fk_dept_emp_id FOREIGN KEY (managerid) REFERENCES emp(eid));
	
CREATE TABLE works (
	eid INTEGER,
	did INTEGER,
	pcttime INTEGER CONSTRAINT chk_percentage CHECK (0 <= pcttime <= 100),
	CONSTRAINT pk_eid_did PRIMARY KEY(eid, did));

ALTER TABLE dept DROP FOREIGN KEY fk_dept_emp_id,
ALTER TABLE dept ADD CONSTRAINT fk_dept_emp_id FOREIGN KEY (managerid) REFERENCES emp(eid)
ON DELETE CASCADE; -- ON DELETE SET NULL;
ALTER TABLE works ADD CONSTRAINT fk_works_emp_id FOREIGN KEY (eid) REFERENCES emp(eid);
ALTER TABLE works ADD CONSTRAINT fk_works_dept_id FOREIGN KEY (did) REFERENCES dept(did);
-- Trigger

CREATE TRIGGER control_salary
BEFORE UPDATE 
ON emp 
FOR EACH ROW
BEGIN
	IF new.salary < old.salary THEN
	SIGNAL SQLSTATE '45000'
	SET message_text = 'Salary cannot be reduced';
	END IF;
END


ALTER TABLE dept ADD CONSTRAINT chk_manager_age CHECK managerid IN (SELECT eid from emp WHERE age > 30);
ALTER TABLE dept DROP CONSTRAINT fk_dept_emp_id;
ALTER TABLE dept ADD CONSTRAINT fk_dept_emp_id FOREIGN KEY (managerid) REFERENCES emp(eid);
CREATE TRIGGER check_manager_age
BEFORE INSERT ON dept 
FOR EACH ROW 
BEGIN 
	DECLARE mgr_age INTEGER;
	SELECT age into mgr_age FROM emp WHERE eid = new.managerid;
	IF mgr_age <= 30 THEN
	SIGNAL SQLSTATE '45000'
	SET message_text = 'Manager must be older than 30';
	END IF;
END;

CREATE TRIGGER chk_manager_age_update
BEFORE UPDATE ON dept
FOR EACH ROW
BEGIN
  DECLARE mgr_age INT;
  SELECT age INTO mgr_age FROM emp WHERE eid = NEW.managerid;
  IF mgr_age <= 30 THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Manager must be older than 30';
  END IF;
END;

insert into emp values (1, 'Kiki', 25, 100000);
insert into dept values (1, 'IT', 300000, 1);


SELECT DATABASE();

CREATE DATABASE kiki;
 USE kiki;