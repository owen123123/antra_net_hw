--Answer following questions
--What is a result set?
	--an object that represents a set of data returned from a data source,
--What is the difference between Union and Union All?
	--union removes duplicate records, union all does not
	--union: the records from the first column will be sorted ascendingly
	--union cannot be used in recursive cte, but union all can
--What are the other Set Operators SQL Server has?
	--UNION, UNION ALL, INTERSECT, EXCEPT
--What is the difference between Union and Join?
	-- join is used to combine columns from different tables, the union is used to combine rows
--What is the difference between INNER JOIN and FULL JOIN?
	--Inner join returns only the matching rows between both the tables, non-matching rows are eliminated. 
	--Full Join or Full Outer Join returns all rows from both the tables (left & right tables), including non-matching rows from both the tables.
--What is difference between left join and outer join\
	--Left Outer Join: Returns all the rows from the LEFT table and matching records between both the tables.
	--Full Outer Join returns all rows from both the tables (left & right tables), including non-matching rows from both the tables.
--What is cross join?
	--A cross join is a type of join that returns the Cartesian product of rows from the tables in the join. 
	--In other words, it combines each row from the first table with each row from the second table.
--What is the difference between WHERE clause and HAVING clause?
	--both are usesd as filters, having applies only to groups as a whole, only filter aggregated fileds, but where applies to individual rows
	--where can be used with select, update and delete statement, but having can only be in select statement
--Can there be multiple group by columns?
	--yes
--Write queries for following scenarios
--How many products can you find in the Production.Product table?
use AdventureWorks2019
go
select count(ProductID) from Production.Product
--Write a query that retrieves the number of products in the Production.Product table that are included in a subcategory. The rows that have NULL in column ProductSubcategoryID are considered to not be a part of any subcategory.
--select count(distinct(ProductSubcategoryID)) from Production.Product
select count(ProductID) from Production.Product where ProductSubcategoryID is not null
--How many Products reside in each SubCategory? Write a query to display the results with the following titles.
--ProductSubcategoryID CountedProducts
---------------------- ---------------
select p.ProductSubcategoryID, count(ProductID) as pros
from Production.Product as p
where p.ProductSubcategoryID is not null
group by p.ProductSubcategoryID

--How many products that do not have a product subcategory.
select count(*) from Production.Product where ProductSubcategoryID is null

--Write a query to list the sum of products quantity in the Production.ProductInventory table.
select sum(quantity) from  Production.ProductInventory group by ProductID
select * from Production.ProductInventory

-- Write a query to list the sum of products in the Production.ProductInventory table and LocationID set to 40 and limit the result to include just summarized quantities less than 100.
--              ProductID    TheSum
-------------        ----------
select ProductID, sum(quantity) as theSum from Production.ProductInventory where LocationID = 40 
group by ProductID
having sum(quantity) < 100

--Write a query to list the sum of products with the shelf information in the Production.ProductInventory table and LocationID set to 40 and limit the result to include just summarized quantities less than 100
--Shelf      ProductID    TheSum
------------ -----------        -----------
select ProductID,  Shelf, sum( quantity) as theSum from Production.ProductInventory where LocationID = 40 group by Shelf, ProductID having sum(Quantity) < 100
--Write the query to list the average quantity for products where column LocationID has the value of 10 from the table Production.ProductInventory table.
select AVG(quantity) as avgQuanlity, ProductID from Production.ProductInventory where LocationID = 10 group by ProductID
--Write query  to see the average quantity  of  products by shelf  from the table Production.ProductInventory
--ProductID   Shelf      TheAvg
------------- ---------- -----------
select ProductID, Shelf, AVG(quantity) TheAvg from Production.ProductInventory group by ProductID, Shelf  

--Write query  to see the average quantity  of  products by shelf excluding rows that has the value of N/A in the column Shelf from the table Production.ProductInventory
--ProductID   Shelf      TheAvg
------------- ---------- -----------
select ProductID, Shelf, AVG(quantity) TheAvg from Production.ProductInventory group by ProductID, Shelf having Shelf is not null



--List the members (rows) and average list price in the Production.Product table. This should be grouped independently over the Color and the Class column. Exclude the rows where Color or Class are null.
--Color           	Class 	TheCount   	 AvgPrice
----------------	- ----- 	----------- 	---------------------
select Color, Class, count(*) as theCount, AVG(ListPrice) as AvgPrice from Production.Product group by Color, Class having Color is not null and Class is not null


--Joins:
--  Write a query that lists the country and province names from person. CountryRegion and person. StateProvince tables. Join them and produce a result set similar to the following. 

