--All Data Query Language



-- Create Database
CREATE DATABASE DQL;


-- Create Department Table (Renamed from Dept)
CREATE TABLE Department (
    DeptNo CHAR(5) NOT NULL,
    DeptName VARCHAR(20) NOT NULL,
    Loc VARCHAR(10) NOT NULL,
    CONSTRAINT PK_Department PRIMARY KEY (DeptNo) -- Adding a primary key to prevent duplicates
);

-- Insert Data into Department
INSERT INTO Department (DeptNo, DeptName, Loc) VALUES
('D1', 'Sales', 'L1'),
('D2', 'Manager', 'L2'),
('D3', 'Clerk', 'L3');

-- Create Cust Table
CREATE TABLE Cust (
    CID CHAR(5) PRIMARY KEY,
    Cname VARCHAR(20) NOT NULL
);

-- Insert Data into Cust
INSERT INTO Cust (CID, Cname) VALUES
('1A', 'X'),
('2A', 'Y'),
('3A', 'Z');

-- Create Employee Table
CREATE TABLE Employee (
    Empno CHAR(10) PRIMARY KEY,
    Ename VARCHAR(20) NOT NULL,
    Sal INT NOT NULL,
    Phno CHAR(10) UNIQUE NOT NULL,
    Hiredate DATE NOT NULL,
    Deptno CHAR(5) NOT NULL,
    CID CHAR(5) NOT NULL,

    -- Updated Foreign Key Constraints to reference Department
    CONSTRAINT FK_Department FOREIGN KEY (DeptNo) REFERENCES Department(DeptNo),
    CONSTRAINT FK_Cust FOREIGN KEY (CID) REFERENCES Cust(CID)
);

-- Insert Data into Employee
INSERT INTO Employee (Empno, Ename, Sal, Phno, DeptNo, CID, HireDate) VALUES
('1', 'Smith', 100, '1234567890', 'D1', '1A', '2025-05-15'),
('2', 'Allen', 200, '1234567891', 'D2', '1A', '2025-01-01'),
('3', 'Ward', 300, '1234567892', 'D3', '2A', '2025-05-15'),
('4', 'Jon', 400, '1234567893', 'D1', '2A', '2024-03-13'),
('5', 'Martin', 500, '1234567894', 'D2', '3A', '2025-01-01'),
('6', 'Smith', 500, '1234567895', 'D3', '3A', '2025-05-15'),
('7', 'Clark', 500, '1234567896', 'D1', '1A', '2024-03-13'),
('8', 'Scott', 6000, '1234567897', 'D2', '2A', '2025-01-01'),
('9', 'King', 150, '1234567898', 'D3', '3A', '2025-05-15'),
('10', 'Adem', 250, '1234567899', 'D1', '1A', '2025-01-01'),
('11', 'Smith', 650, '1234567800', 'D2', '2A', '2024-03-13'),
('12', 'Ford', 120, '1234567801', 'D3', '3A', '2025-05-15'),
('13', 'Miller', 132, '1234567802', 'D1', '1A', '2024-03-13');

select * from Department;
select * from Cust;
select * from Employee;

select *
from Employee
where Ename ='Smith';

select sal*12
from Employee;

select Ename,sal*12 as Annualsal
from Employee;

select Sal, sal+50
from Employee;

select sal-20 
from Employee;

select sal/2
from Employee;

select Ename,sal/2
from Employee
where Ename='Smith';

select Ename, sal
from Employee
where sal=500;

select *
from Employee
where Hiredate ='2025-05-15';

select *
from Employee
where Hiredate !='2025-05-15';

select *
from Employee
where sal !=500;

select *
from Employee
where sal >200;

select *
from Employee
where sal >=200;

select *
from Employee
where sal <200;

select *
from Employee
where sal <=200;


select *
from Employee
where Deptno='D1' and Hiredate='2025-05-15';

select * from Employee;

select * 
from Employee
where Deptno='D1' and Ename='Smith';

select * 
from Employee
where Deptno='D1' and sal=6000;

