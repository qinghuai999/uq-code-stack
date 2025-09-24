Create TABLE puzzle (
	pname VARCHAR(50) primary KEY COMMENT 'Project Name',
	difficulty INT(1) COMMENT '1-Simple, 2-Advanced, 3-Hard',
	solution INT(1) DEFAULT 0 COMMENT '0-No Submit, 1-Submit'
);
ALTER TABLE puzzle 
MODIFY COLUMN solution INT(1) NOT NULL DEFAULT 0 COMMENT '0-No Submit, 1-Submit';
ALTER TABLE puzzle
MODIFY difficulty INT(1) not NULL COMMENT '1-Simple, 2-Advanced, 3-Hard';
ALTER TABLE puzzle 
MODIFY COLUMN solution VARCHAR(2000) NULL COMMENT 'Correct answer; user internally to verify submissions.';
INSERT INTO puzzle (pname, difficulty)
VALUES
('LC000001', 1),
('LC000002', 1),
('LC000003', 5),
('LC000004', 1),
('LC000005', 2),
('LC000006', 3),
('LC000007', 2),
('LC000008', 3),
('LC000009', 4),
('LC000010', 4);

select * from puzzle order by difficulty, pname;


CREATE TABLE solvers (
	reg_no INT PRIMARY KEY COMMENT 'Registation Number',
	password VARCHAR(50) NOT NULL COMMENT 'Password',
	name varchar(100) NOT NULL COMMENT 'User Name',
	registation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Registation Time',
	type INT(1) NOT NULL COMMENT '1-Student, 2-Teacher'
);
INSERT INTO solvers (reg_no, password, name, type)
VALUES
(2025080300001, 'DefaultPassword123', 'kiki', 1),
(2025080300002, 'DefaultPassword123', 'A', 1),
(2025080300003, 'DefaultPassword123', 'B', 2),
(2025080300004, 'DefaultPassword123', 'C', 1),
(2025080300005, 'DefaultPassword123', 'D', 2),
(2025080300006, 'DefaultPassword123', 'E', 1);
explain select  type, count(type) AS rtotal from solvers group by type having rtotal > 3;
UPDATE solvers 
SET name = 'Muffin'
WHERE reg_no = 2025080300003;



CREATE TABLE solved (
	reg_no INT PRIMARY KEY COMMENT 'Registation Number',
	pname VARCHAR(50) NOT NULL COMMENT 'Project Name FK',
	date_open TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Puzzle Open Time',
	date_solved TIMESTAMP DEFAULT NULL COMMENT 'Solve Time'
);
ALTER TABLE solved 
DROP PRIMARY KEY,
ADD COLUMN id INT NOT NULL auto_increment PRIMARY KEY FIRST,
ADD CONSTRAINT fk_solved_solvers_num FOREIGN KEY (reg_no) REFERENCES solvers(reg_no)

INSERT INTO solved (reg_no, pname)
VALUES
(2025080300001, 'LC000001'),
(2025080300001, 'LC000003'),
(2025080300001, 'LC000005'),
(2025080300001, 'LC000007'),
(2025080300003, 'LC000010'),
(2025080300003, 'LC000007'),
(2025080300003, 'LC000008'),
(2025080300003, 'LC000009'),
(2025080300004, 'LC000002'),
(2025080300005, 'LC000005'),
(2025080300006, 'LC000007');


CREATE TABLE student (
	reg_no INT PRIMARY KEY COMMENT 'Registation Number',
	year INT(1) NOT NULL COMMENT '1-First, 2-Second, 3-Junior, 4-Senior'
);
insert into student (reg_no, year)
VALUES
(2025080300001, 1),
(2025080300002, 3),
(2025080300004, 2),
(2025080300006, 4);
select * from solvers where type = 2


CREATE TABLE teacher (
	reg_no INT PRIMARY KEY COMMENT 'Registation Number',
	position INT(1) NOT NULL COMMENT '1-Professor, 2-Lecture, 3-Tutor, 4-Others'
);
INSERT INTO teacher (reg_no, position)
VALUES
(2025080300003, 2),
(2025080300005, 3);
ALTER TABLE solved ADD CONSTRAINT fk_solved_pname FOREIGN KEY (pname) REFERENCES puzzle(pname)

ALTER TABLE solvers MODIFY COLUMN reg_no BIGINT;
ALTER TABLE solved MODIFY COLUMN reg_no BIGINT;
ALTER TABLE student MODIFY COLUMN reg_no BIGINT;
ALTER TABLE teacher MODIFY column reg_no BIGINT;


SHOW create table solved;
describe solved;
DESCRIBE puzzle;
DESCRIBE solvers;
DESCRIBE student;
DESCRIBE teacher;

