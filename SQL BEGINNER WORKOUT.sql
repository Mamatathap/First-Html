/*
Exercise 1:

Select the following columns (all rows) from the "Sales.CreditCard" table:

 - CardNumber
 - Last Four Digits - a derived column with just the last four digits of the credit card number
*/

select a.CardNumber,
[Last four digit]= Right(a.CardNumber,4)
from AdventureWorks2019.Sales.CreditCard a


SELECT 
        [CardNumber]
	   ,[Last Four Digits] = RIGHT([CardNumber], 4)

FROM [AdventureWorks2019].[Sales].[CreditCard]


/*
Exercise 2:

Select the following columns (all rows) from the "Production.ProductReview" table:

 - ReviewerName
 - Comments
 - Cleaned Comments - a derived column in which all commas from the "Comments" field have been replaced with empty strings
*/
select a.ReviewerName,
a.Comments,
[Cleaned Comments]= Replace(a.Comments,',','')
from AdventureWorks2019.Production.ProductReview a


SELECT 
       [ReviewerName]
      ,[Comments]
      ,[Cleaned Comments] = REPLACE([Comments], ',','')

FROM [AdventureWorks2019].[Production].[ProductReview]


/*
Exercise 3:

Select the "FirstName" and "LastName" columns from the "Person.Person" table. 
Only include rows where the length of the last name is greater than or equal to 10 characters.
*/

select a.FirstName,
a.LastName,
[length]=LEN('a.Lastname')

from AdventureWorks2019.Person.Person a
where len(a.LastName) >= 10


SELECT 
		[FirstName]
       ,[LastName]

FROM [AdventureWorks2019].[Person].[Person]

WHERE LEN([LastName]) >= 10


/*
Bonus:

Sort the output of Exercise 3 by the length of the last name in descending order. 
HINT - you can re-use the expression in your WHERE clause in your ORDER BY, even though it isn't included in the SELECT list!
*/

select a.FirstName,
a.LastName,
[length]=LEN('a.Lastname')

from AdventureWorks2019.Person.Person a
where len(a.LastName) >= 10
order by LEN(a.LastName) desc


SELECT 
		[FirstName]
       ,[LastName]

FROM [AdventureWorks2019].[Person].[Person]

WHERE LEN([LastName]) >= 10

ORDER BY LEN([LastName]) DESC  


/*
Exercise 4

Select the "FirstName" and "LastName" columns from the "Person.Person" table (all rows). 
Now add a derived column called "Nickname", which is created by combining
the first character of the the first name, a hyphen (-), 
and the first three characters of the last name.
*/

select a.FirstName,
a.LastName,
[Nickname]= left(a.FirstName,1)+'-'+ left(a.LastName,3)
from
AdventureWorks2019.Person.Person a


SELECT 
       [FirstName]
      ,[LastName]
	  ,[Nickname] = LEFT([FirstName],1) + '-' + LEFT([LastName], 3)

FROM [AdventureWorks2019].[Person].[Person]


/*
Exercise 5

Select the following columns (all rows) from the "Production.ProductReview" table:

 - ReviewerName
 - Comments
 - Cleaned Comments - a derived column in which all commas AND periods
	 from the "Comments" field have been replaced with empty strings. 
	 HINT - you will have to nest multiple REPLACE functions.
*/
select a.ReviewerName,
a.Comments,
[Cleaned Comments]=Replace(REPLACE(a.Comments,',',''),'.','')
from AdventureWorks2019.Production.ProductReview a


SELECT 
       [ReviewerName]
      ,[Comments]
      ,[Cleaned Comments] = REPLACE(REPLACE([Comments], ',', ''), '.', '')

FROM [AdventureWorks2019].[Production].[ProductReview]


/*
Exercise 6

There are a LOT of text functions in SQL. 
More than you could possibly scrunch into a single course or book 
without it turning into an encyclopedia. 
As such, you will frequently find yourself using Google or Bing to look up functions 
that accomplish specific tasks. Let's practice that here.

Select the "FirstName" column from the "Person.Person" table (all rows). 
Now add the following derived columns:

FirstNameUpper, which features the first name entirely capitalized
FirstNameLower, which consists of the first name transformed entirely to lowercase

You may have to search around a bit to find the right function, 
HINT - try searching for what you're trying to do (say, convert text to uppercase)
in conjunction with the word "SQL".
*/

SELECT 
       [FirstName]
	  ,[FirstNameUpper] = UPPER([FirstName])
	  ,[FirstNameLower] = LOWER([FirstName])

FROM [AdventureWorks2019].[Person].[Person]

