USE NORTHWND;

--BT1: Từ bảng Products và Categories, hãy tìm các sản phẩm thuộc danh mục 'Seafood' in ra các thông tin sau:
-- Mã thể loại
-- Tên thể loại
-- Mã sản phẩm 
-- Tên sản phẩm
SELECT	c.CategoryID,
		c.CategoryName,
		p.ProductID,
		p.ProductName
FROM Products AS p, Categories AS c
WHERE CategoryName = 'Seafood' AND c.CategoryID = p.CategoryID ;

--BT2: Từ bảng Products và Suppliers, hãy tìm các sản phẩm thuộc được cung cấp từ Germany:
-- Mã nhà cung cấp
-- Quốc gia
-- Mã sản phẩm
-- Tên sản phẩm
SELECT	s.SupplierID,
		s.Country,
		p.ProductID,
		p.ProductName
FROM Products AS p, Suppliers AS s
WHERE s.SupplierID = p.SupplierID AND s.Country = 'Germany' ;

--BT3: Từ 3 bảng trong hình hãy in ra các thông tin sau 
-- Mã đơn hàng
-- Tên khách hàng
-- Tên công ty vận chuyển
-- Và chỉ in ra các đơn hàng của các khách hàng đến từ London
SELECT	o.OrderID, c.ContactName, s.CompanyName
FROM Orders AS o, Customers AS c, Shippers AS s 
WHERE o.CustomerID = c.CustomerID AND s.ShipperID = o.ShipVia AND c.City = 'London';

--BT4: Từ 3 bảng trong hình hãy in ra các thông tin sau:
-- Mã đơn hàng
-- tên khách hàng
-- tên công ty vận chuyển
-- ngày yêu cầu chuyển hàng
-- ngày giao hàng
-- và chỉ ra các đơn hàng bị giao muộn hơn quy định
SELECT	o.OrderID,
		c.ContactName,
		s.CompanyName,
		o.RequiredDate,
		o.ShippedDate
FROM Orders AS o, Customers AS c, Shippers AS s
WHERE o.ShippedDate > o.RequiredDate AND o.CustomerID = c.CustomerID AND o.ShipVia = s.ShipperID;

--Exercise: Give these shipcountries for which custombers don't come from the US
-- Select only this countries which is over than 100 orders
-- display ShipCountry and Number of Orders
SELECT	o.ShipCountry,
		COUNT(o.OrderID) AS [Number of Orders]
FROM Orders AS o, Customers AS c
WHERE o.CustomerID = c.CustomerID AND c.Country <> 'USA'
GROUP BY o.ShipCountry
HAVING COUNT(o.OrderID) > 100;