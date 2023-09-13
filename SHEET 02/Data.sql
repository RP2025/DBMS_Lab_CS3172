use dbms;

CREATE TABLE depts (
	deptcode varchar(4) PRIMARY KEY,
	deptname varchar(50) NOT NULL
);

CREATE TABLE students (
	rollno numeric(8) PRIMARY KEY,
	name varchar(30),
	bdate date CHECK (bdate < '2021-01-01'),
	deptcode char(4) REFERENCES depts (deptcode) ON DELETE CASCADE,
	hostel numeric CHECK (hostel < 10),
	parent_inc numeric(8, 1)
);

CREATE TABLE faculty (
	fac_code varchar(8) PRIMARY KEY,
	fac_name varchar(30) NOT NULL,
	fac_dept varchar(5) REFERENCES depts (deptcode)
);

CREATE TABLE crs_offrd (
	crs_code varchar(10) PRIMARY KEY,
	crs_name varchar(35) NOT NULL,
	crs_credits numeric(2, 1),
	crs_fac_cd varchar(8) REFERENCES faculty (fac_code)
);

CREATE TABLE crs_regd (
	crs_rollno numeric(8) REFERENCES students (rollno),
	crs_cd char(10) REFERENCES crs_offrd (crs_code),
	marks numeric(5, 2),
	PRIMARY KEY (crs_rollno, crs_cd)
);

INSERT INTO students (rollno, name, bdate, deptcode, hostel, parent_inc)
	VALUES (1, 'Abhiroop', '2002-09-25', 'CST', 8, 16000),
	(2, 'Karmanya', '2001-09-25', 'ELE', 7, 18000),
	(3, 'Mehul', '2001-08-25', 'ELE', 5, 19000),
	(4, 'Rahul', '2001-08-26', 'CST', 9, 20000),
	(5, 'Aditi', '2001-09-25', 'ELE', 5, 9000),
	(92005102, 'Himanshu', '2001-08-25', 'ELE', 5, 22000),
	(92005010, 'Sanjana', '2000-08-26', 'CST', 9, 21000),
	(6, 'Srijan', '2001-08-26', 'ELE', 5, 26000),
	(7, 'Master', '2001-09-26', 'ELE', 5, 28000),
	(8, 'Superconductors', '2000-09-26', 'ARCH', 5, 18000),
	(9, 'Shamra', '2000-12-01', 'ELE', 9, 10000);

INSERT INTO faculty (fac_code, fac_name, fac_dept)
	VALUES
	('CST_F1', 'dbp', 'CST'),
	('CST_F2', 'hed', 'CST'),
	('EE_F1', 'nls', 'ELE'),
	('EE_F2', 'jst', 'ELE'),
	('PH_F1', 'sfgf', 'PH'),
	('CH_F1', 'poi', 'CH'),
	('ARCH_F1', 'wer', 'ARCH');

-- Insert into crs_offrd
INSERT INTO crs_offrd (crs_code, crs_name, crs_credits, crs_fac_cd)
	VALUES
	('CS101', 'DBMS', 4, 'CST_F1'),
	('CS102', 'OS', 5, 'CST_F2'),
	('CS103', 'MIS', 6, 'CST_F1'),
	('CS104', 'Software Engg.', 7, 'CST_F2'),
	('EE101', 'ELE Course 1', 6, 'EE_F1'),
	('EE102', 'ELE Course 2', 7, 'EE_F2'),
	('EE103', 'ELE Course 3', 5, 'EE_F1'),
	('EE104', 'ELE Course 4', 4, 'EE_F2'),
	('PH106', 'PH Course 1', 4, 'PH_F1'),
	('CH103', 'CH Course 1', 3, 'CH_F1'),
	('ARCH101', 'ARCH Course 1', 4, 'ARCH_F1');

-- Insert into crs_regd
INSERT INTO crs_regd (crs_rollno, crs_cd, marks)
	VALUES
	(1, 'CS101', 89.6),
	(1, 'CS102', 98.6),
	(1, 'CS103', 67.6),
	(1, 'CS104', 95.6),
	(1, 'PH106', 100),
	(1, 'CH103', 90),
	(2, 'EE101', 89.4),
	(2, 'EE102', 92.6),
	(2, 'EE103', 87.7),
	(2, 'EE104', 75.9),
	(3, 'EE102', 94.6),
	(3, 'EE103', 82.7),
	(3, 'EE104', 79.4),
	(3, 'PH106', 84.3),
	(3, 'CH103', 97.8),
	(4, 'CS101', 82.6),
	(4, 'CS102', 68.6),
	(4, 'CS103', 63.6),
	(4, 'CS104', 90.6),
	(4, 'PH106', 82.3),
	(4, 'CH103', 95.8),
	(5, 'EE101', 90.4),
	(5, 'EE102', 91.6),
	(5, 'EE103', 89.7),
	(5, 'EE104', 76.9),
	(5, 'PH106', 82.8),
	(5, 'CH103', 95.9),
	(92005102, 'EE101', 89.4),
	(92005102, 'EE102', 93.6),
	(92005102, 'EE103', 86.7),
	(92005102, 'EE104', 70.4),
	(92005102, 'PH106', 88.8),
	(92005102, 'CH103', 91.9),
	(92005010, 'CS101', 83.6),
	(92005010, 'CS102', 34.6),
	(92005010, 'CS103', 69.6),
	(92005010, 'CS104', 90.3),
	(92005010, 'PH106', 82.8),
	(92005010, 'CH103', 99.9),
	(7, 'CS101', 90.4),
	(7, 'CS102', 90.4),
	(7, 'CS103', 90.4),
	(7, 'CS104', 90.4),
	(7, 'EE101', 90.4),
	(7, 'EE102', 91.6),
	(7, 'EE103', 89.7),
	(7, 'EE104', 76.9),
	(7, 'PH106', 82.8),
	(7, 'CH103', 95.9),
	(7, 'ARCH101', 99.9),
	(6, 'CS101', 90.4),
	(6, 'CS102', 90.4),
	(6, 'CS103', 90.4),
	(6, 'CS104', 90.4);