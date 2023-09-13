create database dbmslab;
use dbmslab;

CREATE TABLE depts(
deptcode char(3) PRIMARY KEY,
deptname char(30) NOT NULL
);
desc depts;
INSERT INTO
depts(deptcode, deptname)
VALUES
('CSE', 'Computer Science'),
('ELE', 'Electrical'),
('ETC', 'Electronics'),
('IT', 'Information Tech'),
('MEC', 'Mechanical'),
('PHY', 'Physics'),
('CHE','Chemistry');

select * from depts;

create table students(
rollno int(8) primary key,
name char(30),
bdate date check(bdate < '1997-01-01'),
deptcode char(3) references depts(deptcode)
 on delete cascade,
hostel int check(hostel<10),
parent_inc decimal(8,1));

desc students;

INSERT INTO students(rollno, name, bdate, deptcode, hostel, parent_inc)
VALUES (202101, 'Jayant', '2003-01-01', 'MEC', 1, 8780000),
(202102, 'Shaan', '2004-07-25', 'PHY', 2, 7460000),
(202103, 'Chirag', '2003-02-03', 'IT', 4, 1140000),
(202104, 'Ehsaan', '2002-03-23', 'ETC', 3, 5380000),
(202105, 'Shanaya', '2001-12-03', 'ETC', 6, 6800000),
(202107, 'Divij', '2000-02-14', 'CSE', 6, 6290000),
(202106, 'Seher', '2000-04-03', 'ETC', 8, 5050000),
(202108, 'Parinaaz', '2003-12-20', 'ELE', 9, 4850000),
(202109, 'Riya', '2004-07-07', 'PHY', 7, 9810000),
(202110, 'Onkar', '2001-07-11', 'ELE', 7, 8760000),
(202111, 'Yakshit', '2001-03-19', 'ETC', 9, 2820000),
(92005010, 'Kumar', '2003-01-01', 'ELE', 1, 8110000),
(92005012, 'Shreya', '2003-01-01', 'ELE', 1, 8110000);

create table faculty(
fac_code char(8) primary key,
fac_name char(30) not null,
fac_dept char(3) references depts(deptcode));

INSERT INTO faculty
VALUES ('CHE_F1','Neeharika','CHE');
INSERT INTO faculty
VALUES ('CHE_F2','Aayush','CHE');
INSERT INTO faculty
VALUES ('CSE_F1','Anya','CSE');
INSERT INTO faculty
VALUES ('CSE_F2','Ashlesha','CSE');
INSERT INTO faculty
VALUES ('ELE_F1','Vrinda','ELE');
INSERT INTO faculty
VALUES ('ELE_F2','Shlok','ELE');
INSERT INTO faculty
VALUES ('ETC_F1','Nakul','ETC');
INSERT INTO faculty
VALUES ('ETC_F2','Vanya','ETC');
INSERT INTO faculty
VALUES ('IT_F1','Kiran','IT');
INSERT INTO faculty
VALUES ('IT_F2','Suhana','IT');
INSERT INTO faculty
VALUES ('PHY_F1','Abhi','PHY');
INSERT INTO faculty
VALUES ('MEC_F1','Siya','MEC');

create table crs_offrd(
crs_code char(5) primary key,
crs_name char(35) not null,
crs_credits decimal(2,1),
crs_fac_cd char(8) references faculty(fac_code));

INSERT INTO crs_offrd
VALUES ('CSE_1','CSE Course 1',4,'CSE_F1');
INSERT INTO crs_offrd
VALUES ('CSE_2','CSE Course 2',5,'CSE_F2');
INSERT INTO crs_offrd
VALUES ('CHE_1','CHE Course 1',4,'CHE_F1');
INSERT INTO crs_offrd
VALUES ('CHE_2','CHE Course 2',5,'CHE_F2');
INSERT INTO crs_offrd
VALUES ('ETC_1','ETC Course 1',4,'ETC_F1');
INSERT INTO crs_offrd
VALUES ('ETC_2','ETC Course 2',5,'ETC_F2');
INSERT INTO crs_offrd
VALUES ('ELE_1','ELE Course 1',4,'ELE_F1');
INSERT INTO crs_offrd
VALUES ('ELE_2','ELE Course 2',5,'ELE_F2');
INSERT INTO crs_offrd
VALUES ('IT_1','IT Course 1',6,'IT_F1');
INSERT INTO crs_offrd
VALUES ('IT_2','IT Course 2',7,'IT_F2');
INSERT INTO crs_offrd
VALUES ('MEC_1','MEC Course 1',6,'MEC_F1');
INSERT INTO crs_offrd
VALUES ('MEC_2','MEC Course 2',4,'MEC_F2');
INSERT INTO crs_offrd
VALUES ('PHY_1','PHY Course 1',6,'PHY_F1');
INSERT INTO crs_offrd
VALUES ('PHY_2','PHY Course 2',4,'PHY_F2');
select * from crs_offrd;

create table crs_regd(
crs_rollno int(8) references students(rollno),
crs_cd char(5) references crs_offrd(crs_code),
marks decimal(5,2), 
primary key(crs_rollno,crs_cd));