select Ename, (sal*12+200)
from Employee;

select *
from Employee
where Sal=100 or Deptno='D1';

select *
from Employee
where Deptno='D1' or CID='1A';

select *
from Employee
where Deptno='D1' and CID='1A';



select * from Employee;

select *
from Employee
where Sal=100 or Sal=500;

select *
from Employee
where Sal>=100 or Sal<=200;

select *
from Employee
where Hiredate < '2025-05-15' or Hiredate > '2025-01-01';

select *
from Employee
where Sal=500 or Hiredate!='2025-01-01';

select *
from Employee
where Deptno = 'D1' and CID != '1A';


--sal>500 and (Denpno=D1 or D2)
select *
from Employee
where Sal >500 and (Deptno ='D1' or Deptno='D2');

--sal <200 and (sal !=100 or sal !=6000)
select *
from Employee
where Sal <200 and (Sal !=100 or sal !=6000);

Select *
From Employee
Where not Deptno ='D1';

Select *
From Employee
Where not Deptno ='D1';

select * 
from Employee
where Deptno != 'D1'and Deptno !='D2';

select *
from Department
where DeptNo!='D1';

select * from Employee;
select * from Department;

--Multiple subqueries
SELECT * 
FROM Employee 
WHERE Sal > (SELECT Sal FROM Employee WHERE Ename = 'Ford')
   and Hiredate > (SELECT Hiredate FROM Employee WHERE Ename = 'Adem');


SELECT * 
FROM Employee 
WHERE Sal > (SELECT Sal FROM Employee WHERE Ename = 'Ford')
   or Hiredate > (SELECT Hiredate FROM Employee WHERE Ename = 'Adem');

select * from Employee;
select * from Department;

--case 2
--loc of fords
select Loc
from Department
where DeptNo = (select DeptNo from Employee where Ename='Jon');

select *
from Department 
where DeptNo  =(select DeptNo from Employee where Loc like 'L%');   
-- op L1, L2,L3


--special operator
--All operator

select *
from Department
where DeptNo  > all (select DeptNo from Employee where Ename='Smith');

select *
from Employee
where Sal > All (select Sal from Employee where Ename ='King');


select *
from Employee
where Sal > All (select Sal from Employee where Ename ='Smith');

select *
from Employee
where Sal >= All (select Sal from Employee where Ename ='Smith');

select *
from Employee
where Sal < All (select Sal from Employee where Ename ='Smith');

select *
from Employee
where Sal <= All (select Sal from Employee where Ename ='Smith');

--case 2 Example

select Loc
from Department
where DeptNo = (select DeptNo from Employee where Ename = 'Jon');

select * from Employee;


--Group by clause
--count(*)

select count(*), Deptno
from Employee
group by Deptno;


select count(*) as Number_Emp, Deptno
from Employee
group by Deptno;

select CID, count(*) as CID_Count
from Employee
group by CID;

--where and group by

select Deptno, count(*) as Count_Deptno
from Employee
where Hiredate ='2025-01-01'
group by Deptno;

select Deptno, count(*) as Count_Deptno
from Employee
where Hiredate !='2025-01-01'
group by Deptno;

select * from Employees;
select * from Departments;

select count(*) as job_no
from Employees
where JobTitle='Software Engineer'
group by DeptID;

select Gender, count(*) as Sal
from Employees
where Salary <'75000.00'
group by Gender;

select Gender, count(*) as Sal
from Employees
where Salary >'75000.00'
group by Gender;

select Gender, count(*) as Sal
from Employees
where Salary <='75000.00'
group by Gender; 

select Gender, count(*) as Sal
from Employees
where Salary >='75000.00'
group by Gender;


select count(*) as City_No
from Employees
where City='Pune' and City='Mumbai'
group by DeptID;

--select count(*) , Deptno
--from Employee
--where count(*) >=2
--group by Deptno;


-- Having clause
select count(*), Deptno
from Employee
group by Deptno
Having count(*)>1;

select count(*), Deptno
from Employee
group by Deptno
Having count(*)<1;

