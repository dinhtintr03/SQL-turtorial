-- ORDER BY dung sau FROM
-- ORDER BY ... ASC | DESC
-- ASC: tang dan (default) - Ascending
-- DESC: giam dan - Descending
USE [NORTHWND];
GO
--VD1: Liet ke tat ca cac nha cung cap theo thu tu ten don vi CompanyName tu A-Z
SELECT *
FROM [dbo].[Suppliers]
ORDER BY CompanyName ASC;

--VD2: Liệt kê tất cả các sản phẩm theo thứ tự giá giảm dần
SELECT *
FROM Products
ORDER BY UnitPrice DESC;

--VD3: Liệt kê tất cả các nhân viên theo thứ tự họ và tên đệm A-Z
--Không dùng ASC | DESC
SELECT *
FROM Employees
ORDER BY LastName ASC, FirstName ASC;

SELECT *
FROM Employees
ORDER BY LastName, FirstName;

--VD4: Lấy ra một sản phẩm có số lượng bán cao nhất từ bảng Order Details
--Không được dùng MAX
SELECT TOP 1 *
FROM [Order Details]
ORDER BY Quantity DESC;

SELECT MAX(Quantity)
FROM [Order Details];

--BT1: Liệt kê danh sách các đơn đặt hàng (OrderID) trong bảng Orders
-- theo thứ tự giảm dần của ngày đặt hàng (OrderDate)
SELECT OrderID
FROM Orders
ORDER BY OrderDate DESC;

--BT2: Liệt kê tên, đơn giá, số lượng trong kho (UnitsInStock) của tất cả
-- các sản phẩm trong bảng Products, theo thứ tự giảm dần của UnitsInStock
SELECT ProductName AS [Tên sản phẩm], UnitPrice AS [Đơn giá], UnitsInStock AS [Số lượng trong kho]
FROM Products
ORDER BY UnitsInStock DESC;