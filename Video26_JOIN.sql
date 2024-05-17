USE NORTHWND;

--VD1: Sử dụng INNER JOIN, hãy in ra các thông tin sau đây:
-- mã đơn hàng
-- tên công ty khách hàng
SELECT	o.OrderID,
		c.CompanyName
FROM Orders AS o
INNER JOIN Customers AS c
ON o.CustomerID = c.;

--VD2: Sử dụng INNER JOIN. Từ bảng Products và Categories, hãy in ra các thông tin sau đây:
-- Mã thể loại
-- Tên thể loại
-- Mã sản phẩm
-- Tên sản phẩm
SELECT	c.CategoryID,
		c.CategoryName,
		p.ProductID,
		p.ProductName
FROM Products AS p
RIGHT JOIN	Categories AS c
			ON p.CategoryID = c.CategoryID;

--VD3: Sử dụng (INNER) JOIN. Từ bảng Products và Categories, hãy đưa ra các thông sau đây:
-- Mã thể loại
-- Tên thể loại
-- Số lượng sản phẩm
SELECT	c.CategoryID,
		c.CategoryName,
		COUNT(p.ProductID)
FROM Categories c
JOIN Products p
ON p.CategoryID = c.CategoryID
GROUP BY c.CategoryID, c.CategoryName

-- LEFT JOIN (LEFT OUTER JOIN)

-- RIGHT JOIN (RIGHT OUTER JOIN)

-- FULL JOIN (FULL OUTER JOIN)

-- BT1: Hãy liệt kê tên nhân viên và tên khách hàng của các đơn hàng trong bảng "Orders"
SELECT	o.ShipName,
		c.ContactName
FROM Orders AS o
INNER JOIN Customers AS c
ON o.CustomerID = c.CustomerID

-- BT2: Hãy liệt kê tên nhà cung cấp và tên sản phẩm của các sản phẩm
--trong bảng "Products", bao gồm cả các sản phẩm không có nhà cung cấp
SELECT	s.CompanyName,
		p.ProductName
FROM Products AS p
LEFT JOIN Suppliers AS s
ON s.SupplierID = p.SupplierID

-- BT3: Hãy liệt kê tên khách hàng và tên đơn hàng của các đơn hàng trong bảng "Orders", bao gồm cả các khách hàng không có đơn hàng
SELECT	c.ContactName,
		o.OrderID
FROM Orders AS o
RIGHT JOIN Customers AS c
ON o.CustomerID = c.CustomerID

--BT4: Hãy liệt kê tên danh mục và tên nhà cung cấp của sản phẩm trong bảng "Products", bao gồm cả các danh mục và nhà cung cấp không có sản phẩm
SELECT	c.CategoryName, 
		s.CompanyName
FROM Categories AS c
FULL JOIN Products AS p
ON	p.CategoryID = c.CategoryID
FULL JOIN Suppliers AS s
ON s.SupplierID = p.SupplierID