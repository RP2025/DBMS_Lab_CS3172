use dbms;

-- A. Retrieve the name of the student(s) who 
-- obtained second highest marks in ‘DBMS’.

select name, marks, crs_name
from students, crs_regd, crs_offrd
where rollno = crs_rollno
and crs_cd = crs_code
and crs_name = 'DBMS'
and marks = (select max(marks)
from crs_regd, crs_offrd
where crs_cd = crs_code
and crs_name = 'DBMS'
and marks < (select max(marks)
from crs_regd, crs_offrd
where crs_cd = crs_code
and crs_name = 'DBMS'));



-- B. Find out the differences between highest and lowest marks obtained in each subject.
select crs_cd, crs_name, max(marks)-min(marks) as difference
from crs_regd, crs_offrd
where crs_cd = crs_code
group by(crs_cd)
order by(crs_cd);

-- C. Assuming the existance of several interdepartmental courses, retrieve the
-- name of the student(s) who is(are) studing under at least one faculty from
-- each department.

select name
from students, crs_regd, crs_offrd, faculty
where rollno = crs_rollno and crs_cd = crs_code and crs_fac_cd = fac_code
group by(name)
having count(distinct fac_dept) = (select count(distinct fac_dept)
from faculty);

-- D. -- Assuming the existance of several interdepartmental courses, retrieve the
-- name of the student(s) who is(are) studing under the faculties only from
-- his(their) own department.

select name, count(distinct crs_cd) as courses_count
from students, crs_regd
where crs_rollno = rollno
group by(rollno);

select name, deptcode, crs_cd, fac_dept from students, crs_regd,
crs_offrd, faculty where crs_rollno = rollno and crs_cd = crs_code and
crs_fac_cd = fac_code;

select name, count(deptcode) as
crs_taught_by_fac_of_dept_same_as_student_count
from (
select name, deptcode, crs_cd, fac_dept
from students, crs_regd, crs_offrd, faculty
where crs_rollno = rollno
and crs_cd = crs_code
and crs_fac_cd = fac_code
) as tbl1
where deptcode = fac_dept
group by(name);

select s1.name, s1.crs_taught_by_fac_of_dept_same_as_student_count,
s2.courses_count
from (
select name, count(deptcode) as
crs_taught_by_fac_of_dept_same_as_student_count
from (
select name, deptcode, crs_cd, fac_dept
from students, crs_regd, crs_offrd, faculty
where crs_rollno = rollno
and crs_cd = crs_code and crs_fac_cd = fac_code
) as tbl1
where deptcode = fac_dept
group by(name)
) as s1,
(
select name, count(distinct crs_cd) as courses_count
from students, crs_regd
where crs_rollno = rollno
group by(rollno)
) as s2
where s1.name = s2.name;

select name
from (
select s1.name,
s1.crs_taught_by_fac_of_dept_same_as_student_count,
s2.courses_count
from (
select name, count(deptcode) as
crs_taught_by_fac_of_dept_same_as_student_count
from (
select name, deptcode, crs_cd, fac_dept
from students, crs_regd, crs_offrd, faculty
where crs_rollno = rollno
and crs_cd = crs_code and crs_fac_cd = fac_code
) as tbl1
where deptcode = fac_dept
group by(name)
) as s1,
(
select name, count(distinct crs_cd) as courses_count from students,
crs_regd where crs_rollno = rollno group by(rollno)
) as s2
where s1.name = s2.name
) as temp_table
where crs_taught_by_fac_of_dept_same_as_student_count =
courses_count;