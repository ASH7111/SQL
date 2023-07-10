
/* 
### Read the questions below and write the SQL queries. 

1)  Create a table "Employee" with fields : 
o Empid  PRIMARY KEY INT 
o Empname  VARCHAR(20) 
o DepartmentId VARCHAR(5) [Hint: This column should contain repetitions and values in the column can be numbers.Not Unique] 
o Contactno  BIGINT 
o Emailid VARCHAR(100) 
o Empheadid INT

2)  Create a table "EmpDept" with fields: 
o DeptId PRIMARY KEY INT 
o DeptName VARCHAR(100) 
o Dept_off VARCHAR(100) [Hint: A day in which employee take an 
off] 
o DeptHead INT 
 
 
3)   Create a table "EmpSalary" with fields: 
o EmpId PRIMARY KEY INT 
o Salary VARCHAR(100) 
o IsPermanent VARCHAR(100) [Hint : Values should be yes or no]


4)  Create a table "Project" with fields: 
o ProjectId PRIMARY KEY INT 
o Duration INT 
 
 
5)  Create table "Country" with fields : 
o cid PRIMARY KEY INT 
o cname VARCHAR(40) 
 
 
6)  Create a table "Client" with fields: 
o ClientId PRIMARY KEY INT 
o Clientname VARCHAR(100)
o Cid FOREIGN KEY INT 
 
 
7)  Create a table "EmpProject" with fields: 
o EmpId FOREIGN KEY INT 
o ProjectId FOREIGN KEY INT 
o ClientID FOREIGN KEY INT 
o StartYear INT 
o EndYear INT

*/
CREATE DATABASE comp;
USE comp;


-- 1)
CREATE TABLE Employee(
Empid INT PRIMARY KEY, 
Empname  VARCHAR(20), 
DepartmentId VARCHAR(10),
-- [Hint: This column should contain repetitions and values in the column can be numbers. Not Unique]
Contactno  BIGINT, 
Emailid VARCHAR(100), 
Empheadid INT
);
INSERT INTO Employee (Empid, Empname, DepartmentId, Contactno, Emailid, Empheadid) VALUES
(1, 'Darsh Das', '104', 1234567890, 'darsh.das@example.com', 3),
(2, 'Jeet Shah', '102', 9876543210, 'jeet.shah@example.com', 3),
(3, 'Anu Kumari', '104', 4567891230, 'anu.kumari@example.com', 4),
(4, 'Anisha Das', '101', 7891234560, 'anisha.das@example.com', 4),
(5, 'Ashish Shah', '102', 3456789012, 'anisha.shah@gmail.com', 2),
(6, 'Hari Chopra', '104', 8765432109, 'hari.chopra@gmail.com', 3),
(7, 'Raju Singh', '101', 7894561230, 'raju.singh@example.com', 4),
(8, 'John Mathew', '102', 2345678901, 'john.mathew@example.com', 2),
(9, 'Anjitha Tony', '103', 3456789012, 'anjitha.tony@example.com', 5),
(10, 'Aaliya Mary', '104', 4567891234, 'aaliya.mary@example.com', 3);
SELECT * FROM Employee;


-- 2)
CREATE TABLE EmpDept( 
DeptId INT PRIMARY KEY,
DeptName VARCHAR(100),
Dept_off VARCHAR(100),
-- [Hint: A day in which employee take an off] 
DeptHead INT 
);
INSERT INTO EmpDept (DeptId, DeptName, Dept_off, DeptHead) VALUES
(101, 'Finance', 'Sunday', 4),
(102, 'IT', 'Friday', 4),
(103, 'Sales', 'Wednesday', 5),
(104, 'HR', 'Monday', 3),
(105, 'Marketing', 'Thursday', 6),
(106, 'Operations', 'Tuesday', 7),
(107, 'Research', 'Thursday', 8),
(108, 'Quality Assurance', 'Friday', 9),
(109, 'Engineering', 'Monday', 10),
(110, 'Administration', 'Wednesday', 11);
SELECT * FROM EmpDept;



