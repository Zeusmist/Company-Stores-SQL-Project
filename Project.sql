--Added more employees, because each branch should have at least 1 of each position.
--Changed Item to product ID in Orders table, referencing Product ID in Products table.
--Added more orders.
--Added more entries to Stocks table, because each branch should have each product. Also changed store ID from identity to normal int.


create database LoyalPerk
use LoyalPerk

--SALES
create table Customers (
	[Customer ID] int not null identity(301, 1),
	[First Name] varchar(max) not null,
	[Last Name] varchar(max) not null,
	Phone bigint not null,
	Email nvarchar(50) not null,
	City varchar(max) not null,
	[State] varchar(max) not null,
	[Zip Code] nvarchar(15) not null,
	primary key ([Customer ID])
)

insert into Customers values ('Lolade', 'Abimbola', 2347044268789, 'lola@gmail.com', 'Yaba', 'Lagos', '100001')
insert into Customers values ('Ada', 'Achebe', 2349055458867, 'ada20@gmail.com', 'Anaocha', 'Anambra', '422103')
insert into Customers values ('Ahmed', 'Lawal', 2347032453221, 'lawal@yahoo.com', 'Giwa', 'Kaduna', '810105')
insert into Customers values ('Rotimi', 'Adeosun', 2348134765467, 'roro23a@gmail.com', 'Ikere', 'Ekiti', '361272')
insert into Customers values ('Glory', 'Damilola', 2347045321099, 'dami@gmail.com', 'Lekki', 'Lagos', '106101')

select * from Customers


create table Employees (
	[Employee ID] int not null identity(101, 1),
	[First Name] varchar(max) not null,
	[Last Name] varchar(max) not null,
	Email nvarchar(50) not null,
	Phone bigint not null,
	Position varchar(20) not null,
	[Store ID] int not null,
	primary key ([Employee ID]),
	constraint FK_StoreID FOREIGN KEY([Store ID])  references Stores([Store ID]),
)

insert into Employees values('Richrad', 'Daniel', 'richie@gmail.com', 2345643238976, 'Manager', 201)
insert into Employees values('Tomiwa', 'Fatobi', 'tommy@gmail.com', 2342356431256, 'Assistant Manager', 202)
insert into Employees values('Mary', 'Semore', 'mary@gmail.com', 2347854249809, 'Clerk', 203)
insert into Employees values('Aishat', 'Akanbi', 'aishat@yahoo.com', 2347857983422, 'Cashier', 204)
insert into Employees values('Daniel', 'Gboyega', 'danny@yahoo.com', 2344565234477, 'Cashier', 205)
insert into Employees values('Luke', 'Brandson', 'luke@gmail.com', 2345643238976, 'Manager', 202)
insert into Employees values('Lekan', 'Lola', 'lekan@gmail.com', 2342356431256, 'Assistant Manager', 201)
insert into Employees values('Nneka', 'Chiagozie', 'nneka@gmail.com', 2347854249809, 'Clerk', 201)
insert into Employees values('Jude', 'Rivers', 'rivers@yahoo.com', 2347857983422, 'Cashier', 201)
insert into Employees values('Samuel', 'Martha', 'samart@yahoo.com', 2344565234477, 'Cashier', 201)
insert into Employees values('David', 'Mark', 'dark@gmail.com', 2345643238976, 'Manager', 203)
insert into Employees values('Zack', 'Cobble', 'zack@gmail.com', 2342356431256, 'Assistant Manager', 203)
insert into Employees values('Courage', 'Win', 'courwin@gmail.com', 2347854249809, 'Clerk', 202)
insert into Employees values('Matt', 'Daemon', 'matt@yahoo.com', 2347857983422, 'Cashier', 202)
insert into Employees values('Ezikel', 'Rivers', 'ezri@yahoo.com', 2344565234477, 'Cashier', 202)
insert into Employees values('Matthew', 'Son', 'mason@gmail.com', 2345643238976, 'Manager', 204)
insert into Employees values('Zebediah', 'Ola', 'zebby@gmail.com', 2342356431256, 'Assistant Manager', 204)
insert into Employees values('Ruka', 'Chi', 'ruchi@gmail.com', 2347854249809, 'Clerk', 204)
insert into Employees values('Semilore', 'Ajani', 'semsem@yahoo.com', 2347857983422, 'Cashier', 203)
insert into Employees values('Chima', 'Agu', 'chima@yahoo.com', 2344565234477, 'Cashier', 203)
insert into Employees values('Ruth', 'Son', 'ruson@gmail.com', 2345643238976, 'Manager', 205)
insert into Employees values('Jude', 'Ola', 'juo@gmail.com', 2342356431256, 'Assistant Manager', 205)
insert into Employees values('Ruka', 'Thanksgiving', 'rukathanks@gmail.com', 2347854249809, 'Clerk', 205)
insert into Employees values('Semil', 'Wanseer', 'semiwans@yahoo.com', 2347857983422, 'Cashier', 205)
insert into Employees values('Christopher', 'Agu', 'chirsagu@yahoo.com', 2344565234477, 'Cashier', 204)

select * from Employees


create table Stores (
	[Store ID] int not null identity(201, 1),
	[Store Name] varchar(max),
	Phone bigint not null,
	Email nvarchar(50) not null,
	City varchar(max) not null,
	[State] varchar(max) not null,
	[Zip Code] nvarchar(15) not null,
	primary key ([Store ID])
)

