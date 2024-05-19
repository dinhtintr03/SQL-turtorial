USE NORTHWND;

-- SUB QUERY
-- là một truy vấn SELECT được viết bên trong một truy vấn SELECT, UPDATE, INSERT hoặc DELETE
-- hoạt động như một bảng ảo tạm thời, nó được sử dụng để trích xuất thông tin từ các bảng hoặc tập dữ liệu khác trong cùng một câu truy vấn

-- Liệt kê ra toàn bộ sản phẩm
SELECT ProductID, ProductName, UnitPrice
FROM Products

-- Tìm giá trung bình của các sản phẩm
SELECT AVG(UnitPrice) AS [Giá trung bình]
FROM Products

-- Lọc những sản phẩm có giá > giá trung bình
SELECT ProductID, ProductName, UnitPrice
FROM Products
WHERE UnitPrice > (
	SELECT AVG(UnitPrice)
	FROM Products
)

-- Lọc ra những khách hàng có số đơn hàng > 10
SELECT	c.ContactName,
		COUNT(o.OrderID) AS [Total Orders]
FROM Customers AS c
LEFT JOIN Orders AS o
ON o.CustomerID = c.CustomerID
GROUP BY c.ContactName
HAVING COUNT(o.OrderID) > 10

-- SUB QUERY
SELECT *
FROM Customers
WHERE CustomerID IN (
		SELECT CustomerID
		FROM Orders
		GROUP BY CustomerID
		HAVING COUNT(OrderID) > 10
)

-- Tính tổng số tiền cho từng đơn hàng 
SELECT *, (
		SELECT SUM(od.Quantity * od.UnitPrice)
		FROM [Order Details] AS od
		WHERE o.OrderID = od.OrderID
)
FROM Orders AS o

-- Lọc ra tên sản phẩm và tổng số đơn hàng của sản phẩm 