-- 3)
CREATE TABLE EmpSalary( 
EmpId INT PRIMARY KEY,
Salary VARCHAR(100),
IsPermanent VARCHAR(100)
-- [Hint : Values should be yes or no]
);
INSERT INTO EmpSalary (EmpId, Salary, IsPermanent) VALUES
(1, '5000', 'Yes'),
(2, '6000', 'Yes'),
(3, '4500', 'Yes'),
(4, '5500', 'No'),
(5, '7000', 'Yes'),
(6, '5500', 'Yes'),
(7, '6000', 'Yes'),
(8, '5000', 'Yes'),
(9, '6500', 'Yes'),
(10, '4500', 'No');
SELECT * FROM EmpSalary;


-- 4)
CREATE TABLE Project(
ProjectId INT PRIMARY KEY,
Duration INT 
);
INSERT INTO Project(ProjectId, Duration) VALUES
(1, 6),
(2, 8),
(3, 12),
(4, 10),
(5, 7),
(6, 9),
(7, 7),
(8, 11),
(9, 8),
(10, 5);
SELECT * FROM Project;
 
 
-- 5)
CREATE TABLE Country(
cid INT PRIMARY KEY, 
cname VARCHAR(40) 
);
INSERT INTO Country (cid, cname) VALUES
(1, 'USA'),
(2, 'UK'),
(3, 'Canada'),
(4, 'Germany'),
(5, 'Australia'),
(6, 'France'),
(7, 'Japan'),
(8, 'Brazil'),
(9, 'China'),
(10, 'India');
SELECT * FROM Country;

 
-- 6)  
CREATE TABLE Client( 
ClientId INT PRIMARY KEY, 
Clientname VARCHAR(100),
Cid INT ,
FOREIGN KEY (Cid) REFERENCES Country(cid)
);
INSERT INTO Client (ClientId, Clientname, Cid) VALUES
(1, 'ABC Corporation', 1),
(2, 'XYZ Corporation', 2),
(3, '123 Corporation', 3),
(4, 'EFG Corporation', 4),
(5, '456 Corporation', 5),
(6, 'LMN Corporation', 6),
(7, 'GHI Corporation', 7),
(8, 'PQR Corporation', 8),
(9, 'MNO Corporation', 9),
(10, 'RST Corporation', 10);
SELECT * FROM Client;
 
 
-- 7)  
CREATE TABLE EmpProject( 
EmpId INT,
ProjectId INT,
ClientID INT,
StartYear INT,
EndYear INT,
FOREIGN KEY (EmpId) REFERENCES Employee(Empid),
FOREIGN KEY (ProjectId) REFERENCES Project(ProjectId),
FOREIGN KEY (ClientID) REFERENCES Client(ClientId)
);
INSERT INTO EmpProject (EmpId, ProjectId, ClientID, StartYear, EndYear) VALUES
(1, 1, 1, 2022, 2023),
(2, 2, 2, 2022, 2024),
(3, 1, 1, 2023, 2024),
(4, 3, 3, 2023, 2025),
(5, 4, 4, 2010, 2010),
(6, 5, 5, 2010, 2010),
(7, 6, 6, 2022, 2023),
(8, 7, 7, 2024, 2025),
(9, 8, 8, 2023, 2024),
(10, 9, 9, 2022, 2023);
SELECT * FROM EmpProject;


#####---------------------------------------------------------------------------------------------#####

# 8) Select the detail of the employee whose name start with P. 
SELECT * FROM Employee;

SELECT * 
FROM Employee
WHERE Empname like 'P%';



# 9) How many permanent employee take salary more than 5000. 
SELECT * FROM  EmpSalary;

SELECT * FROM EmpSalary
WHERE Salary>5000 and IsPermanent= 'Yes';



# 10) Select the detail of employee whose emailId is in gmail. 
SELECT * FROM Employee;

SELECT * 
FROM Employee
WHERE Emailid like '%gmail%';



# 11) Select the details of the employee who work either for department 104 or 102.
SELECT * FROM Employee;

SELECT *
FROM Employee
WHERE DepartmentId = '104' OR DepartmentId = '102';



# 12) What is the department name for DeptID 102 ? 
SELECT * FROM EmpDept;

SELECT DeptName
FROM EmpDept
WHERE DeptId = 102;