/*
Exercise 7

Select the following (not tied to any table in our AdventureWorks database):

 - A field called "Today" showing the current day and time
 - A field called "This Month", showing the number of the current month
 - A field called "This Year", showing the number of the current year.

All fields above should be calculated via SQL functions.
*/

SELECT
 [Today] = GETDATE()
,[This Year] = YEAR(GETDATE())
,[This Month] = MONTH(GETDATE())


/*
Exercise 8

Select all records from the "Purchasing.PurchaseOrderHeader" table where 
the order date occurred between 1/1/2011 and 7/31/2011 AND 
the total amount due is greater than $10,000. 
Include the following columns:

 - PurchaseOrderID
 - OrderDate
 - TotalDue
*/
select a.PurchaseOrderID,
a.OrderDate,
a.TotalDue
from AdventureWorks2019.Purchasing.PurchaseOrderHeader a
where a.OrderDate between datefromparts(2011,1,1) and DATEFROMPARTS(2011,7,31) and a.TotalDue>10000


/* DATE AND MATHS*/

/*
Exercise 1:

Use date math in conjunction with GETDATE to calculate what date is 100 days from now.
*/

SELECT GETDATE() + 100
select DATEADD(day,100, getdate())  


/*
Exercise 2:

Use DATEADD to calculate what date is 6 months from now.
*/

SELECT DATEADD(MONTH, 6, GETDATE())


/*
Exercise 3:

Use DATEDIFF to select all rows from the "Sales.SalesOrderHeader" table 
where the order date is 7 or less days before 12/25/2013. 
Note that it is possible for DATEDIFF to output a negative number 
if the "end" date is prior to your "start" date, 
so you may want to use BETWEEN instead of <= in your criteria.

You may select all columns via the SELECT * shorthand.
*/
select a.OrderDate
from AdventureWorks2019.Sales.SalesOrderHeader a
where DATEDIFF(DAY,a.OrderDate,DATEFROMPARTS(2013,12,25)) between 0 and 7


SELECT
*

FROM [AdventureWorks2019].[Sales].[SalesOrderHeader]

WHERE DATEDIFF(DAY, [OrderDate], DATEFROMPARTS(2013,12,25)) BETWEEN 0 AND 7


/*
Bonus:

Modify your query from Exercise 3 to work for ANY year, not just 2013. 
HINT - instead of hardcoding the year in your DATEFROMPARTS function, 
you will probably want to calculate the year based on the order date.
*/

select a.OrderDate
from AdventureWorks2019.Sales.SalesOrderHeader a
where DATEDIFF(DAY,a.OrderDate,DATEFROMPARTS(year(a.OrderDate),12,25)) between 0 and 7


SELECT
*

FROM [AdventureWorks2019].[Sales].[SalesOrderHeader]

WHERE DATEDIFF(DAY, [OrderDate], DATEFROMPARTS(YEAR([OrderDate]),12,25)) BETWEEN 0 AND 7


/* DATE TYPE*/
/*
 Ex++++ercise 1:

Calculate yesterday's date dynamically via GETDATE. 
Convert the value to a DATE datatype, such that it has no timestamp component.
*/

SELECT CAST(GETDATE()-1 AS DATE)


/*
Exercise 2:

Calculate the number of days between the current date and the end of the current year via DATEDIFF. 
Use the CAST function to create the end-of-year date.
*/
select DATEDIFF(DAY, GETDATE(),cast('2023-12-31' as date))





SELECT DATEDIFF(DAY, GETDATE(), CAST('2020-12-31' AS DATE))


/*
Exercise 3

Select all rows from the "Person.Person" table where the middle name is not NULL, AND either the title is not NULL OR the suffix is not NULL. Include the following columns:

 - Title
 - FirstName
 - MiddleName
 - LastName
 - Suffix
 - PersonID: a derived column created by combining the person type, a hyphen(-), 
	and the business entity ID, in that order.

HINT - you will need to convert the business entity ID to a VARCHAR 
in order for the concatenation to work. You do not necessarily need to specify the length - 
simply specifying VARCHAR (as opposed to, say, VARCHAR(100)) will work fine.
*/
select a.Title,a.FirstName,a.MiddleName,a.BusinessEntityID,a.LastName,a.Suffix,

[Person ID]= a.PersonType+'-'+ CAST(a.BusinessEntityID as varchar)
from AdventureWorks2019.Person.Person a
where MiddleName is not Null and a.Title is not null or a.Suffix is not null


SELECT
       [Title]
      ,[FirstName]
      ,[MiddleName]
      ,[LastName]
      ,[Suffix]
	  ,[PersonID] = [PersonType] + '-' + CAST([BusinessEntityID] AS VARCHAR)

