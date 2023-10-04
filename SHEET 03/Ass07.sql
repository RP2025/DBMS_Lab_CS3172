use dbms;

-- 1. Create a view of all students in dept CSE. 

CREATE VIEW CST_students AS 
SELECT  
* 
FROM  
students 
WHERE deptcode =  
'CST'; 

SELECT * from CST_students;

-- 2. Create a view named as cse_stud for ‘CSE’ deptstudents  
-- having attributes rollno, name, hostel

CREATE VIEW cst_stud AS 
SELECT  
rollno,  
name,  
hostel 
FROM  
students 
WHERE deptcode =  
'CST'; 

SELECT * from cst_stud;

-- 3. Insert a new student of CSE. Analyse the result. 
INSERT  
INTO  
cst_stud 
VALUES 
('51052987', 'Rashi', '8');

SELECT * from cst_stud;

SELECT * FROM  students 
	WHERE rollno = 51052987; 
    
-- 4. Increment parental income by Rs. 5000 (HRA). 
UPDATE  
CST_students 
SET parent_inc = parent_inc +
5000;

SELECT * from CST_students;

-- 5. Delete the view. 
DROP VIEW cst_stud; 

SELECT * from cst_stud;

-- 6.Create another view of all students in dept Mechanical  
-- Engineering (department Name). The view will contain attributes 
-- namely Roll-No, Name, Department Name, Age

CREATE VIEW mec_stud AS
SELECT
    rollno,
    name,
    deptcode,
    YEAR(bdate) AS age
FROM
    students
WHERE
    deptcode = 'MECH';

SELECT * from mec_stud;

-- 7. Insert a new student of Mechanical Engineering Department.

INSERT INTO students VALUES 
(15, 'Krishna', '2000-12-01', 'MECH', 9, 20000.0, 22);

SELECT * from mec_stud;

-- 8. Delete a student (for a given Name) of the same department 

DELETE FROM  
students 
WHERE name =  
'Krishna';

SELECT * from mec_stud;

-- 9. Shift a student (for a given Name) 
-- from Mechanical to Computer Science. 

UPDATE  
mec_stud
SET deptcode =  
'CST' 
WHERE name =  
'Mishti'; 

SELECT * from mec_stud;
SELECT * from cst_students;

SELECT * from students
where deptcode = "CST";

SELECT * from students 
	where deptcode = 'CST';

SELECT * from cst_stud;