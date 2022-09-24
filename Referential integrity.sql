--Constraints
-- Creation of Table
create table dept(
dept_id int primary key,
dept_Name varchar(50) not null
);

--Insertion of values
insert into dept values
(1,'HR'),(2,'IT'),(3,'Design'),(4,'Finance');

-- Creating Employee Table
create table employee(
emp_id int primary key,
Name varchar(50) unique,
dept_id int foreign key references dept(dept_id),
email varchar(50) default 'company@email.com',
Age int check(age>21)
);

insert into employee values (1,'Ananya',1,'Ananya@evry.com',22);
insert into employee values (2,'Anagha',3,'Anagha@evry.com',22);
insert into employee (emp_id,name,dept_id,age) values (3,'bhavana',4,25);
insert into employee values (4,'sita',3,'sita@evry.com',23);

drop table dept;
drop table employee;

delete from dept where dept_id=3;

select * from employee;
select * from dept;

-----REFERENCIAL INTEGRITY------

alter table employee drop constraint FK__employee__dept_i__5FB337D6;

-----ON DELETE CASCADE AND ON UPDATE CASCADE----

alter table employee add constraint FK_emp_dept_id foreign key (dept_id) 
references dept(dept_id) on delete cascade;--- On delete cascade

select * from employee;
select * from dept;

delete from dept where dept_id=3;
update dept set dept_id=3 where dept_name='Finance';

---On delete/ On Update set null----

alter table employee drop constraint FK_emp_dept_id;

alter table employee add constraint FK_emp_dept_id foreign key (dept_id) 
references dept(dept_id) on delete set null on update set null;

select * from employee;
select * from dept;

insert into employee values
(2,'Anaa',2,'Anaa@outlook.com',23),
(4,'Ajay',2,'Ajay@outlook.com',23);

insert into dept values (2,'testing');

delete from dept where dept_id=3;
update dept set dept_id=4 where dept_name='IT';

select * from employee;
select * from dept;
 
----On Delete /Update set Default----

alter table employee drop constraint FK_emp_dept_id;

alter table employee add constraint FK_emp_dept_id foreign key (dept_id) 
references dept(dept_id) on delete set default on update set default;

select * from employee;
select * from dept;

-- Creation of Table
create table dept(
dept_id int primary key,
dept_Name varchar(50) not null
);

--Insertion of values
insert into dept values
(1,'HR'),(2,'IT'),(3,'Design'),(4,'Finance');

create table employee(
emp_id int primary key,
Name varchar(50) unique,
dept_id int default 1 foreign key references dept(dept_id) on delete set default on update set default,
email varchar(50) default 'company@email.com',
Age int check(age>21)
);

insert into employee values (1,'Ananya',1,'Ananya@evry.com',22);
insert into employee values (2,'Anagha',3,'Anagha@evry.com',22);
insert into employee (emp_id,name,dept_id,age) values (3,'bhavana',4,25);
insert into employee values (4,'sita',3,'sita@evry.com',23);


select * from employee;
select * from dept;

delete from dept where dept_id=4;
update dept set dept_id=4 where dept_Name='Design';

select * from employee;
select * from dept;

------------------------------
