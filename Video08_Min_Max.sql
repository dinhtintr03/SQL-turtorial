--VD1: Tim gia thap nhat cua cac san pham trong bang Products
SELECT MIN(UnitPrice) AS "Min Price"
FROM Products;

--VD2: Lay ra ngay dat hang gan day nhat tu bang Orders
SELECT MAX(OrderDate)
FROM Orders;

--VD3: Tim ra san pham (lay ma va ten san pham) co so luong hang ton kho(UnitsInStock) lon nhat
SELECT MAX(UnitsInStock) AS [MaxUnits InStock]
FROM Products;

--BT: Cho biet tuoi nhan vien lon nhat cong ty
SELECT MIN(BirthDate) AS "Nhan vien lon nhat"
FROM Employees;

-- COUNT, SUM, AVG
--VD1: Dem so luong khach hang co trong bang Customers
SELECT COUNT(*) AS "Number of Customer"
FROM Customers;

--VD2: Tinh tong so tien van chuyen (Freight) cua tat ca cac don dat hang
SELECT SUM(Freight) AS [Sum of Freight]
FROM Orders;

--VD3: Tinh trung binh so luong dat hang (Quantily) cua tat ca cac san pham trong bang [Order Details]
SELECT AVG(Quantity) AS "Trung binh so luong dat hang"
FROM [Order Details];

--VD4: Dem so luong, tinh tong so luong hang trong kho va trung binh gia cua cac san pham co trong bang Product
SELECT	COUNT(*) AS [Number of Products], 
		SUM(UnitsInStock) AS [Total of Units in stock], 
		AVG(UnitPrice) AS [Average of Unit Price]
FROM Products;

--BT: Dem so luong don hang tu bang Orders voi 2 cach:
--Cach 1: dung dau *
--Cach 2: dung ma don hang
SELECT COUNT(*) AS [Number of orders]
FROM Orders;

SELECT COUNT(OrderID) AS [Number of orders with ID]
FROM Orders;
