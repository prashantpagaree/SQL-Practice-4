Create Database assign9;
use assign9;

--Q.3. Write a SQL query to find the salesperson and customer who belong to the same city. 
--Return Salesman, cust_name and city.

create table salesman(
salesman_id int,
name varchar(20),
city varchar(10),
commission float);

insert into salesman values 
(5001,'James Hoog','New York',0.15),
(5002,'Nail Knite','Paris',0.13),
(5005,'Pit Alex','London',0.11),
(5006,'Mc Lyon','Paris',0.14),
(5007,'Paul Adam','Rome',0.13),
(5003,'Lauson Hen','San Jose',0.12);

create table Customer(
customer_id int,
cust_name varchar(25),
city varchar(10),
grade int,
salesman_id int);

insert into Customer values
(3002, 'Nick Rimando','New York',100,5001),
(3007, 'Brad Davis','New York',200,5001),
(3005, 'Graham Zusi','California',200,5002),
(3008, 'Julian Green','London',300,5002),
(3004, 'Fabian Johnson','Paris',300,5006),
(3009, 'Geoff Cameron','Berlin',100,5003),
(3003, 'Jozy Altidor','Moscow',200,5007),
(3001, 'Brad Guzan','London',null,5005);

select salesman.name as Salesman_Name, Customer.cust_name, salesman.city from Customer 
inner join salesman on Customer.city = salesman.city;



--Q.4. Write a SQL query to find those orders where the order amount exists between 500 and 2000.
--Return ord_no, purch_amt, cust_name, city.

create table orders(
ord_no int,
purch_amt float,
ord_date date,
customer_id int,
salesman_id int);

insert into orders values
(70001,150.5,'2012-10-05',3005,5002),
(70009,270.65,'2012-09-10',3001,5005),
(70002,65.26,'2012-10-05',3002,5001),
(70004,110.5,'2012-08-17',3009,5003),
(70007,948.5,'2012-09-10',3005,5002),
(70005,2400.6,'2012-07-27',3007,5001),
(70008,5760,'2012-09-10',3002,5001),
(70010,1983.43,'2012-10-10',300,5006),
(70003,2480.4,'2012-10-10',3009,5003),
(70012,250.45,'2012-06-27',3008,5002),
(70011,75.29,'2012-08-17',3003,5007),
(70013,3045.6,'2012-04-25',3002,5001);

select orders.ord_no,orders.purch_amt,Customer.cust_name,Customer.city
from orders left join Customer on orders.customer_id = Customer.customer_id
where purch_amt between 500 and 2000;

--Q.5. Write a SQL query to select all rows from both participating tables as long as there is a match
--between pro_com and com_id.

create table company_mast(
COM_ID INT,
COM_NAME Varchar(15))

insert into company_mast values
(11,'Samsung'),(12,'Iball'),(13,'Epsion'),
(14,'Zebronics'),(15,'Asus'),(16,'Frontech');

create table item_mast(
PRO_ID INT ,
PRO_NAME Varchar(25),
PRO_PRICE INT,
PRO_COM INT)

insert into item_mast values
(101,'Motherboard',3200,15),
(102,'Keyboard',450,16),
(103,'ZIP drive',250,14),
(104,'Speaker',550,16),
(105,'Monitor',5000,11),
(106,'DVD drive',900,12),
(107,'CD drive',800,12),
(108,'Printer',2600,13),
(109,'Refill cartridge',350,13),
(110,'Mouse',250,12);

select * from item_mast inner join company_mast on
item_mast.PRO_COM = company_mast.COM_ID;

--Q.6. Import the following datasets: Customers.csv Orders.csv Order_Details.csv Product_Details.csv
--Understand the variables and connectors between the tables. After that, Do the following:
--(1) Find the Country wise distinct count of customersselect * from cust;select * from ord;select * from OrderDetails;select * from Products;select Country,count(CustomerID) as total_customers  from cust group by country;--(2) Create the following table:Create Table Customer_Details(City varchar (40),Country Varchar (20),Customer_Count int,Total_Orders int);insert into Customer_Detailsselect A.City,A.Country,COUNT(Distinct B.CustomerID) As Customer_Count,COUNT(Distinct B.OrderID) as Total_orders from Cust A Inner Join ord B ON A.CustomerID=B.CustomerID group by A.City,A.Country;Select * from Customer_Details;--(3) Create the following table:create table q3(Year char(5),Total_Orders int,Total_Quantity int,Total_Sales int);insert into q3select Year(A.OrderDate) As Year,count(A.OrderID) As Total_Orders,Sum(B.Quantity) As Total_Quantity,Sum(A.Total_order_amount) As Total_Sales from ord A Inner Join OrderDetails B ON A.OrderID=B.OrderID group by Year(A.OrderDate);--(4) Find the Best Performing product in terms of Total Quantity Consumedselect Top 1 A.ProductID,A.Product,Sum(B.Quantity) As Total_Quantity from Products A Inner Join OrderDetails B ON A.ProductID = B.ProductID Group by A.ProductID,A.Product Order by Sum(B.Quantity) Desc;--Q.7. You are given a schema of 4 tables, Actors, Directors, Movie and Movie_director_actor.--Write a query to find the actor and director’s name who have done atleast 3 movies together.Select A.act_id, A.dir_id from Movie_director_actor A 
Inner Join Movie B ON A.movie_id = B. movie_id
Inner Join Director C ON A.dir_id = C. dir_id
Inner Join Actor D ON A.act_id = D.act_id
Where count(A.movie_id) >3 group by A.act_id, A.dir_id;
--Q.8.Find the cumulative sum of Sales, refer Input and Output mentioned in the below snippetcreate table input1(Customer_ID varchar(5),Month varchar(20),Sales int);Insert into input1 values('X101','Jan-20',20),('X101','Feb-20',45),('X101','Mar-20',23),('X101','Apr-20',76),('X101','May-20',45),('X101','Jun-20',76),('X101','Jul-20',35),('X101','Aug-20',27),('X101','Sep-20',44),('X101','Oct-20',90),('X101','Nov-20',75),('X101','Dec-20',78);select * from input1;
select a.Customer_ID, a.Month, sum(b.Sales) as cum_sum
from input1 a inner join input1 b 
on a.Customer_ID = b.Customer_ID and a.Month >= b.Month
group by a.Customer_ID,a.Month
order by a.Customer_ID,a.Month;
