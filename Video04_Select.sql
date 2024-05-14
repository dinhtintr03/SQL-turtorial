--VD1: Lay ra ten cua tat ca san pham 
SELECT ProductName FROM dbo.Products;

--VD2: Lay ra ten san pham, gia ban tren moi don vi, so luong san pham tren don vi 
SELECT ProductName, UnitPrice, QuantityPerUnit
FROM dbo.Products ;

--VD3: Lay ra ten khach hang va quoc gia cua khach hang do
SELECT CompanyName, Country
FROM Customers;

--VD4: Lay ra ten va so dien thoai cua tat ca cac nha cung cap hang
SELECT CompanyName, Phone
FROM Suppliers;

--Lay tat ca cac cot
SELECT *
FROM Products;

SELECT *
FROM Customers;

-- Video 05 SELECT DISTINCT ... FROM...
SELECT DISTINCT Country
FROM Customers; 

--VD2: Lay ra ten cac ma so buu dien khac nhau tu bang nha cung cap
SELECT DISTINCT PostalCode
FROM Suppliers;

--VD3: Lay ra cac du lieu khac nhau ve ho cua nhan vien (LastName) va cach goi danh hieu lich su (TitleOfCourtesy) cua nhan vien tu bang Employees
SELECT DISTINCT TitleOfCourtesy
FROM Employees;

--VD4: Lay ra ma don vi van chuyen(ShipVia) khac nhau cua cac don hang - Orders
SELECT DISTINCT ShipVia
FROM Orders;

--Video 06: SELECT ... TOP ...
--VD1: Lay ra 5 dong dau tien trong bang Customers
SELECT TOP 5 *
FROM  Customers;

--VD2: Lay ra 30% nhan cua cong ty hien tai
SELECT TOP 30 PERCENT *
FROM Employees;

--VD3: Lay ra cac don hang voi quy dinh la Ma khach hang khong duoc trung lap, chi lay du lieu 5 dong dau tien
SELECT DISTINCT TOP 5 CustomerID
FROM Orders;

--VD4: Lay ra cac san pham co ma the loai khong bi trung lap va chi lay 3 dong dau tien
SELECT DISTINCT TOP 3 CategoryID
FROM Products;


