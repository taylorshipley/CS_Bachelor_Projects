USE AdventureWorks;
GO

-- A10a Q1
SELECT p.FirstName, p.LastName,  ad.AddressLine1, ad.AddressLine2, ad.City, stpro.StateProvinceCode, em.EmailAddress, pp.PhoneNumber, pnt.[name] AS 'Phone Type'
FROM Person.Person p
INNER JOIN Person.BusinessEntityAddress bea
ON p.BusinessEntityID = bea.BusinessEntityID
INNER JOIN Person.Address ad
ON bea.AddressID = ad.AddressID
INNER JOIN Person.StateProvince stpro
ON ad.StateProvinceID = stpro.StateProvinceID
INNER JOIN Person.PersonPhone pp
ON p.BusinessEntityID = pp.BusinessEntityID
INNER JOIN Person.PhoneNumberType pnt
ON pp.PhoneNumberTypeID =  pnt.PhoneNumberTypeID
INNER JOIN Person.EmailAddress em
ON em.BusinessEntityID = p.BusinessEntityID
WHERE ad.City IN ('Yakima', 'Birmingham', 'Columbus', 'Cambridge', 'Burbank')
AND stpro.[Name] IN('Washington', 'England', 'Ohio', 'England', 'California')
ORDER BY ad.City ASC, p.LastName ASC, p.FirstName ASC;

-- A10a Q2
SELECT p.FirstName, p.LastName, emp.JobTitle, FORMAT(emp.BirthDate, 'MMM dd yyyy') AS 'BirthDate', s.Name AS 'ShiftName' FROM HumanResources.Employee emp
INNER JOIN Person.Person p
ON p.BusinessEntityID= emp.BusinessEntityID
INNER JOIN HumanResources.EmployeeDepartmentHistory edh
ON emp.BusinessEntityID = edh.BusinessEntityID
INNER JOIN HumanResources.[Shift] s
ON edh.ShiftID = s.ShiftID
ORDER BY JobTitle ASC, LastName ASC, FirstName ASC;

--A10a Q3
SELECT v.[Name] AS 'VenderName', p.[Name] AS 'ProductName' FROM Purchasing.Vendor v
INNER JOIN Purchasing.ProductVendor pv
ON v.BusinessEntityID = pv.BusinessEntityID
INNER JOIN Production.Product p
ON pv.ProductID = p.ProductID
WHERE p.[Name] LIKE '%pedal%'
ORDER BY v.[Name], p.[Name];

--A10a Q4
SELECT p.[name] as 'ProductName', p.StandardCost, p.ListPrice, ProdIn.Quantity, pl.[Name] AS 'LocationName' FROM Production.Product p
INNER JOIN Production.ProductInventory ProdIn
ON p.ProductID = ProdIn.ProductID
INNER JOIN Production.[Location] pl
ON ProdIn.LocationID = pl.LocationID
WHERE p.ListPrice >0 AND pl.[Name] = 'Final Assembly' AND ProdIn.Quantity BETWEEN 200 AND 500
ORDER BY p.StandardCost;

--A10a Q5
SELECT p.[Name] AS 'ProductName', sr.[Name] AS 'ScrapReason', p.Size, um.[Name] AS 'MeasurementUnit'
FROM Production.Product p
INNER JOIN Production.WorkOrder wo
ON p.ProductID = wo.ProductID
INNER JOIN Production.ScrapReason sr
ON wo.ScrapReasonID = sr.ScrapReasonID
LEFT JOIN Production.UnitMeasure um
ON p.SizeUnitMeasureCode = um.UnitMeasureCode
WHERE sr.[Name] LIKE '%drill size%'
ORDER BY p.[Name], sr.[Name];

--A10a Q6
SELECT v.[Name] AS 'VenderName', p.[Name] AS 'ProductName', FORMAT(poh.ShipDate, 'MMM dd yyyy') AS 'ShipDate', pod.OrderQty
	, CONVERT(INT, pod.ReceivedQty) AS 'ReceivedQty', CONVERT(INT, pod.OrderQty - pod.ReceivedQty) AS 'MissingQty' FROM Purchasing.Vendor v
INNER JOIN Purchasing.ProductVendor pv
ON v.BusinessEntityID = pv.BusinessEntityID
INNER JOIN Production.Product p
ON pv.ProductID = p.ProductID
INNER JOIN Purchasing.PurchaseOrderHeader poh
ON v.BusinessEntityID = poh.VendorID
INNER JOIN Purchasing.PurchaseOrderDetail pod
ON poh.PurchaseOrderID = pod.PurchaseOrderID
WHERE pod.OrderQty - pod.ReceivedQty >= 50
ORDER BY pod.OrderQty - pod.ReceivedQty ASC, v.[Name], p.[Name];

--A10a Q7
SELECT p.[Name] AS 'ProductName', pc.[Name] AS 'CategoryName', psc.[Name] AS 'SubcategoryName', pm.[Name] AS 'ModelName' FROM Production.Product p
INNER JOIN Production.ProductSubcategory psc
ON p.ProductSubcategoryID = psc.ProductSubcategoryID
INNER JOIN Production.ProductCategory pc
ON psc.ProductCategoryID = pc.ProductCategoryID
INNER JOIN Production.ProductModel pm
ON p.ProductModelID = pm.ProductModelID
WHERE psc.[Name] IN ('Mountain Bikes', 'Road Bikes')
ORDER BY p.[Name], pc.[Name], psc.[Name]

--A10a Q8

 SELECT p.[Name] AS 'ProductName', sod.OrderQty, FORMAT(soh.DueDate, 'MMM dd yyyy'), soh.OnlineOrderFlag AS 'OrderedOnline' FROM Sales.SalesOrderHeader soh
 INNER JOIN Sales.SalesOrderDetail sod
 ON soh.SalesOrderID = sod.SalesOrderID
 INNER JOIN Production.Product p
 ON sod.ProductID = p.ProductID
 WHERE p.[Name] LIKE '%Tire%'
 AND((DATEPART(MONTH, soh.OrderDate)=5 AND DATEPART(YEAR, soh.OrderDate)=2011)
 OR (DATEPART(MONTH, soh.OrderDate)=8 AND DATEPART(YEAR, soh.OrderDate)=2013))
 ORDER BY soh.DueDate;

 --A10a Q9
 SELECT DISTINCT p.FirstName, p.LastName FROM Person.Person p
 INNER JOIN Sales.SalesOrderHeader AS soh
 ON p.BusinessEntityID = soh.SalesPersonID
 WHERE DATEPART(MONTH, soh.OrderDate)=1;

--A10a Q10
  SELECT p.FirstName, p.LastName, st.[Name] as 'TerritoryName', FORMAT(sp.SalesYTD, 'C') AS 'SalesYTD', FORMAT(sp.Bonus, 'C') AS 'Bonus',
  FORMAT(sp.CommissionPct, 'P') AS 'CommisionPct', FORMAT(sp.SalesLastYear, 'C') AS 'SalesLastYear' FROM Person.Person p
  INNER JOIN Sales.SalesPerson AS sp
  ON p.BusinessEntityID = sp.BusinessEntityID
  INNER JOIN Sales.SalesTerritory st
  ON sp.TerritoryID = st.TerritoryID
  ORDER BY st.[Name], p.LastName, p.FirstName;