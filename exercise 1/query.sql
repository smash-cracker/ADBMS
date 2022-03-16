create table regions(region_id int primary key, region_name varchar(30));
create table countries(country_id int primary key, country_name varchar(30), region_id int not null, foreign key(region_id) references regions(region_id));
create table locations(location_id int primary key, street_address varchar(30), postal_code varchar(30), city varchar(30), state_province varchar(30), country_id int not null, foreign key(country_id) references countries(country_id));
create table departments(department_id int primary key, department_name varchar(30), location_id int not null, foreign key(location_id) references locations(location_id));
create table jobs(job_id int primary key, job_title varchar(30), min_salary int, max_salary int);
create table employees(employee_id int primary key, first_name varchar(30), last_name varchar(30), email varchar(30), phone_no varchar(30), hire_data varchar(30), job_id int not null, salary int, manager_id int, department_id int, foreign key(job_id) references jobs(job_id));
create table dependents(department_id int primary key, first_name varchar(30), last_name varchar(30), relationship varchar(30), employee_id int not null, foreign key(employee_id) references employees(employee_id));



rename table departments to dept;


alter table employees modify column salary smallint;


alter table employees add commission int;