select count(*), Deptno
from Employee
group by Deptno
Having count(*)>=1;

select count(*), Deptno
from Employee
group by Deptno
Having count(*)<=1;

select count(Deptno), Deptno
from Employee
group by Deptno
Having count(*)>=1;

select max(Sal) as Max_Sal
from Employee
group by Deptno

--multi row function
--max()

select max(Sal)
from Employee;

select max(Sal)
from Employee
where Deptno ='D2';

select max(Sal)
from Employee
where Deptno ='D1';

select max(Sal)
from Employee
where Deptno ='D3';


select max(Sal)
from Employee
where Deptno ='D2' and Deptno= 'D1';

select max(Sal)
from Employee
where Deptno ='D2' or Deptno= 'D1';

select max(Sal) as max_Sal
from Employee
group by Deptno;

select max(Sal)
from Employee
group by Deptno
having sum(Sal)>200;

--2) min multi row function
select min(Sal) as minSal
from Employee;

select min(Sal)
from Employee
where Deptno='D1';

select min(Sal)
from Employee
where Deptno='D2';

select min(Sal)
from Employee
where Deptno='D3';

select min(Sal)
from Employee
where Deptno= 'D1' and Deptno='D2';

select min(Sal)
from Employee
where Deptno= 'D1' or Deptno='D2';

select min(Sal)
from Employee
group by Deptno;

select min(Sal)
from Employee
having sum(Sal)>200;

select min(Sal)
from Employee
where Deptno='D1'
group by Deptno
having min(Sal)>50;


--3)sum() multi row function

select sum(Sal)
from Employee;


select sum(Sal)
from Employee
where Deptno='D1';

select sum(Sal)
from Employee
where Deptno='D2';

select sum(Sal)
from Employee
where Deptno='D3';

select sum(Sal)
from Employee
group by Deptno;

select sum(Sal)
from Employee
where Deptno= 'D1'
group by Deptno
having sum(Sal)>500;

select avg(Sal)
from Employee;

select avg(Sal)
from Employee
where Deptno ='D1';

select avg(Sal)
from Employee
where Deptno ='D2'; 

select avg(Sal)
from Employee
where Deptno ='D3'; 

select avg(Sal)
from Employee
group by Deptno;

select avg(Sal)
from Employee
group by Deptno
having avg(Sal)>=1;

select * from Employee;

select avg(Sal)
from Employee
where Hiredate ='2025-05-15'
group by Deptno
having count(*)>=1;

select sum(*)
from Employee;

--1)
select Ename, max(Sal)
from Employee 
group by Ename;

--2) using sub querries
select Ename,Sal
from Employee
where Sal =(select max(Sal) from Employee);

select Ename,Sal
from Employee
where Sal =(select min(Sal) from Employee);





--having sum(Sal) >100;


select * from Employees;
select count(*)
from Employees
where Hiredate ='2020-01-15'
group by DeptID
having count(*)>=1;

select * from Employee;
--Sigle row function
--1) len-

select len(Ename) as Length_of_Ename
from Employee;

select len(Ename)
from Employee
where Ename='Smith';

select len(Ename)
from Employee
where Ename='Smith' or Ename='King';

select len(Ename)
from Employee
where Ename='Smith' and Ename='King';

select * from Employee;

select len(Ename)
from Employee
where Sal='100' and Ename='Smith';

select len(Ename)
from Employee
where Sal='100' or Ename='Smith';

--ii) upper

select upper(Ename)
from Employee;

select upper(Ename)
from Employee
where Ename='Smith';

select upper(Ename)
from Employee
where Ename='Smith';

select upper(Ename)
from Employee
where Ename='Smith' or Ename='King';

select upper(Ename)
from Employee
where Ename='Smith' and Ename='King';

select upper(Ename)
from Employee
where Ename='Smith' and sal!=100;

--iii)lower function

select lower(Ename)
from Employee;

select * from Employees;

select lower(JobTitle)
from Employees
where DeptID=1;