select p.Name as Country, s.Name  as Province
from Person.CountryRegion p join Person.StateProvince s on p.CountryRegionCode = s.CountryRegionCode

--Country                        Province
-----------                          ----------------------
--Write a query that lists the country and province names from person. CountryRegion and person. StateProvince tables and list the countries filter them by Germany and Canada. Join them and produce a result set similar to the following.

--Country                        Province
-----------                          ----------------------
select p.Name as Country, s.Name  as Province
from Person.CountryRegion p join Person.StateProvince s on p.CountryRegionCode = s.CountryRegionCode
where p.Name not in ('Germany', 'Canada')


use Northwind 
GO
--        Using Northwnd Database: (Use aliases for all the Joins)
--List all Products that has been sold at least once in last 25 years.

select p.ProductID, p.ProductName
from Orders o join [Order Details] od on o.OrderID = od.OrderID join Products p on od.ProductID = p.ProductID
where DATEDIFF(year, o.OrderDate, GETDATE()) < 25

--List top 5 locations (Zip Code) where the products sold most.
select top 5 o.ShipPostalCode, sum(od.Quantity) as qty 
from Orders o join [Order Details] od on o.OrderID = od.OrderID
where o.ShipPostalCode is not null group by ShipPostalCode order by qty desc

--List top 5 locations (Zip Code) where the products sold most in last 25 years.

select top 5 o.ShipPostalCode, sum(od.Quantity) as qty 
from Orders o join [Order Details] od on o.OrderID = od.OrderID
where o.ShipPostalCode is not null and DATEDIFF(year, o.OrderDate, GETDATE()) < 25
group by ShipPostalCode order by qty desc


-- List all city names and number of customers in that city. 
select City, COUNT(customerID)
from Customers
group by City
--List city names which have more than 2 customers, and number of customers in that city 
select City, COUNT(customerID)
from Customers
group by City
having COUNT(customerID) > 2
--List the names of customers who placed orders after 1/1/98 with order date.

select distinct c.CustomerID, c.ContactName, c.CompanyName from Orders o join Customers c on o.CustomerID = c.CustomerID where OrderDate > '1998-1-1'

--List the names of all customers with most recent order dates 
select c.ContactName, max(o.orderDate) as recent
from Orders o right join Customers c on o.CustomerID = c.CustomerID
group by c.ContactName

--Display the names of all customers  along with the  count of products they bought 

select c.CustomerID, c.CompanyName, c.ContactName, sum(od.Quantity) as qty 
from Customers c left join Orders o on c.CustomerID = o.CustomerID left join [Order Details] od on o.OrderID = od.OrderID
group by c.CustomerID, c.CompanyName, c.ContactName
order by 4

--Display the customer ids who bought more than 100 Products with count of products.

select c.CustomerID, sum(od.Quantity) as qty 
from Customers c left join Orders o on c.CustomerID = o.CustomerID left join [Order Details] od on o.OrderID = od.OrderID
group by c.CustomerID
having sum(od.Quantity) > 100
order by 2

--List all of the possible ways that suppliers can ship their products. Display the results as below
--Supplier Company Name   	Shipping Company Name
-----------------------------------            ----------------------------------

select sp.CompanyName, ship.CompanyName
from Orders o left join [Order Details] od on o.OrderID = od.OrderID join Products p on od.ProductID = p.ProductID right join Suppliers sp on p.SupplierID = sp.SupplierID join Shippers ship on o.ShipVia = ship.SupplierID 


--Display the products order each day. Show Order date and Product Name.

select o.OrderDate, p.ProductName
from Orders o left join [Order Details] od on o.OrderID = od.OrderID join Products p on od.ProductID = p.ProductID
group by o.OrderDate, p.ProductName
order by 1

--Displays pairs of employees who have the same job title.
select Title, LastName + ' ' + FirstName as name
from Employees
order by Title

select * from Employees

--Display all the Managers who have more than 2 employees reporting to them.
select q.EmployeeID, q.LastName, q.FirstName, w.ReportsTo, count(w.ReportsTo) as sub
from Employees q join Employees w on q.EmployeeID = w.ReportsTo
where w.ReportsTo is not null
group by q.EmployeeID, q.LastName, q.FirstName, w.ReportsTo
having count(w.ReportsTo) > 2

--Display the customers and suppliers by city. The results should have the following columns
--City 
--Name 
--Contact Name,
--Type (Customer or Supplier)

select c.City, c.CompanyName, c.ContactName, 'Customer' as Type
from Customers c
union
select s.City, s.CompanyName, s.ContactName, 'Supplier' as Type
from Suppliers s