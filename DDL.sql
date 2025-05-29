
-- All Data Manuplation Querry DML

create database DML;
USE DML;

CREATE TABLE Customer_Data (
    CustId INT PRIMARY KEY,
    CustomerName VARCHAR(40) NOT NULL,
    CustomerCity VARCHAR(40) NOT NULL,
    CustomerPhone CHAR(10) UNIQUE NOT NULL
	);


select * from Customer_Data;

insert into Customer_Data(CustId, CustomerName,CustomerCity, CustomerPhone)
values(100, 'Tom' ,'New York', 1234567890),
(101, 'Abhishek Sinha', 'Deradun', 9187654321),
(102, 'Bob', 'Salt Lake city', 1273401243),
(103, 'Sarah Tom','Florida',1245687490),
(104, 'Mohd Naeem','Amroha',2355654231);


select * from Customer_Data;

--alias name
--select CustId as Customer_Id
--from Customer_Data;

select CustomerCity as Address
from Customer_Data;

select * from Customer_Data;
select CustomerPhone from Customer_Data;

--distinct 
--select distinct CustomerCity
--from Customer_Data;

select distinct CustId from Customer_Data;

--insert single value
create table Employee_single(
id int,
name varchar(10)
);

Insert into Employee_single(id,name)
Values(1,'Pranoti')

delete from Employee Employee_single
where id=1;

--insert multiple values
create table Class(
id int,
Name varchar(10),
Dept Varchar(10),
);

Insert into Class(id, Name, Dept)
values(01, 'Santosh','HR'),
values(02, 'Pranoti','HR');

--insert default values

create table Bank(
Account_No int primary key,
Customer_Name Varchar(20) not null,
Bank_Name Varchar(10) not null
);

insert into Bank(Account_No, Customer_Name, Bank_Name)
values(1234, 'Pranoti' , 'default');

select * from Bank;



--Class Query
create table student
(
ID INT IDENTITY(1,1) PRIMARY KEY,
Name varchar(100) NOT NULL,
Gender char(1) CHECK (GENDER IN('M','F'))
)

select * from student;

INSERT INTO student
(Name,Gender)
VALUES
('Yasodha','F'),
('Anshav','M'),
('sushobhit','M'),
('Sudeep','M'),
('Jaynti','F'),
('Dipender','M');

--select statement Demo
select * from student;
select ID from student;
select ID, Name from student;


--udate single row
UPDATE student
SET Name = 'DEPENDRA'
WHERE Name = 'Dipender';

select * from student;

UPDATE student
SET Gender = 'M'
WHERE Name = 'Yasodha';

select * from student;

--update multiple rows

UPDATE student
SET Name = 'SUDEEP', Gender = 'F'
WHERE Name = 'Sudeep';

select * from student;


---Deleting single record
delete from student
where Name='Yasodha';

--DELETE FROM student WHERE ID = 3;

select * from student;


-- deleting all the rows
select * from student;

delete from student;

select * from student;

delete from student 
where Name='sushobhit';


DELETE FROM student 
WHERE ID = 3;


--select single column
select Name
from student;

--select 2 or more column
select Name, Gender
from student;

-- select entire table
select *
from student;


--select data of male student
select *
from student
where Gender='M';

select * 
from student;

select *
from student
where Name='Yasodha' and Name='Sudeep';

