create database gregorydb;

use gregorydb;

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
course_strengths text,
suggestions text
);

load data local infile '/Users/Greg/Downloads/reviews (2).csv'
into table reviews
fields terminated by ','
ignore 1 lines;

select * from reviews;
