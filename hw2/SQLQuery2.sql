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
select count(*) from Production.Product
--Write a query that retrieves the number of products in the Production.Product table that are included in a subcategory. The rows that have NULL in column ProductSubcategoryID are considered to not be a part of any subcategory.
select count(distinct(ProductSubcategoryID)) from Production.Product
--How many Products reside in each SubCategory? Write a query to display the results with the following titles.
select distinct e.ProductID from Production.Product e
--ProductSubcategoryID CountedProducts
---------------------- ---------------
--How many products that do not have a product subcategory.
select count(*) from Production.Product where ProductSubcategoryID is null
--Write a query to list the sum of products quantity in the Production.ProductInventory table.
select sum(quantity) from  Production.ProductInventory 
-- Write a query to list the sum of products in the Production.ProductInventory table and LocationID set to 40 and limit the result to include just summarized quantities less than 100.
--              ProductID    TheSum
-------------        ----------
select LocationID, sum(quantity) as theSum from Production.ProductInventory where LocationID = 40
group by LocationID

--Write a query to list the sum of products with the shelf information in the Production.ProductInventory table and LocationID set to 40 and limit the result to include just summarized quantities less than 100
--Shelf      ProductID    TheSum
------------ -----------        -----------
select top 4 LocationID,  Shelf, sum( quantity) as theSum from Production.ProductInventory where LocationID = 40 group by Shelf, LocationID order by 3 
--Write the query to list the average quantity for products where column LocationID has the value of 10 from the table Production.ProductInventory table.
select AVG(quantity) as avgQuanlity from Production.ProductInventory where LocationID = 10
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
select Color, Class, AVG(ListPrice) from Production.Product group by Color, Class having Color is not null and Class is not null
--Joins:
--  Write a query that lists the country and province names from person. CountryRegion and person. StateProvince tables. Join them and produce a result set similar to the following. 

--Country                        Province
-----------                          ----------------------
--Write a query that lists the country and province names from person. CountryRegion and person. StateProvince tables and list the countries filter them by Germany and Canada. Join them and produce a result set similar to the following.

--Country                        Province
-----------                          ----------------------

use Northwind 
GO
--        Using Northwnd Database: (Use aliases for all the Joins)
--List all Products that has been sold at least once in last 25 years.
select * from Products where UnitsOnOrder > 0
--List top 5 locations (Zip Code) where the products sold most.
select  ShipPostalCode from Orders order by ShipPostalCode
--List top 5 locations (Zip Code) where the products sold most in last 25 years.
-- List all city names and number of customers in that city.    
--List city names which have more than 2 customers, and number of customers in that city 
--List the names of customers who placed orders after 1/1/98 with order date.
select CustomerID, OrderDate from Orders where OrderDate < 1/1/98
--List the names of all customers with most rece nt order dates 
--Display the names of all customers  along with the  count of products they bought 
--Display the customer ids who bought more than 100 Products with count of products.
--List all of the possible ways that suppliers can ship their products. Display the results as below
--Supplier Company Name   	Shipping Company Name
-----------------------------------            ----------------------------------
--Display the products order each day. Show Order date and Product Name.
--Displays pairs of employees who have the same job title.
--Display all the Managers who have more than 2 employees reporting to them.
--Display the customers and suppliers by city. The results should have the following columns
--City 
--Name 
--Contact Name,
--Type (Customer or Supplier)