insert into Stores values('Shoprite', 2349091470816, 'novare@gmail.com', 'Sangotedo', 'Lagos', '103242')
insert into Stores values('Shoprite', 2349091470918, 'circlemall@gmail.com', 'Jakande', 'Lagos', '106102')
insert into Stores values('Prince Ebeano', 2345621675467, 'ebeano@yahoo.com', 'Lekki', 'Lagos', '106101')
insert into Stores values('Payless', 2343321666589, 'payless@gmail.com', 'Giwa', 'Kaduna', '810105')
insert into Stores values('Skymall', 2345556768865, 'skymall@gmail.com', 'Sangotedo', 'Lagos', '103242')

select * from Stores


create table Payroll(
	Position varchar(20) not null,
	Salary money not null
)

insert into Payroll values('Manager', 80000)
insert into Payroll values('Assistant Manager', 53000)
insert into Payroll values('Clerk', 40000)
insert into Payroll values('Cashier', 31000)

select * from Payroll


create table Orders (
	[Order ID] int not null identity(5001, 1),
	[Customer ID] int,
	[Product ID] int not null,
	[Order Status] varchar(max) not null,
	[Order Date] nvarchar(max) not null,
	[Delivery Date] nvarchar(max) not null,
	[Store ID] int not null,
	constraint FK_StoreID2 FOREIGN KEY([Store ID])  references Stores([Store ID]),
	constraint FK_CustomerID FOREIGN KEY([Customer ID])  references Customers([Customer ID]),
	constraint FK_ProductID FOREIGN KEY([Product ID])  references Products([Product ID])
)

insert into Orders values(301, 601, 'Delivered', '5th Jan 2020', '10th Jan 2020', 201)
insert into Orders values(302, 603, 'Pending', '3rd March 2020', '8th March 2020', 202)
insert into Orders values(303, 602, 'Delivered', '9th April 2020', '14th April 2020', 203)
insert into Orders values(304, 601, 'Delivered', '6th June 2020', '11th June 2020', 204)
insert into Orders values(305, 604, 'Pending', '2nd June 2020', '7th June 2020', 205)
insert into Orders values(302, 601, 'Delivered', '5th Jan 2020', '10th Jan 2020', 202)
insert into Orders values(302, 603, 'Pending', '3rd March 2020', '8th March 2020', 202)
insert into Orders values(303, 602, 'Delivered', '9th April 2020', '14th April 2020', 202)
insert into Orders values(305, 601, 'Delivered', '6th June 2020', '11th June 2020', 203)
insert into Orders values(305, 604, 'Pending', '2nd June 2020', '7th June 2020', 205)
insert into Orders values(302, 601, 'Delivered', '5th Jan 2020', '10th Jan 2020', 201)
insert into Orders values(303, 603, 'Pending', '3rd March 2020', '8th March 2020', 202)
insert into Orders values(303, 602, 'Delivered', '9th April 2020', '14th April 2020', 202)
insert into Orders values(304, 601, 'Delivered', '6th June 2020', '11th June 2020', 201)
insert into Orders values(305, 604, 'Pending', '2nd June 2020', '7th June 2020', 205)
insert into Orders values(301, 601, 'Delivered', '5th Jan 2020', '10th Jan 2020', 203)
insert into Orders values(302, 603, 'Pending', '3rd March 2020', '8th March 2020', 204)
insert into Orders values(302, 602, 'Delivered', '9th April 2020', '14th April 2020', 201)
insert into Orders values(304, 601, 'Delivered', '6th June 2020', '11th June 2020', 204)
insert into Orders values(305, 604, 'Pending', '2nd June 2020', '7th June 2020', 202)

select * from Orders



--PRODUCTION 
create table Categories(
	[Category ID] int not null,
	[Category Name] varchar(15) not null,
	primary key ([Category ID])
)

insert into Categories values(901, 'Industrial')
insert into Categories values(902, 'Foods')

select * from Categories


create table Products(
	[Product ID] int not null,
	[Product Name] varchar(max) not null,
	[Category ID] int not null,
	primary key ([Product ID]),
	constraint FK_CategoryID FOREIGN KEY([Category ID])  references Categories([Category ID]),
)

insert into Products values(601, 'Cement', 901)
insert into Products values(602, 'Salt', 902)
insert into Products values(603, 'Sugar', 902)
insert into Products values(604, 'Flour', 902)

select * from Products


create table Stocks(
	[Store ID] int not null,
	[Product ID] int not null,
	Quantity int not null,
	constraint FK_StoreID3 FOREIGN KEY([Store ID])  references Stores([Store ID]),
	constraint FK_ProductID2 FOREIGN KEY([Product ID]) references Products([Product ID])
)

insert into Stocks values (201, 601, 20)
insert into Stocks values (201, 602, 10)
insert into Stocks values (201, 603, 12)
insert into Stocks values (201, 604, 5)
insert into Stocks values (202, 601, 12)
insert into Stocks values (202, 602, 10)
insert into Stocks values (202, 603, 11)
insert into Stocks values (202, 604, 15)
insert into Stocks values (203, 601, 210)
insert into Stocks values (203, 602, 11)
insert into Stocks values (203, 603, 22)
insert into Stocks values (203, 604, 51)
insert into Stocks values (204, 601, 21)
insert into Stocks values (204, 602, 11)
insert into Stocks values (204, 603, 121)
insert into Stocks values (204, 604, 5)
insert into Stocks values (205, 601, 0)
insert into Stocks values (205, 602, 11)
insert into Stocks values (205, 603, 1)
insert into Stocks values (205, 604, 51)

select * from Stocks


select * from Customers
select * from Employees
select * from Stores
select * from Payroll
select * from Orders
select * from Categories
select * from Products
select * from Stocks