USE AdventureWorks;
GO

-- A10b Q1
SELECT p.FirstName, p.LastName, FORMAT(SUM(soh.TotalDue), 'C') AS 'TotalDue' FROM Person.Person p
INNER JOIN Sales.SalesPerson sp
ON p.BusinessEntityID = sp.BusinessEntityID
LEFT JOIN Sales.SalesOrderHeader soh
ON sp.BusinessEntityID = soh.SalesPersonID
GROUP BY p.FirstName, p.LastName;

-- A10b Q2
SELECT p.[Name] AS 'ProductName', c.[Name] AS 'CultureName', FORMAT(SUM(p.StandardCost), 'c') AS 'AvgStandardCost' 
FROM Production.Product p
INNER JOIN Production.ProductModelProductDescriptionCulture pmpdc
ON p.ProductModelID = pmpdc.ProductModelID
INNER JOIN Production.Culture c
ON pmpdc.CultureID = c.CultureID
WHERE p.[Name] LIKE '%gloves%' AND c.[Name] = 'Thai'
GROUP BY p.[Name], c.[Name];

-- A10b Q3
SELECT d.[name], COUNT(edh.BusinessEntityID) AS 'EmployeeCount' FROM HumanResources.Department d
INNER JOIN HumanResources.EmployeeDepartmentHistory edh
ON d.DepartmentID = edh.DepartmentID
GROUP BY d.[Name];

-- A10b Q4
SELECT d.[name], FORMAT(AVG(eph.Rate), 'c') AS 'AveragePayRate' FROM HumanResources.Department d
INNER JOIN HumanResources.EmployeeDepartmentHistory edh
ON d.DepartmentID = edh.DepartmentID
INNER JOIN HumanResources.EmployeePayHistory eph
ON edh.BusinessEntityID = eph.BusinessEntityID
GROUP BY d.[Name];

-- A10b Q5
 SELECT COUNT(p.BusinessEntityID) AS 'PersonCount', a.PostalCode FROM Person.Person p
 INNER JOIN Person.BusinessEntityAddress bea
 ON p.BusinessEntityID = bea.BusinessEntityID
 INNER JOIN Person.[Address] a
 ON bea.AddressID = a.AddressID
 GROUP BY a.PostalCode
 HAVING COUNT(p.BusinessEntityID) >= 100
 ORDER BY COUNT(p.BusinessEntityID) DESC, a.PostalCode

-- A10b Q6
 SELECT p.FirstName, p.LastName, FORMAT(sp.SalesYTD, 'c') AS SalesYTD FROM Person.Person p
 INNER JOIN Sales.SalesPerson sp
 ON p.BusinessEntityID = sp.BusinessEntityID
 WHERE sp.SalesYTD < (SELECT AVG(SalesYTD) FROM Sales.SalesPerson);
 
-- A10b Q7
 SELECT p.[Name] AS 'ProductName', sr.[Name] AS 'ScrapReason', SUM(wo.ScrappedQty) AS 'ScrappedQty' FROM Production.Product p
 INNER JOIN Production.WorkOrder wo
 ON p.ProductID = wo.ProductID
 INNER JOIN Production.ScrapReason sr
 ON wo.ScrapReasonID = sr.ScrapReasonID
 GROUP BY p.[Name], sr.[Name]
 HAVING SUM(wo.scrappedQty) > 100
 ORDER BY SUM(ScrappedQty) DESC;
 
-- A10b Q8
 SELECT COUNT(e.BusinessEntityID) AS 'EmployeeCount', sp.[Name] FROM HumanResources.Employee e
 INNER JOIN Person.BusinessEntityAddress bea
 ON e.BusinessEntityID = bea.BusinessEntityID
 INNER JOIN Person.[Address] a
 ON bea.AddressID = a.AddressID
 INNER JOIN Person.StateProvince sp
 ON a.StateProvinceID = sp.StateProvinceID
 GROUP BY sp.[Name]
 ORDER BY COUNT(e.BusinessEntityID) DESC, sp.[Name];

-- A10b Q9
SELECT d.[Name] AS 'DepartmentName', COUNT(e.VacationHours) AS 'EmployeeCount' FROM HumanResources.Employee e
INNER JOIN HumanResources.EmployeeDepartmentHistory edh
ON e.BusinessEntityID=edh.BusinessEntityID
INNER JOIN HumanResources.Department d
ON edh.DepartmentID = d.DepartmentID 
WHERE VacationHours>50
GROUP BY d.[Name]
ORDER BY d.[Name];

-- A10b Q10
SELECT sr.[name] AS 'ScrapReason' , l.[Name] AS 'LocationName', COUNT(wo.ProductID) AS 'ScrappedQty' FROM Production.ScrapReason sr
INNER JOIN Production.WorkOrder wo
ON sr.ScrapReasonID = wo.ScrapReasonID
INNER JOIN Production.WorkOrderRouting wor
ON wo.WorkOrderID= wor.WorkOrderID
INNER JOIN Production.[Location] l
ON wor.LocationID = l.LocationID
GROUP BY sr.[Name], l.[Name]
HAVING COUNT(wo.ProductID) >=5
ORDER BY COUNT(wo.ProductID) DESC, sr.[Name], l.[Name];