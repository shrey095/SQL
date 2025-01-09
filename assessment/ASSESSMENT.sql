
create database ASSESSMENT;
USE ASSESSMENT;

create table country(
	id int primary key,
    country_name varchar(50),
    country_name_eng varchar(50),
    country_code varchar(50));

insert into country(id,country_name,country_name_eng,country_code)
value(1,"Deutschland","Germany","DEU"),
	 (2,"srbija","Serbia","SRB"),
     (3,"Hrvatska","croatia","HRV"),
     (4,"United States Of America","United States Of America","USA"),
     (5,"Polska","poland","POL"),
     (6,"Espana","Spain","ESP"),
     (7,"Rossiya","Russia","RUS");
     

create table city(
      id int primary key,
      city_name varchar(50),
      lat float,
      longg float,
      country_id int ,foreign key (country_id) references country(id)
      on delete cascade
      on update cascade);

insert into city(id,city_name,lat,longg,country_id)
value(1,"Berlin",52.520008,13.404954,1),
     (2,"Belgrade",44.787197,20.457273,2),
     (3,"Zagreb",45.815399,15.966568,3),
     (4,"New York",40.730610,-73.935242,4),
     (5,"Los Angeles",34.052235,-118.243683,4),
     (6,"Warsaw",52.237049,21.017532,5);
     
create table customer(
      id int primary key,
      customer_name varchar(50),
      customer_address varchar(50),
      next_call_date date,
      ts_inserted datetime,
      city_id int,
      foreign key (city_id) references city(id)
      on delete cascade
      on update cascade
      );
      
insert into customer(id,customer_name,city_id,customer_address,next_call_date,ts_inserted)
value(1,"jewelry",4,"long street 120","2020-01-21","2020-01-09 14:01:20.000"),
     (2,"Bakey",1,"Kufurstendamm 25","2020-02-21","2020-01-09 17:52:15.000"),
     (3,"cafe",1,"tauentzienstabe 44","2020-01-21","2020-01-10 08:02:49.000"),
     (4,"restaurant",3,"ulica lipa 15","2020-01-21","2020-01-10 09:20:21.000");
     
select * from country;
select * from city;
select * from customer;

-- ----------------------------------------------------------------------TASK-1-------------------------------------------------------------------------------------------------
-- join multiple tables using left join)
-- List all Countries and customers related to these countries.
-- For each country displaying its name in English, the name of the city customer is located in as
-- well as the name of the customer.
-- Return even countries without related cities and customers.

select co.country_name_eng,ci.city_name,cu.customer_name
from country co
left join city ci 
 on co.id = ci.country_id
left join customer cu
 on ci.id = cu.city_id;
 
 
--  ---------------------------------------------------------------------Task-2----------------------------------------------------------------------------------------------------------
-- (join multiple tables using both left and inner join)
-- Return the list of all countries that have pairs(exclude countries which are not referenced by any
-- city). For such pairs return all customers.
-- Return even pairs of not having a single customer

select country_name_eng ,city_name,customer_name
from country co
inner join city ci
on co.id = ci.country_id
left join customer cu
on ci.id = cu.city_id;

      

      