INSERT INTO crs_regd
VALUES ('202101','MEC_1',100);
INSERT INTO crs_regd
VALUES ('202102','PHY_1',71);
INSERT INTO crs_regd
VALUES ('202103','IT_1',93);
INSERT INTO crs_regd
VALUES ('202104','ETC_1',84);
INSERT INTO crs_regd
VALUES ('202105','ETC_2',77);
INSERT INTO crs_regd
VALUES ('202106','ETC_2',74);
INSERT INTO crs_regd
VALUES ('202107','CSE_1',73);
INSERT INTO crs_regd
VALUES ('202108','ELE_1',81);
INSERT INTO crs_regd
VALUES ('202108','ELE_2',71);
INSERT INTO crs_regd
VALUES ('202109','PHY_1',89);
INSERT INTO crs_regd
VALUES ('202110','ELE_2',74);
INSERT INTO crs_regd
VALUES ('202111','ETC_1',73);

INSERT INTO
depts(deptcode, deptname)
VALUES
('CSE', 'Computer Science');

INSERT INTO
depts(deptcode, deptname)
VALUES
('CSE', 'Computer Science');

INSERT INTO
depts(deptcode, deptname)
VALUES
('ABCD', 'TESTING');

DELETE FROM
depts
WHERE
deptcode = 'CSE';
select * from depts; 

SELECT
crs_name,
crs_fac_cd
FROM
crs_offrd
WHERE
crs_fac_cd = 'CSE_F1'
OR crs_fac_cd = 'IT_F2';

SELECT
*
FROM
crs_offrd
WHERE
crs_fac_cd = 'CSE_F1';


SELECT
*
FROM
crs_offrd
WHERE
crs_credits > 4.0
AND crs_credits < 6.0;

SELECT
*
FROM
crs_offrd
WHERE
crs_credits > 6.5;

SELECT
COUNT(*)
FROM
students
WHERE
deptcode = 'CSE';

SELECT
crs_cd,
crs_name,
MIN(marks) AS min_marks,
MAX(marks) AS max_marks,
AVG(marks) AS avg_marks
FROM
crs_regd,
crs_offrd
WHERE
crs_cd = crs_code
GROUP BY
crs_cd,
crs_name;

SELECT
crs_rollno,
SUM(crs_credits)
FROM
crs_regd,
crs_offrd
WHERE
crs_cd = crs_code
GROUP BY
crs_rollno;

SELECT
hostel,
COUNT(*)
FROM
students
WHERE
deptcode = 'CSE'
GROUP BY
Hostel;

SELECT
DISTINCT hostel,
rollno,
parent_inc
FROM
students a
WHERE
parent_inc = (
SELECT
max(parent_inc)
FROM
students b
WHERE
b.hostel = a.hostel
);

SELECT
name,
parent_inc
FROM
students
WHERE
parent_inc > (
SELECT
parent_inc
FROM
students
WHERE
rollno = 202102
)
ORDER BY
parent_inc;

SELECT
*
FROM
crs_regd
WHERE
marks > (
SELECT
marks
FROM
crs_regd
WHERE
crs_rollno = 202102
AND crs_cd = 'ETC_1'
)
AND crs_cd = 'ETC_1'
UNION
SELECT
*
FROM
crs_regd
WHERE
marks > (
SELECT
marks
FROM
crs_regd
WHERE
crs_rollno = 202102
AND crs_cd = 'MEC_1'
)
AND crs_cd = 'MEC_1';


SELECT
rollno,
name,
deptcode
FROM
students,
crs_regd
WHERE
rollno = crs_rollno
AND crs_cd = 'ETC_1';

SELECT
rollno,
name,
deptcode
FROM
students,
crs_regd
WHERE
rollno = crs_rollno
AND crs_cd = 'ETC_1'
AND deptcode = 'ETC';

SELECT
rollno,
name,
deptcode
FROM
students,
crs_regd
WHERE
rollno = crs_rollno
AND crs_cd = 'ETC_1'
AND NOT deptcode = 'ETC';

SELECT
name
FROM
students,
crs_regd,
crs_offrd
WHERE
rollno = crs_rollno
AND crs_cd = crs_code
AND crs_name = 'ELE Course 1'
INTERSECT
SELECT
name
FROM
students,
crs_regd,
crs_offrd
WHERE
rollno = crs_rollno
AND crs_cd = crs_code
AND crs_name = 'ELE Course 2';

SELECT
fac_name
FROM
faculty,
crs_offrd
WHERE
fac_code = crs_fac_cd
AND crs_name = 'CSE Course 1'
UNION
SELECT
fac_name
FROM
faculty,
crs_offrd
WHERE
fac_code = crs_fac_cd
AND crs_name = 'CSE Course 2';

SELECT
fac_name
FROM
faculty,
crs_offrd
WHERE
fac_code = crs_fac_cd
AND crs_name = 'CSE Course 1'
EXCEPT
SELECT
fac_name
FROM
faculty,
crs_offrd
WHERE
fac_code = crs_fac_cd
AND crs_name = 'CSE Course 2';


SELECT
hostel,
count(*)
FROM
students
WHERE
rollno NOT IN (
SELECT
crs_rollno
FROM
crs_regd
)
GROUP BY
hostel;
SELECT
*
FROM
students
WHERE
deptcode = 'ELE'
OR rollno IN (
SELECT
crs_rollno
FROM
crs_regd
WHERE
crs_cd = 'CSE_1'
);


SELECT
crs_rollno,
name
FROM
students,
crs_regd
WHERE
crs_rollno = rollno
GROUP BY
crs_rollno,
name
HAVING
COUNT(*) = (
SELECT
COUNT(*)
FROM
crs_offrd
);

UPDATE
crs_regd
SET
marks = marks + 5
FROM
crs_offrd
WHERE
crs_code = crs_cd
AND crs_name = 'CSE Course 1'
AND marks < 50;

select * from crs_regd;