--Assignment Day4 ¨CSQL:  Comprehensive practice
--Answer following questions
--What is View? What are the benefits of using views?
	--Views can provide advantages over tables: Views can represent a subset of the data contained in a table. Consequently, a view can limit the degree of exposure of the underlying tables to the outer world: a given user may have permission to query the view, while denied access to the rest of the base table.
--Can data be modified through views?
	--yes
--What is stored procedure and what are the benefits of using it?
	--By grouping SQL statements, a stored procedure allows them to be executed with a single call. This minimizes the use of slow networks, reduces network traffic, and improves round-trip response time.
--What is the difference between view and stored procedure?
	--View is simple showcasing data stored in the database tables whereas a stored procedure is a group of statements that can be executed. A view is faster as it displays data from the tables referenced whereas a store procedure executes sql statements.
--What is the difference between stored procedure and functions?
	--In a function, it is mandatory to use the RETURNS and RETURN arguments, whereas in a stored procedure is not necessary. In few words, a stored procedure is more flexible to write any code that you want, while functions have a rigid structure and functionality.
--Can stored procedure return multiple result sets?
	--yes
--Can stored procedure be executed as part of SELECT Statement? Why?
	--no
--What is Trigger? What types of Triggers are there?
	--DDL Trigger. DML Trigger. Logon Trigger.
--What is the difference between Trigger and Stored Procedure?
	--A stored procedure is a user defined piece of code written in the local version of PL/SQL, which may return a value (making it a function) that is invoked by calling it explicitly. 
	--A trigger is a stored procedure that runs automatically when various events happen (eg update, insert, delete).
--Write queries for following scenarios
--Use Northwind database. All questions are based on assumptions described by the Database Diagram sent to you yesterday. When inserting, make up info if necessary. Write query for each step. Do not use IDE. BE CAREFUL WHEN DELETING DATA OR DROPPING TABLE.
use Northwind 
GO
--Create a view named ¡°view_product_order_[your_last_name]¡±, list all products and total ordered quantity for that product.
create view [view_product_order_yan] as 
select ProductID, sum(Quantity)
from [Order Details]
group by ProductID
go

--Create a stored procedure ¡°sp_product_order_quantity_[your_last_name]¡± that accept product id as an input and total quantities of order as output parameter.
create proc [sp_product_order_quantity_yan]
@product_id int
@total_quan int out
as
select @product_id, sum(@total_quan)
from [Order Details]
group by @product_id

--Create a stored procedure ¡°sp_product_order_city_[your_last_name]¡± that accept product name as an input and top 5 cities that ordered most that product combined with the total quantity of that product ordered from that city as output.
--Create 2 new tables ¡°people_your_last_name¡± ¡°city_your_last_name¡±. City table has two records: {Id:1, City: Seattle}, {Id:2, City: Green Bay}. People has three records: {id:1, Name: Aaron Rodgers, City: 2}, {id:2, Name: Russell Wilson, City:1}, {Id: 3, Name: Jody Nelson, City:2}. Remove city of Seattle. If there was anyone from Seattle, put them into a new city ¡°Madison¡±. Create a view ¡°Packers_your_name¡± lists all people from Green Bay. If any error occurred, no changes should be made to DB. (after test) Drop both tables and view.
-- Create a stored procedure ¡°sp_birthday_employees_[you_last_name]¡± that creates a new table ¡°birthday_employees_your_last_name¡± and fill it with all employees that have a birthday on Feb. (Make a screen shot) drop the table. Employee table should not be affected.
--How do you make sure two tables have the same data?
--7.
--First Name	Last Name	Middle Name
--John	Green	
--Mike	White	M
--Output should be
--Full Name
--John Green
--Mike White M.
--Note: There is a dot after M when you output.
--8.
--Student	Marks	Sex
--Ci	70	F
--Bob	80	M
--Li	90	F
--Mi	95	M
--Find the top marks of Female students.
--If there are to students have the max score, only output one.
--9.
--Student	Marks	Sex
--Li	90	F
--Ci	70	F
--Mi	95	M
--Bob	80	M
--How do you out put this?
