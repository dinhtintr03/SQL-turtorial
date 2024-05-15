USE NORTHWND;

--VD1:Hãy lọc ra tất cả các đơn hàng với điều kiện:
--a, Đơn hàng được giao đến Germany, UK, Brazil
SELECT *
FROM Orders
WHERE ShipCountry IN ('Germany', 'UK', 'Brazil');

SELECT *
FROM Orders
WHERE ShipCountry = 'Germany' OR ShipCountry = 'UK' OR ShipCountry = 'Brazil';

--b, Đơn hàng được giao đến khác Germany, UK, Brazil
SELECT *
FROM Orders
WHERE ShipCountry NOT IN ('Germany', 'UK', 'Brazil');

--VD2: Lấy ra các sản phẩm có mã thể loại khác với 2, 3 và 4
SELECT *
FROM Products
WHERE CategoryID NOT IN (2, 3, 4);

--VD3: Hãy liệt kê các nhân viên không phải là nữ từ bảng nhân viên
SELECT	LastName,
		FirstName,
		TitleOfCourtesy
FROM Employees
WHERE TitleOfCourtesy NOT IN ('Ms.', 'Mrs.');

--VD4: Hãy liệt kê các nhân viên là nữ từ bảng nhân viên
SELECT	LastName,
		FirstName,
		TitleOfCourtesy
FROM Employees
WHERE TitleOfCourtesy IN ('Ms.', 'Mrs.');

--BT: Hãy lấy ra tất cả các khách hàng đến từ các thành phố sau đây:
-- Berlin, London, Warszawa
SELECT *
FROM Customers
WHERE City IN ('Berlin', 'London', 'Warszawa');

-- IS NULL, IS NOT NULL

--VD1: Lấy ra tất cả các đơn hàng chưa được giao hàng
-- ShippedDate => NULL
SELECT	OrderID,
		OrderDate,
		RequiredDate,
		ShippedDate
FROM Orders
WHERE ShippedDate IS NULL;

SELECT	COUNT(*) AS [Số đơn hàng chưa được giao]
FROM Orders
WHERE ShippedDate IS NULL;

--VD2: Lấy danh sách các khách hàng có khu vực không bị NULL
SELECT *
FROM Customers
WHERE Region IS NOT NULL;

--VD3: Lấy danh sách các khách hàng không có tên công ty
SELECT *
FROM Customers
WHERE CompanyName IS NULL;

--BT: Hãy lấy ra tất cả các đơn hàng chưa được giao hàng và có khu vực giao hàng (ShipRegion) không bị NULL
SELECT *
FROM Orders
WHERE ShippedDate IS NULL AND ShipRegion IS NOT NULL;