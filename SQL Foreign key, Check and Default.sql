show databases;
use customer;
show tables;
select * from customer_info;
create table sales(
id integer,
first_name varchar(10) not null,
last_name varchar(10) not null,
age integer not null,
primary key (id)
);

desc sales;

drop table sales;
create table sales(
id integer,
first_name varchar(10) not null,
last_name varchar(10) not null,
age integer not null
#constraint pk_sales_person primary key(id, last_name)
);

desc sales;

# Suppose you have missed assinging attribute as primary key
# You can do that using alter function

drop table sales;
alter table sales
add primary key(id);
desc sales;

# Forming a primary key using two attributes;
alter table sales
add constraint pk_sales_employee primary key(id, last_name);
desc sales;

# Dropping a single primary key
alter table sales
drop primary key;

desc sales;

# Foreign Key
# If we reference a primary key of one table with another table then that key is called foreign key
drop database customer;

create database jio;
use jio;
show tables;

create table customers(
id integer not null,
first_name varchar(20),
last_name varchar(20),
age integer not null
);

select * from customers;
alter table customers
drop column sales;
alter table customers
add column sales integer;

alter table customers
add constraint id_pk primary key (id);

desc customers;
select * from customers;

create table department(
id integer not null,
department_id int not null, # this will act as pk of this table
department_name varchar(20) not null
);

desc department;

drop table department;
alter table department
add constraint fk_id foreign key(id) references customers(id);

desc department;
drop table department;
drop table customers;

create table employee(
id integer not null,
first_name varchar(25) not null,
last_name varchar(25) not null,
age integer not null,
salary integer,
primary key(id),
check(salary < 500000)
 );
 desc employee;
 
 # inserting values into employees
 insert into employee values(1, "Tom", "Michigan", 20, 500000);
 # It gives error constraint, that is the salary is greater than 500000
 
 insert into employee values(1, "Tom", "Michigan", 20, 400000);
 
 # Default constraint
 drop table employee;
 
 create table person(
 id integer not null,
 first_name varchar(25) not null,
 last_name varchar(25) not null,
 city_name varchar(25) default "Mumbai"
 # By default the city name will be considered as "Mumbai"
 );
 
 select * from person;
 desc person;
 
 insert into person(id, first_name, last_name)
 values(1, "Sukrut", "Mayekar");
 select * from person;
 
 alter table person
 alter city_name drop default;
 
 desc person;