# 13) What is total salary that is paid to permanent employees? 
SELECT * FROM EmpSalary;

SELECT SUM(Salary) as Total_Salary
FROM EmpSalary
WHERE IsPermanent= 'Yes';



# 14) List name of all employees whose name ends with a. 
SELECT * FROM Employee;

SELECT Empname
FROM Employee
WHERE Empname like '%a';



# 15) List the number of department of employees in each project. (CHECK)
SELECT * FROM EmpProject;
SELECT * FROM Project;
SELECT * FROM Employee;
 
SELECT EP.ProjectId, COUNT(DISTINCT E.DepartmentId) AS Number_of_Departments
FROM EmpProject as EP
	JOIN Employee as E 
    ON EP.EmpId = E.Empid
GROUP BY EP.ProjectId;



# 16) How many project started in year 2010. 
SELECT * FROM EmpProject;

SELECT COUNT(*) as No_of_Projects_in_2010
FROM EmpProject
WHERE StartYear= 2010;



# 17) How many project started and finished in the same year. 
SELECT COUNT(*) as No_of_Projects_completed_same_year
FROM EmpProject
WHERE (EndYear - StartYear = 0);

# or,
SELECT COUNT(*) as No_of_Projects_completed_same_year
FROM EmpProject
WHERE (EndYear = StartYear);



# 18) Select the name of the employee whose name's 3rd character is 'h'.
SELECT * FROM Employee;

SELECT Empname
FROM Employee
WHERE Empname like '__h%';


# 19) Select the department name of the company which is assigned to the employee whose employee id is greater 103.        
-- (CHECK)
SELECT * FROM EmpDept;
SELECT * FROM Employee;

SELECT Employee.Empname, EmpDept.DeptName
FROM Employee
	JOIN EmpDept 
    ON Employee.DepartmentId = EmpDept.DeptId
WHERE Employee.Empid > 103;



# 20) Select the name of the employee who is working under Abhishek.(Considering: Anu Kumari in this DataBase). 
SELECT * FROM EmpDept;
SELECT * FROM Employee;

# Getting the details of Anu Kumari, from which we can get the Empid of Anu Kumari.
SELECT * FROM Employee WHERE Empname= 'Anu Kumari';

# Displaying the details of all Employees whose Emphead is 'Anu Kumari' i.e, Empid of Anu Kumari is 3.
SELECT Empname
FROM Employee
WHERE Empheadid= 3;   



# 21) Select the name of the employee who is department head of HR. 
SELECT * FROM EmpDept;
SELECT * FROM Employee;

SELECT Employee.Empname
FROM Employee
	JOIN EmpDept ON Employee.Empid = EmpDept.DeptHead
WHERE EmpDept.DeptName = 'HR';



# 22) Select the name and email of the Dept Head who is not Permanent. 
SELECT * FROM EmpDept;
SELECT * FROM Employee;
SELECT * FROM EmpSalary;

SELECT Employee.Empname, Employee.Emailid
FROM Employee
	JOIN EmpDept ON Employee.Empid = EmpDept.DeptHead
	JOIN EmpSalary ON Employee.Empid = EmpSalary.EmpId
WHERE EmpSalary.IsPermanent = 'No';



# 23) Select the employee whose department off is Monday. 
SELECT * FROM Employee;
SELECT * FROM EmpDept;

SELECT Employee.*
FROM Employee
	JOIN EmpDept ON Employee.DepartmentId = EmpDept.DeptId
WHERE EmpDept.Dept_off = 'Monday';



# 24) Select the Indian clients details.
SELECT * FROM Country;
SELECT * FROM Client;

SELECT Client.ClientId, Client.Clientname
FROM Client
	JOIN Country ON Client.Cid = Country.cid
WHERE Country.cname = 'India';



# 25) Select the details of all employee working in development department.
SELECT * FROM Employee;
SELECT * FROM EmpDept;

SELECT Employee.*, EmpDept.DeptName
FROM Employee
	JOIN EmpDept ON Employee.DepartmentId = EmpDept.DeptId
WHERE EmpDept.DeptName = 'Finance';


###--------------------------------------------------------------------------------------------------------------###
