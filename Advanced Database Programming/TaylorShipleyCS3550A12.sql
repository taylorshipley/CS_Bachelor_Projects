USE AdventureWorks;
GO

-- A12 Q1 Static
SELECT 'Static' AS 'Pivot Table';
SELECT DayHired, [Document Control], [Engineering], [Executive], [Facilities and Maintenance], [Finance], [Human Resources], 
[Information Services], [Marketing], [Production], [Production Control], [Purchasing], [Quality Assurance], [Research and Development], 
[Sales], [Shipping and Receiving], [Tool Design]
FROM
(SELECT DATEPART(dd, e.HireDate) AS 'DayHired', d.[Name] AS 'DepartmentName', e.BusinessEntityID FROM HumanResources.Employee e
INNER JOIN HumanResources.EmployeeDepartmentHistory edh
ON e.BusinessEntityID = edh.BusinessEntityID
INNER JOIN HumanResources.Department d
ON edh.DepartmentID = d.DepartmentID) dataTable
PIVOT
(COUNT(BusinessEntityID)
FOR DepartmentName IN ([Document Control], [Engineering], [Executive], [Facilities and Maintenance], [Finance], [Human Resources], 
[Information Services], [Marketing], [Production], [Production Control], [Purchasing], [Quality Assurance], [Research and Development], 
[Sales], [Shipping and Receiving], [Tool Design])
) AS pivotTable 
ORDER BY DayHired;

-- A12 Q1 Dynamic
DECLARE @columns NVARCHAR(MAX), @sql NVARCHAR(MAX);
SET @columns = N'';
SET @sql = N'';
SELECT @columns += N',' + QUOTENAME([Name])
FROM HumanResources.Department AS x;
SET @columns = STUFF(@columns,1,1,'');
SET @sql = N'SELECT DayHired,' + @columns + N'
FROM
(SELECT DATEPART(dd, e.HireDate) AS DayHired, d.[Name] AS DepartmentName, e.BusinessEntityID FROM HumanResources.Employee e
INNER JOIN HumanResources.EmployeeDepartmentHistory edh
ON e.BusinessEntityID = edh.BusinessEntityID
INNER JOIN HumanResources.Department d
ON edh.DepartmentID = d.DepartmentID) dataTable
PIVOT
(COUNT(BusinessEntityID)
FOR DepartmentName IN (' + @columns + N')
) AS pivotTable 
ORDER BY DayHired';

SELECT 'Dynamic' AS 'Pivot Table';
EXEC sp_executesql @sql;

-- A12 Q2 Static
SELECT 'Static' AS 'Pivot Table';
SELECT ScrapReason, [Sunday],[Monday],[Tuesday], [Wednesday], [Thursday], [Friday], [Saturday]
FROM
(SELECT sr.[Name] AS 'ScrapReason', wo.ScrappedQty, DATENAME(WEEKDAY, wo.StartDate) AS 'DayOfWeek' FROM Production.ScrapReason sr
INNER JOIN Production.WorkOrder wo
ON sr.ScrapReasonID = wo.ScrapReasonID) dataTable
PIVOT (SUM(ScrappedQty)
FOR [DayOfWeek] IN ([Sunday],[Monday],[Tuesday], [Wednesday], [Thursday], [Friday], [Saturday])
) pivotTable
ORDER BY ScrapReason;

-- A12 Q2 Dynamic
SET @columns = N'';
SET @sql = N'';
SELECT @columns += N',' + QUOTENAME(DayofWk)
FROM (SELECT DISTINCT DATENAME(WEEKDAY, StartDate) AS DayofWk FROM Production.WorkOrder) AS x;
SET @columns = STUFF(@columns,1,1,'');
SET @sql = N'SELECT ScrapReason,' + @columns + N'
FROM
(SELECT sr.[Name] AS ScrapReason, wo.ScrappedQty, DATENAME(WEEKDAY, wo.StartDate) AS DayOfWeek FROM Production.ScrapReason sr
INNER JOIN Production.WorkOrder wo
ON sr.ScrapReasonID = wo.ScrapReasonID) dataTable
PIVOT (SUM(ScrappedQty)
FOR DayOfWeek IN (' + @columns + N')
) pivotTable
ORDER BY ScrapReason';

SELECT 'Dynamic' AS 'Pivot Table';
EXEC sp_executesql @sql;