select upper(JobTitle)
from Employees
where DeptID=1;

select LOWER(EmpName)
from Employees
where Gender='F' or City='Pune';

select LOWER(City)
from Employees
where Gender='F' or City='Pune';

select LOWER(JobTitle)
from Employees
where Gender='F' or City='Pune';

select LOWER(JobTitle)
from Employees
where Gender='F' and City='Pune';

select LOWER(EmpName)
from Employees
where Gender='F' and City='Pune';

select * from Employees;

select Len(JobTitle)
from Employees
where EmpName='Bob';

select JobTitle
from Employees
where EmpID=102;

select SUBSTRING(JobTitle,9,17)
from Employees
where EmpID=102;

select LTRIM(Ename)
from Employee;

select LTRIM(JobTitle)
from Employees
where EmpID=102;

select RTRIM(JobTitle)
from Employees;

select RTRIM(JobTitle)
from Employees
where EmpID=102;

select *
from Employees;

select CHARINDEX('w', JobTitle)
from Employees;

select CHARINDEX('e', JobTitle)
from Employees;

select CONCAT(EmpName,' ',JobTitle)
from Employees;

select CONCAT(EmpName,' ',JobTitle,' ',City)
from Employees;

select 'EmpName' + 'JobTitle';
select 'SQl '+ 'Class';

select LEFT(JobTitle,5)
from Employees;

select RIGHT(JobTitle,5)
from Employees;

select Replace(JobTitle,'e','z')
from Employees;

select * from Employees;

select ASCII(EmpName)
from Employees;

select char(70) as ASCIIValue;

select * from Employees;

select charindex('e', EmpName)
from Employees;

SELECT CONCAT_WS('.', 'www', 'W3Schools', 'com');

select DATALENGTH(EmpName)
from Employees;

SELECT DIFFERENCE('Pranoti', 'Santosh');

SELECT FORMAT(123456789, '##-##-#####');

SELECT NCHAR(66) AS NumberCodeToUnicode;

SELECT PATINDEX('%schools%', 'W3Schools.com');

SELECT SOUNDEX('Juice'), SOUNDEX('Jucy');

SELECT SOUNDEX('Juice'), SOUNDEX('Banana');

SELECT SPACE(10);
				
SELECT STR(123);

SELECT STUFF('SQL Tutorial', 1, 3, 'HTML');

SELECT TRANSLATE('Monday', 'Monday', 'Sunday'); 

select TRANSLATE('Pranoti Wagh','Wagh','abcd');

SELECT TRIM('     SQL Tutorial!     ') AS TrimmedString;

SELECT UNICODE('Atlanta');

SELECT QUOTENAME('abcdef');

SELECT REPLICATE('SQL Tutorial ', 5);

SELECT REVERSE('SQL Tutorial');

select GETDATE();

select CURRENT_TIMESTAMP;

select DATEPART(YEAR,GETDATE())

select DATEPART(MONTH,GETDATE())

select DATEPART(DAY,GETDATE())

select SYSDATETIME();

select DATENAME(MONTH,GETDATE());

select DAY(GETDATE()), MONTH(GETDATE()), Year(GETDATE());

select DATEADD(Day, 10, GetDate());

select DATEDIFF(Day,'01-01-2025', GetDate());

select FORMAT(getdate(),'dd-mm-yy');

--3) Numeric Function
--1) abs()
select abs(-10) as Absolute_value;

--2)celing
select CEILING(4.3) as celing;

--3)Floor
select FLOOR(4.3) as floor;

--4)power()-
select power(2,3) as power;

--5) round()-
select round(12.123456789,2);

--6) sqrt
select sqrt(25) as sqrt;

--7) square
select square(5) as square;

--8) sign()
select sign(10) as sign;

select * from Employee;
Select * from Employee;

select [Ename],[Sal] from [Employee];