-- clear all data in the table
TRUNCATE TABLE Student;
-- Clear existing data first (optional)
DELETE FROM solved;
DELETE FROM student;
DELETE FROM teacher;
DELETE FROM puzzle;
DELETE FROM solvers;

-- 1. solvers (10 students, 5 teachers)
INSERT INTO solvers (reg_no, password, name, registation_date, type) VALUES
(2025080300001, 'pass1',  'Alice',         '2024-01-01 09:00:00', 1),
(2025080300002, 'pass2',  'Bob',           '2024-02-15 10:00:00', 1),
(2025080300003, 'pass3',  'Charlie',       '2024-03-10 11:00:00', 1),
(2025080300004, 'pass4',  'Diana',         '2024-01-20 08:00:00', 1),
(2025080300005, 'pass5',  'Ethan',         '2024-04-05 13:00:00', 1),
(2025080300006, 'pass6',  'Fiona',         '2024-04-15 14:30:00', 1),
(2025080300007, 'pass7',  'George',        '2024-05-01 09:30:00', 1),
(2025080300008, 'pass8',  'Hannah',        '2024-05-12 10:45:00', 1),
(2025080300009, 'pass9',  'Ivan',          '2024-06-01 11:15:00', 1),
(2025080300010, 'pass10', 'Whiz Kid',      '2024-02-25 14:00:00', 1),

(2025080300011, 'pass11', 'Prof. Smith',   '2024-01-05 08:30:00', 2),
(2025080300012, 'pass12', 'Dr. Johnson',   '2024-02-20 14:00:00', 2),
(2025080300013, 'pass13', 'Ms. Taylor',    '2024-03-18 15:00:00', 2),
(2025080300014, 'pass14', 'Mr. White',     '2024-04-10 09:00:00', 2),
(2025080300015, 'pass15', 'Dr. Green',     '2024-05-20 10:00:00', 2);

-- 2. student
INSERT INTO student (reg_no, year) VALUES
(2025080300001, 1),
(2025080300002, 2),
(2025080300003, 4),
(2025080300004, 3),
(2025080300005, 1),
(2025080300006, 2),
(2025080300007, 4),
(2025080300008, 3),
(2025080300009, 1),
(2025080300010, 1);

-- 3. teacher
INSERT INTO teacher (reg_no, position) VALUES
(2025080300011, 1),
(2025080300012, 2),
(2025080300013, 3),
(2025080300014, 4),
(2025080300015, 1);

-- 4. puzzle (8 puzzles)
INSERT INTO puzzle (pname, difficulty, solution) VALUES
('Puzzle A', 1, 'Answer A'),
('Puzzle B', 2, 'Answer B'),
('Puzzle C', 3, 'Answer C'),
('Puzzle D', 3, 'Answer D'),
('Puzzle E', 1, 'Answer E'),
('Puzzle F', 2, 'Answer F'),
('Puzzle G', 1, 'Answer G'),
('Puzzle H', 2, 'Answer H');

-- 5. solved (more volume)
INSERT INTO solved (reg_no, pname, date_open, date_solved) VALUES
-- First Year students solving
(2025080300001, 'Puzzle A', '2024-03-01 09:00:00', '2024-03-02 09:30:00'),
(2025080300001, 'Puzzle C', '2024-03-05 09:00:00', NULL),
(2025080300005, 'Puzzle D', '2024-03-06 09:00:00', '2024-03-07 09:30:00'),
(2025080300009, 'Puzzle C', '2024-03-10 10:00:00', '2024-03-12 11:00:00'),
(2025080300010, 'Puzzle D', '2024-03-15 12:00:00', '2024-03-16 12:30:00'),

-- Other students
(2025080300002, 'Puzzle A', '2024-03-03 10:00:00', '2024-03-04 10:15:00'),
(2025080300002, 'Puzzle B', '2024-03-06 10:00:00', '2024-03-07 10:45:00'),
(2025080300003, 'Puzzle C', '2024-03-02 11:00:00', '2024-03-05 11:20:00'),
(2025080300004, 'Puzzle F', '2024-04-01 10:00:00', '2024-04-02 10:20:00'),
(2025080300006, 'Puzzle H', '2024-04-05 14:00:00', '2024-04-06 14:10:00'),

-- Teachers solving
(2025080300011, 'Puzzle B', '2024-03-05 12:00:00', '2024-03-06 12:30:00'),
(2025080300012, 'Puzzle C', '2024-03-07 14:00:00', '2024-03-08 14:45:00'),
(2025080300013, 'Puzzle F', '2024-03-15 10:00:00', '2024-03-16 10:30:00'),
(2025080300014, 'Puzzle H', '2024-04-12 11:00:00', '2024-04-13 11:15:00'),
(2025080300015, 'Puzzle G', '2024-05-01 09:00:00', NULL),

