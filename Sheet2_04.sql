use dbms;

-- A . Retrieve the name of the students whose name starts with ‘S’
-- and contains ‘r’ as the second last character.
select name
from students
where name like 'S%r_';

-- B . Retrieve the name of the youngest student(s) from the ‘CST’ department
-- along with the total marks obtained by him (them).

select name, bdate, sum(marks)
from students, crs_regd
where crs_rollno = rollno
and deptcode = 'CST'
group by rollno
having bdate = ( select max(bdate)
	from students
	where deptcode = 'CST');
   
-- C . Find the age of all the students.

alter table students add age numeric;

update students
set age = year(now()) - year(bdate)
where month(now()) > month(bdate)
or (month(now()) = month(bdate)
and (date(now()) > date(bdate)
or date(now()) = date(bdate)));

update students
set age = year(now()) - year(bdate) - 1
where month(now()) < month(bdate)
or (month(now()) = month(bdate)
and date(now()) < date(bdate));

select * from students;

