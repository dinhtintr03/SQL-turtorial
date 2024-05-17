USE NORTHWND;

--VD1: Từ bảng Products và Categories, hãy in ra các thông tin sau:
-- Mã thể loại
-- Tên thể loại 
-- Mã sản phẩm 
-- Tên sản phẩm
SELECT	p.ProductID,
		p.ProductName,
		c.CategoryID,
		c.CategoryName
FROM Products AS p, Categories AS c
WHERE c.CategoryID = p.CategoryID

--VD2: Từ bảng Employees và Orders, hãy in ra các thông tin sau:
-- Mã nhân viên 
-- Tên nhân viên
-- Số lượng đơn hàng mà nhân viên đã bán được
SELECT	e.EmployeeID,
		e.LastName,
		e.FirstName,
		COUNT(o.OrderID) AS [Total Orders]
FROM Employees AS e, Orders AS o
WHERE e.EmployeeID = o.EmployeeID
GROUP BY e.EmployeeID, e.LastName, e.FirstName;

--VD3: Từ bảng Customers và Orders, hãy in ra các thông tin sau:
-- Mã số khách hàng
-- Tên công ty
-- Tên liên hệ
-- Số lượng đơn hàng đã mua
-- Với điều kiện: quốc gia của khách hàng là UK
SELECT	c.CustomerID,
		c.CompanyName,
		c.ContactName,
		COUNT(o.OrderID) AS [Số lượng đơn hàng đã mua]
FROM	Customers AS c,
		Orders AS o
WHERE c.Country = 'UK' AND c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CompanyName, c.ContactName;

--VD4: Từ bảng Orders và Shippers, hãy in ra các thông tin sau:
-- Mã nhà vận chuyển
-- Tên công ty vận chuyển
-- Tổng số tiền được vận chuyển
-- Và in ra màn hình theo thứ tự sắp xếp tổng số tiền vận chuyển giảm dần
SELECT	s.ShipperID,
		s.CompanyName,
		SUM(o.Freight) AS [Tổng số tiền được vận chuyển]
FROM Orders AS o, Shippers AS s
WHERE o.ShipVia = s.ShipperID	
GROUP BY s.ShipperID, s.CompanyName
ORDER BY SUM(o.Freight) DESC;

--VD5: Từ bảng Products và Suppliers, hãy in ra các thông tin sau đây:
-- Mã nhà cung cấp
-- Tên công ty
-- Tổng số các sản phẩm khác nhau đã cung cấp
-- và chỉ in ra màn hình duy nhất 1 nhà cung cấp có số lượng sản phẩm khác nhau nhiều nhất
SELECT	TOP 1
		s.SupplierID,
		s.CompanyName,
		COUNT(p.ProductID) AS [Số sản phẩm khác nhau đã cung cấp]
FROM Products AS p, Suppliers AS s
WHERE p.SupplierID = s.SupplierID
GROUP BY s.SupplierID, s.CompanyName
ORDER BY COUNT(p.ProductID) DESC;

--VD6: Từ bảng Orders và Orders Details, hãy in ra các thông tin sau 
-- Mã đơn hàng 
-- Tổng số tiền sản phẩm của đơn hàng đó
SELECT	o.OrderID,
		SUM(od.UnitPrice*od.Quantity) AS [Tổng số tiền sản phẩm]
FROM Orders AS o, [Order Details] AS od
WHERE o.OrderID = od.OrderID
GROUP BY o.OrderID;

--VD7: Từ 3 bảng trong hình hãy in ra các thông tin sau:
-- Mã đơn hàng
-- Tên nhân viên
-- Tổng số tiền sản phẩm của đơn hàng
SELECT	o.OrderID,
		e.LastName,
		e.FirstName,
		SUM(od.UnitPrice * od.Quantity) AS [Tổng số tiền]
FROM Orders AS o, Employees AS e, [Order Details] AS od
WHERE o.OrderID = od.OrderID AND e.EmployeeID = o.EmployeeID
GROUP BY o.OrderID, e.LastName, e.FirstName;

--BT: Từ 3 bảng trong hình hãy in ra các thông tin sau:
-- mã đơn hàng
-- tên khách hàng
-- tên công ty vận chuyển
-- và chỉ in các đơn hàng được giao đến UK trong năm 1997
SELECT	o.OrderID,
		c.CompanyName,
		s.CompanyName
FROM Orders AS o, Customers AS c, Shippers AS s
WHERE o.CustomerID = c.CustomerID AND o.ShipVia = s.ShipperID AND o.ShipCountry = 'UK' AND YEAR(o.ShippedDate) = 1997
GROUP BY o.OrderID, c.CompanyName, s.CompanyName
