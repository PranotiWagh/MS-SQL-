
--creating database
create database DML_Demo;

--creating table
CREATE TABLE customer (
    CustId INT PRIMARY KEY,
    CustumerName VARCHAR(40) NOT NULL,
    CustumerCity VARCHAR(40) NOT NULL,
    CustomerPhone CHAR(10) UNIQUE NOT NULL
);

select * from customer;


TRUNCATE TABLE customer;  -- Resets the table

select * from customer;

--Inserting values into database
insert into customer(CustId, CustumerName,CustumerCity, CustomerPhone)
values(100, 'Tom' ,'New York', 1234567890),
(101, 'Abhishek Sinha', 'Deradun', 9187654321),
(102, 'Bob', 'Salt Lake city', 1273401243),
(103, 'Sarah Tom','Florida',1245687490),
(104, 'Mohd Naeem','Amroha',2355654231),
(105, 'Ashish Raghav' , 'New York',1230987645);

select * from customer;

select CustId as Customer_Id
from customer;


select distinct CustumerCity
from customer;

use DML_Demo;