FROM [AdventureWorks2019].[Person].[Person]

WHERE [MiddleName] IS NOT NULL AND
	([Title] IS NOT NULL OR [Suffix] IS NOT NULL)


	/* HANDLING NULL*/

/*
Exercise 1:

Select all rows from the "Production.Product" table where the weight is less than 10 pounds. 
Make sure to include NULL values in your output, and use ISNULL to accomplish this.

Include the following columns in your output:

 - Name
 - Color
*/
 select a.Name, a.Color, a.Weight
 from AdventureWorks2019.Production.Product a
 
 where isnull(weight,0) < 10
SELECT
       [Name]
      ,[Color]

FROM [AdventureWorks2019].[Production].[Product]

WHERE ISNULL([Weight],0) < 10


/*
Exercise 2:

Modify the "Color" field of your query from Exercise 1 such that 
NULL values are replaced with the word "None".
*/
select a.Name, 
[Color]= ISNULL(a.Color,'None')
from AdventureWorks2019.Production.Product a


SELECT
       [Name]
      ,[Color] = ISNULL([Color],'None')

FROM [AdventureWorks2019].[Production].[Product]

WHERE ISNULL([Weight],0) < 10


/* MIGHTY CASE*/

/*value
Exercise 1:

Select a derived column called "Price Category" from the "Production.Product" table such that:

If the list price is greater than $1,000, return "Premium".
If the list price is greater than $100 and less than $1,000, return "Mid-Range".
If the list price is less than $100, return "Value". This should be the default case.

Also include Name and ListPrice as columns in your output.
*/

select a.Name, a.ListPrice,
[Price Category]= case 
when (a.ListPrice >= 1000) then 'premium'
when (a.ListPrice>100) then 'Mid Range'
else 'value' 
end

from AdventureWorks2019.Production.Product a



SELECT 
	[Name]
   ,[ListPrice]
   ,[Price Category] = 
		CASE
			WHEN [ListPrice] >= 1000 THEN 'Premium'
			WHEN [ListPrice] > 100 THEN 'Mid-Range'
			ELSE 'Value'
		END

FROM [AdventureWorks2019].[Production].[Product]

/*
Exercise 2:

Select a derived column called "Employee Tenure" from the "HumanResources.Employee" table such that:

1.) If an employee is salaried, and has been with the company 10 or more years (calculated as the DATEDIFF in 
YEARs between the "HireDate" value and the current date), return "Non-Exempt - 10+ Years".
2.) If an employee is salaried, and has been with the company less than 10 years, return "Non-Exempt - < 10 Years".
3.) If an employee is NOT salaried, and has been with the company 10 or more years (calculated as 
the DATEDIFF in YEARs between the "HireDate" value and the current date), return "Exempt - 10+ Years".
4.) If an employee is NOT salaried, and has been with the company less than 10 years, return "Exempt - < 10 Years". This should be the default case.

Also include BusinessEntityID, HireDate, and SalariedFlag as columns in your output.
*/
select a.BusinessEntityID, a.HireDate, a.SalariedFlag,
[Employee Tenure]=
case
when DATEDIFF(year, a.HireDate, GETDATE()) >= 10 and SalariedFlag=1 then 'Non-Exempt - +10 Years'
when DATEDIFF(YEAR,a.HireDate,GETDATE()) < 10 and SalariedFlag=1 then 'Non-Exempt - < 10 Years'
when DATEDIFF(year, a.HireDate,GETDATE()) >=10 and SalariedFlag=0 then 'Exempt - 10+ Years'
when DATEDIFF(year, a.HireDate,GETDATE()) <10 and SalariedFlag=0 then 'Exempt - < 10 Years'
end
from AdventureWorks2019.HumanResources.Employee a

SELECT [BusinessEntityID]
	  ,[HireDate]
	  ,[SalariedFlag]
	  ,[Employee Tenure] = 
		CASE
			WHEN DATEDIFF(YEAR,[HireDate],GETDATE()) >= 10 AND [SalariedFlag] = 1 THEN 'Non-Exempt 10+'
			WHEN DATEDIFF(YEAR,[HireDate],GETDATE()) < 10 AND [SalariedFlag] = 1 THEN 'Non-Exempt < 10'
			WHEN DATEDIFF(YEAR,[HireDate],GETDATE()) >= 10 AND [SalariedFlag] = 0 THEN 'Exempt 10+'
			ELSE 'Exempt < 10'
		END
FROM [AdventureWorks2019].[HumanResources].[Employee]

