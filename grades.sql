create database gradesdb;
use gradesdb;

create table grades 
(SName varchar(10), Assgn varchar(15), Grade INT);

-- modify path to CSV file for your file location
LOAD DATA LOCAL INFILE '/Users/Greg_Main/Downloads/Week11/grades.csv'
INTO TABLE grades
FIELDS TERMINATED BY ',' ESCAPED BY '\\'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

select assgn from grades;

select right(assgn, 1) from grades;

update grades 
set assgn = concat('HW', right(assgn,1));

update grades
set SName = concat(upper(left(SName, 1)),
lower(substring(SName, 2)));

alter table grades 
add column ID int not null auto_increment first,
add primary key (ID);

alter table grades
add column sid int not null;

update grades
set sid =
case
  when sname = "Jesse" then 1
  when sname = "Julio" then 2
  when sname = "Percy" then 3
  when sname = "Samantha" then 4
  else -1
end;

select sname, count(*), sum(grade), avg(grade), 
sum(grade)/count(*) from grades group by sname;

update grades
set grade = 0 where grade is NULL;

select assgn, avg(grade), min(grade), max(grade) highest_grade
from grades group by assgn order by highest_grade desc;

select sname, case 
when avg(grade) >= 90 then 'A'
when avg(grade) >= 80 and avg(grade) < 90 then 'B'
when avg(grade) >= 70 and avg(grade) < 80 then 'C'
when avg(grade) >= 60 and avg(grade) < 70 then 'D'
else 'F'
end as FinalGrade
from grades
group by sname order by FinalGrade;
