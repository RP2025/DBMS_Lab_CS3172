use dbms;

-- A . Display the highest parent incomes, in descending order, for each
-- department excluding ‘ARCH’ such that only those highest parent incomes
-- will appear that are below 12,000.
select max(parent_inc), deptcode
from students
where parent_inc < 12000 and deptcode != 'ARCH'
group by(deptcode)
order by(max(parent_inc)) desc;

-- B . -- Retrieve the fifth highest parent income for hostel number 5.

select s1.rollno, s1.name, hostel, s1.parent_inc
from students s1
where hostel = 5 and 4 = (select count(s2.parent_inc)
from students s2
where s2.hostel = s1.hostel
and s2.parent_inc > s1.parent_inc);

-- C . -- Find the roll number of the students from each department who 
-- obtained highest total marks in their own department.

select rollno, deptcode, total
from (
select rollno, deptcode, sum(marks) as total
from students, crs_regd
where rollno = crs_rollno
group by(rollno)
) as tbl1
where total = (select max(total)
from (
select rollno, deptcode, sum(marks) as total
from students, crs_regd
where rollno = crs_rollno
group by(rollno)
) as tbl2
where tbl1.deptcode = tbl2.deptcode
group by(deptcode))
order by(rollno);
