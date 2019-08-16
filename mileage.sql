create database mileage;

use mileage;

create table fillups
(id int not null primary key auto_increment,
date_time datetime,
volume double,
vehicle_id int, 
odometer double,
economy double,
total_cost double,
price double,
is_partial int,
restart int
);

select from_unixtime(1392164473694 / 1000);

LOAD DATA LOCAL INFILE '/Users/Greg_Main/Downloads/mileage.csv'
INTO TABLE fillups
FIELDS TERMINATED BY ','
IGNORE 1 LINES
(id, @date_time, volume, vehicle_id, odometer, economy, total_cost, price, is_partial,
restart)
set date_time=from_unixtime(@date_time / 1000);

alter table  fillups drop restart;

select * from fillups;

update fillups 
set is_partial =  0
where vehicle_id = 2;

select min(price), max(price), avg(price) from fillups;

select vehicle_id, total_cost from fillups;

select vehicle_id, round(avg(economy)) from fillups where economy > 0 
group by vehicle_id;

select vehicle_id, round(avg(economy)), case 
when vehicle_id = 2 then 'Prius'
when vehicle_id = 4 then 'Other'
end as Vehicle_Type
from fillups where economy > 0
group by vehicle_id;

select date_time, count(date_time) from fillups
group by date_time;

select hour(date_time), count(*) from fillups group by hour(date_time);

select dayofweek(date_time), count(*), case
when dayofweek(date_time) = 1 then 'SUN'
when dayofweek(date_time) = 2 then 'MON'
when dayofweek(date_time) = 3 then 'TUE'
when dayofweek(date_time) = 4 then 'WED'
when dayofweek(date_time) = 5 then 'THU'
when dayofweek(date_time) = 6 then 'FRI'
when dayofweek(date_time) = 7 then 'SAT'
end as DAY_OF_WEEK
from fillups group by dayofweek(date_time), DAY_OF_WEEK;

select vehicle_id, month(date_time), year(date_time), count(*) * volume
from fillups group by month(date_time), year(date_time), vehicle_id, volume order by volume desc;