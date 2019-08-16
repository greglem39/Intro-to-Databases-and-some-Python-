create database ReviewDB; 
-- new database created

use ReviewDB;

create table reviews
(
course_code varchar(7),
student_comm_rate int,
instructor_comm_rate int,
online_discussion_rate int,
course_content_rate int,
graded_assignments_feedback int,
instructor_avail_rate int,
activity_rate int,
course_policies_rate int,
course_strengths char(237),
suggestions char(207)
);

load data local infile '/Users/Greg/Downloads/reviews.csv'
into table reviews
fields terminated by ',';

select * from reviews;

-- select from reviews where instructor comm was disagree
select * from reviews where instructor_comm_rate = 3;

-- select from reviews where graded assignments/feedback was disagree or strongly disagree
select * from reviews where graded_assignments_feedback = 3 or graded_assignments_feedback = 4;

-- select from reviews where online discussions were agree or strongly agree
select * from reviews where course_code = 'cop3847' and online_discussion_rate = 1 or online_discussion_rate = 2;

-- select course code with null value
select course_code from reviews where activity_rate is null;

select course_code from reviews where course_strengths like '%good%';