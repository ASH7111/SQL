/*
You are going to build a project based on "Library Management System". It keeps track all information about books in the
library, their cost, status and total number of books available in the library. 

## Create a database named 'library' and create following TABLES in the database: 
1.  Branch 
2.  Employee 
3.  Customer 
4.  IssueStatus 
5.  ReturnStatus 
6.  Books

## Attributes for the tables: 
1) Branch 
o Branch_no -(Set as PRIMARY KEY)
o Manager_Id 
o Branch_address 
o Contact_no 
 
2) Employee 
o Emp_Id –(Set as PRIMARY KEY)
o Emp_name 
o Position 
o Salary

## Please Note: (Manager_Id from Branch table) can be considered as (Emp_Id in Employee table). 

3) Customer 
o Customer_Id -(Set as PRIMARY KEY)
o Customer_name 
o Customer_address 
o Reg_date 
 
4) IssueStatus 
o Issue_Id -(Set as PRIMARY KEY)
o Issued_cust –(Set as FOREIGN KEY and it refer customer_id in CUSTOMER table)
o Issued_book_name 
o Issue_date 
o Isbn_book –(Set as FOREIGN KEY and it should refer ISBN in BOOKS table)

 
5) ReturnStatus 
o Return_Id -(Set as PRIMARY KEY) 
o Return_cust 
o Return_book_name 
o Return_date 
o Isbn_book2 -(Set as FOREIGN KEY and it should refer ISBN in BOOKS table)


6) Books 
o ISBN  -(Set as PRIMARY KEY)
o Book_title 
o Category 
o Rental_Price 
o Status [Give 'yes' if book available and 'no' if book not available] 
o Author 
o Publisher

*/

CREATE DATABASE library;
USE library;

-- 1) 
CREATE TABLE Branch (
  Branch_no INT PRIMARY KEY,
  Manager_Id INT,
  Branch_address VARCHAR(255),
  Contact_no VARCHAR(20)
);
INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no) VALUES
(1, 101, '123 Main St', '555-123-4567'),
(2, 102, '456 Elm St', '555-987-6543'),
(3, 103, '789 Oak Ave', '555-456-7890'),

(4, 104, '567 Walnut St', '555-111-2222'),
(5, 105, '789 Cherry Ave', '555-333-4444'),
(6, 106, '901 Pineapple Ln', '555-555-5555');
SELECT * FROM Branch;


-- 2) 
CREATE TABLE Employee (
  Emp_Id INT PRIMARY KEY,
  Emp_name VARCHAR(255),
  Position VARCHAR(255),
  Salary DECIMAL(10, 2)
);
INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary) VALUES
(101, 'John Smith', 'Manager', 60000.00),
(102, 'Jane Doe', 'Assistant', 45000.00),
(103, 'Mark Johnson', 'Assistant', 55000.00),
(104, 'Emily Brown', 'Clerk', 35000.00),

(105, 'Jessica Adams', 'Assistant', 50000.00),
(106, 'Andrew Wilson', 'Manager', 65000.00),
(107, 'Sophia Thompson', 'Assistant', 48000.00),
(108, 'Jacob Roberts', 'Clerk', 36000.00);
SELECT * FROM Employee;



-- 3) 
CREATE TABLE Customer (
  Customer_Id INT PRIMARY KEY,
  Customer_name VARCHAR(255),
  Customer_address VARCHAR(255),
  Reg_date DATE
);
INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date) VALUES
(1, 'Michael Lee', '111 Pine St', '2021-08-15'),
(2, 'Sarah Miller', '222 Maple Ave', '2022-01-20'),
(3, 'David Wilson', '333 Oak Ln', '2023-03-10'),

(4, 'Emma Davis', '444 Elm St', '2022-05-10'),
(5, 'Liam Johnson', '555 Oak Ln', '2023-01-05'),
(6, 'Olivia Smith', '666 Maple Ave', '2023-04-20');
SELECT * FROM Customer;



-- 4) 
CREATE TABLE IssueStatus (
  Issue_Id INT PRIMARY KEY,
  Issued_cust INT,
  Issued_book_name VARCHAR(255),
  Issue_date DATE,
  Isbn_book VARCHAR(255),
  FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
  FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);
INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book) VALUES
(1, 1, 'Book A', '2023-06-05', 'ISBN001'),
(2, 2, 'Book B', '2023-06-10', 'ISBN002'),
(3, 3, 'Book C', '2023-06-12', 'ISBN003'),
(4, 1, 'Book D', '2023-06-15', 'ISBN004'),

(5, 4, 'Book E', '2023-06-05', 'ISBN005'),
(6, 5, 'Book F', '2023-06-10', 'ISBN006'),
(7, 6, 'Book G', '2023-06-12', 'ISBN007'),
(8, 4, 'Book H', '2023-06-15', 'ISBN008');
SELECT * FROM IssueStatus;




-- 5) 
CREATE TABLE ReturnStatus(
  Return_Id INT PRIMARY KEY,
  Return_cust INT,
  Return_book_name VARCHAR(255),
  Return_date DATE,
  Isbn_book2 VARCHAR(255),
  FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
  FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);
INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2) VALUES
(1, 1, 'Book A', '2023-06-18', 'ISBN001'),
(2, 2, 'Book B', '2023-06-20', 'ISBN002'),
(3, 3, 'Book C', '2023-06-21', 'ISBN003'),

(4, 4, 'Book E', '2023-06-18', 'ISBN005'),
(5, 5, 'Book F', '2023-06-20', 'ISBN006'),
(6, 6, 'Book G', '2023-06-21', 'ISBN007');
SELECT * FROM ReturnStatus;



-- 6)
CREATE TABLE Books (
  ISBN VARCHAR(255) PRIMARY KEY,
  Book_title VARCHAR(255),
  Category VARCHAR(255),
  Rental_Price DECIMAL(10, 2),
  Status ENUM('yes', 'no'),
  Author VARCHAR(255),
  Publisher VARCHAR(255)
);
INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) VALUES
('ISBN001', 'Book A', 'Fiction', 10.00, 'yes', 'John Smith', 'ABC Publishing'),
('ISBN002', 'Book B', 'Mystery', 8.50, 'yes', 'Sarah Johnson', 'XYZ Books'),
('ISBN003', 'Book C', 'History', 12.00, 'no', 'Michael Brown', 'DEF Publishers'),
('ISBN004', 'Book D', 'Fiction', 9.00, 'yes', 'Emily Davis', 'GHI Press'),

('ISBN005', 'Book E', 'Science Fiction', 11.00, 'yes', 'Emily Johnson', 'JKL Publishing'),
('ISBN006', 'Book F', 'Romance', 9.50, 'yes', 'Daniel Wilson', 'MNO Books'),
('ISBN007', 'Book G', 'Biography', 10.00, 'no', 'Sophia Adams', 'PQR Publishers'),
('ISBN008', 'Book H', 'Fiction', 8.00, 'yes', 'Liam Davis', 'STU Press');
SELECT * FROM Books;

### Write the queries for the following: 
# 1. Retrieve the book title, category, and rental price of all available books. 
SELECT * FROM books;

SELECT Book_title, Category, Rental_Price
FROM books;


# 2. List the employee names and their respective salaries in descending order of salary. 
SELECT * FROM employee;

SELECT Emp_name, Salary 
FROM employee
ORDER BY Salary desc;


# 3. Retrieve the book titles and the corresponding customers who have issued those books. 

-- SELECT Book_title, Customer_name
-- FROM ;



/*
SELECT Client.ClientId, Client.Clientname
FROM Client
JOIN Country ON Client.Cid = Country.cid
WHERE Country.cname = 'India';
*/


# 4. Display the total count of books in each category. 
SELECT * FROM books;

SELECT COUNT(Category) as No_of_Books, Category
FROM books
GROUP BY Category;



# 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
SELECT * FROM employee;

SELECT Emp_name, Position
FROM employee
WHERE Salary>50000;


# 6. List the customer names who registered before 2022-01-01 and have not issued any books yet. 
SELECT * FROM customer;

SELECT Customer_name 
FROM customer 
WHERE Reg_date < '2022-01-01';



# 7. Display the branch numbers and the total count of employees in each branch. 




# 8. Display the names of customers who have issued books in the month of June 2023. 
SELECT * FROM books;
SELECT * FROM branch;
SELECT * FROM customer;
SELECT * FROM employee;
SELECT * FROM issuestatus;
SELECT * FROM returnstatus;


# 9. Retrieve book_title from book table containing history. 
SELECT * FROM books;


# 10. Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.