-- Whiz Kid special
(2025080300010, 'Puzzle A', '2024-03-20 10:00:00', NULL),

-- Random mixes for more volume
(2025080300007, 'Puzzle E', '2024-04-02 09:00:00', '2024-04-03 09:05:00'),
(2025080300008, 'Puzzle G', '2024-04-05 12:00:00', NULL),
(2025080300009, 'Puzzle H', '2024-04-06 14:00:00', '2024-04-07 14:15:00'),
(2025080300011, 'Puzzle E', '2024-04-08 10:00:00', NULL),
(2025080300013, 'Puzzle D', '2024-04-10 15:00:00', '2024-04-11 15:15:00');

-- Add two first-year students
INSERT INTO solvers (reg_no, password, name, registation_date, type) VALUES
(2025080300201, 'p', 'Amy', '2024-01-01 09:00:00', 1),
(2025080300202, 'p', 'Ben', '2024-01-02 09:00:00', 1);

INSERT INTO student (reg_no, year) VALUES
(2025080300201, 1),
(2025080300202, 1);

-- Two puzzles: one easy, one hard(=3)
INSERT INTO puzzle (pname, difficulty, solution) VALUES
('PX_easy', 1, 'E'),
('PX_hard', 3, 'H');

-- Amy solved a hard puzzle; Ben did NOT
INSERT INTO solved (reg_no, pname, date_open, date_solved) VALUES
(2025080300201, 'PX_hard', '2024-03-01 09:00:00', '2024-03-02 10:00:00'), -- Amy solved HARD
(2025080300202, 'PX_easy', '2024-03-03 09:00:00', NULL);                    -- Ben only opened EASY


CREATE VIEW solvers_student AS SELECT * FROM solvers WHERE type = 1;
SELECT * FROM solvers_student WHERE name = 'kiki';

-- Display a list of Puzzles, ordered by difficulty level and then by Puzzle Name
SELECT * FROM puzzle ORDER BY difficulty, pname;

-- List the Puzzle(s) details that have never been solved
SELECT p.*
FROM PUZZLE p
WHERE NOT EXISTS (
  SELECT 1
  FROM SOLVED s
  WHERE s.PName = p.PName
    AND s.date_solved IS NOT NULL
);

-- List the name and corresponding type (Student or Teacher) of the solver(s) who was the first ever to register in this system
SELECT * 
FROM solvers
WHERE registation_date = (SELECT MIN(registation_date) FROM solvers);

DESCRIBE solvers;

-- Find the puzzles that have been solved more times by students than by teachers
SELECT d.pname
FROM solved d 
LEFT JOIN solvers r ON d.reg_no = r.reg_no 
WHERE d.date_solved IS NOT NULL
group by d.pname
HAVING SUM(r.type = 1) > SUM(r.type =2);

SELECT d.pname, r.type, COUNT(*)
FROM solved d 
LEFT JOIN solvers r ON d.reg_no = r.reg_no
GROUP BY r.type, d.pname;
DESCRIBE solved;

-- Find the “First Year” student(s) who has solved at least one “Hard” Puzzle
DESCRIBE puzzle;
DESCRIBE solved;
DESCRIBE solvers;
SHOW create TABLE student;
SHOW CREATE TABLE teacher;
SHOW CREATE TABLE puzzle;
SHOW CREATE TABLE solvers;
SHOW CREATE TABLE solved;

-- One row per qualifying student, no need for DISTINCT
SELECT t.reg_no, t.name
FROM solvers t
JOIN student st
  ON st.reg_no = t.reg_no
 AND st.year   = 1
WHERE t.type = 1
  AND EXISTS (
    SELECT 1
    FROM solved s
    JOIN puzzle p
      ON p.pname = s.pname
     AND p.difficulty = 3
    WHERE s.reg_no = t.reg_no
      AND s.date_solved IS NOT NULL
  );
	
-- Find the solvers who have solved at least all the puzzles solved by the solver with the name “Whiz Kid”
explain SELECT s.reg_no, s.name
FROM solvers s
WHERE NOT EXISTS(
	SELECT 1
	FROM solved d
	JOIN solvers l ON d.reg_no = l.reg_no
	WHERE l.name = 'Whiz Kid'
		AND d.date_solved IS NOT NULL
		AND NOT EXISTS (
			SELECT 1 
			FROM solved d2
			WHERE d2.reg_no = s.reg_no
				AND d2.pname = d.pname
				AND d2.date_solved IS NOT NULL
		)
);
