--Assignment Day3 ¨CSQL:  Comprehensive practice
--Answer following questions
--In SQL Server, assuming you can find the result by using both joins and subqueries, which one would you prefer to use and why?	
	--the good thing in sub-queries is that they are more readable than JOINs: that's why most new SQL people prefer them; it is the easy way; 
	--but when it comes to performance, JOINS are better in most cases even though they are not hard to read too
--What is CTE and when to use it?
	--A Common Table Expression (CTE) is the result set of a query which exists temporarily and for use only within the context of a larger query.
	--Much like a derived table, the result of a CTE is not stored and exists only for the duration of the query
--What are Table Variables? What is their scope and where are they created in SQL Server?
	--A table variable behaves like a local variable. It has a well-defined scope. This variable can be used in the function, stored procedure, or batch in which it's declared.
--What is the difference between DELETE and TRUNCATE? Which one will have better performance and why?
	--Delete command is slower than the Truncate command. It removes rows one at a time. It retains the identity and does not reset it to the seed value.
--What is Identity column? How does DELETE and TRUNCATE affect it?
						--Delete					vs																	Truncate
		--It removes rows one at a time.												It removes all rows in a table by deallocating the pages that are used to store the table data
		--It retains the identity and does not reset it to the seed value.						Truncate command reset the identity to its seed value.
--What is difference between ¡°delete from table_name¡± and ¡°truncate table table_name¡±?
	--TRUNCATE always removes all the rows from a table, leaving the table empty and the table structure intact whereas DELETE may remove conditionally if the where clause is used. 
	--The rows deleted by TRUNCATE TABLE statement cannot be restored and you can not specify the where clause in the TRUNCATE statement.
--Write queries for following scenarios



--All scenarios are based on Database NORTHWND.
use Northwind
GO
--List all cities that have both Employees and Customers.
select City
from Employees where City in (
select City from Orders o join Customers c on c.CustomerID = o.CustomerID)

--List all cities that have Customers but no Employee.
--Use sub-query

select c.City
from Customers c where c.City not in (
select e.City
from Employees e)

--Do not use sub-query
select c.City from Customers c except select e.City from Employees e

--List all products and their total order quantities throughout all orders.
select count(od.Quantity), p.ProductID
from Orders o join [Order Details] od on o.OrderID = od.OrderID join Products p on p.ProductID = od.ProductID
group by p.ProductID

--List all Customer Cities and total products ordered by that city.
--List all Customer Cities that have at least two customers.
select City, rnk
from (select c.City, rank() over(order by c.CustomerId) rnk
from Customers c) dt
where c.CustomerId > 2

--Use union
--Use sub-query and no union
--List all Customer Cities that have ordered at least two different kinds of products.
--List all Customers who have ordered products, but have the ¡®ship city¡¯ on the order different from their own customer cities.
--List 5 most popular products, their average price, and the customer city that ordered most quantity of it.
--List all cities that have never ordered something but we have employees there.
--Use sub-query
--Do not use sub-query
--List one city, if exists, that is the city from where the employee sold most orders (not the product quantity) is, and also the city of most total quantity of products ordered from. (tip: join  sub-query)
--11. How do you remove the duplicates record of a table?
--12. Sample table to be used for solutions below- Employee (empid integer, mgrid integer, deptid integer, salary money) Dept (deptid integer, deptname varchar(20))
-- Find employees who do not manage anybody.
--13. Find departments that have maximum number of employees. (solution should consider scenario having more than 1 departments that have maximum number of employees). Result should only have - deptname, count of employees sorted by deptname.
--14. Find top 3 employees (salary based) in every department. Result should have deptname, empid, salary sorted by deptname and then employee with high to low salary.
