--VD1: Lay "CompanyName" va dat ten thay the la "Congty", "PostalCode" la "Mabuudien"
SELECT CompanyName AS Congty, PostalCode AS Mabuudien
FROM Customers;

--VD2: Lay "LastName" va dat ten thay the la "Ho", "FirstName" la "Ten"
SELECT LastName AS "Ho", FirstName AS "Ten"
FROM Employees;

--VD3: Lay ra 15 dong dau tien tat ca cac cot trong bang Orders, dat ten thay the cho bang Orders la "o"
SELECT TOP 15 *
FROM Orders AS "o";

-- hoac
SELECT TOP 15 o.*
FROM Orders AS [o];

--BT: Lay ra cot va dat ten thay the
-- ProductName -> Ten san pham
-- SupplierID -> Ma nha cung cap
-- CategoryID -> Ma the loai
-- Dat ten thay the cho bang Products la "p", su dung no khi truy van cac cot ben tren
-- Chi lay 5 san pham dau tien
SELECT TOP 5 p.ProductName AS "Ten san pham", SupplierID AS "Ma nha cung cap", CategoryID AS "Ma the loai"
FROM Products AS "p";