--select [First Name%], [Last Name*] from [Table Name#];

--select [first Name] from [Table Name#];

select max(Sal)
From Employee
Where sal< (select max(Sal) from Employee);

select max(Sal)
From Employee
Where sal< (select max(Sal) 
            from Employee
			where sal< (select max(Sal) 
			            from Employee));

select max(Sal)
From Employee
Where sal< (select max(Sal) 
            from Employee
			where sal< (select max(Sal) 
			            from Employee
						where sal < (select max(Sal)
						            from Employee)));

select min(sal)
from Employee
where sal> (select min(sal)
            from Employee
			where sal> (select min(sal)
			            from Employee
						where sal> (select min(sal)
						            from Employee)));

select *
from Employee
where Hiredate in(select min(Hiredate)
                  from Employee
				  where Hiredate >(select min(Hiredate)
								   from Employee));


--to find Employee mgr relationship
--to find manager
select Ename
from employee
where Empno in(select mgr from Employee where Ename = 'A');

--to find employee
select Ename
from employee
where mgr in(select Empno from Employee where Ename = 'A');

--1)cross joint example
select *
from Employee,Department;

--select Ename, DeptName
--from Employee, Department;

select * from Employee;
Select * from Department;

--2)Inner joint
Select *
From Employee join Department
on Employee.DeptNo= Department.DeptNo; 

select e.Empno, e.Ename, e.Sal, d.DeptName
from Employee e
inner join Department d
on e.DeptNo = d.DeptNo;

select e.Empno, e.Ename,d.DeptName, d.Loc
from Employee e
inner join Department d
on e.DeptNo = d.DeptNo
where e.Ename='Smith';


select e.Empno, e.Ename,d.DeptName, d.Loc
from Employee e
inner join Department d
on e.DeptNo = d.DeptNo
where e.Ename='Smith' or e.Ename='Miller';

select e.Empno, e.Ename,d.DeptName, d.Loc
from Employee e
inner join Department d
on e.DeptNo = d.DeptNo
where e.Ename='Smith' and e.Ename='Miller';

select e.Empno, e.Ename, e.Sal,e.DeptNo, d.DeptNo,d.DeptName
from Employee e
inner join Department d
on e.DeptNo = d.DeptNo
where d.DeptName='Sales';

select e.Empno, e.Ename, e.Sal,e.DeptNo, d.DeptNo,d.DeptName
from Employee e
inner join Department d
on e.DeptNo = d.DeptNo
where d.DeptName='Sales' or d.DeptName='Manager';


select e.Empno, e.Ename, e.Sal,e.DeptNo, d.DeptNo,d.DeptName
from Employee e
inner join Department d
on e.DeptNo = d.DeptNo
where d.DeptName='Sales' or e.Ename='Smith' 


select e.Empno, e.Ename, e.Sal,e.DeptNo, d.DeptNo,d.DeptName
from Employee e
inner join Department d
on e.DeptNo = d.DeptNo
where d.DeptName='Sales' and e.Ename='Smith' 

select count(e.Empno)
from Employee e
inner join Department d
on e.DeptNo = d.DeptNo
group by d.DeptName;

--3) Outer join
--a) Left outer join

select *
from Employee
Left outer join Department
on Employee.DeptNo = Department.DeptNo;

select *
from Employee
Left outer join Department
on Employee.DeptNo = Department.DeptNo;

select *
from Employee
Right outer join Department
on Employee.DeptNo = Department.DeptNo;


select *
from Department
Right outer join Employee
on Employee.DeptNo = Department.DeptNo;

select e.Empno, e.Ename , d.DeptName
from Employee e
Left outer join Department d
on e.Deptno = d.DeptNo;

select e.Empno, e.Ename , d.DeptName
from Employee e
Left outer join Department d
on e.Deptno = d.DeptNo
where Ename='Smith';

select e.Empno, e.Ename , d.DeptName
from Employee e
Left outer join Department d
on e.Deptno = d.DeptNo
where e.Ename='Smith' or e.Ename='Miller';

select e.Empno, e.Ename , d.DeptName
from Employee e
Left outer join Department d
on e.Deptno = d.DeptNo
where e.Ename='Smith' and e.Ename='Miller';