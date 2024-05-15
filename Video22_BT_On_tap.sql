USE NORTHWND;

--BT1: Hãy cho biết những khách hàng nào đã đặt nhiều hơn 20 đơn hàng
-- sắp xếp theo thứ tổng số đơn hàng giảm dần
SELECT	CustomerID,
		COUNT(OrderID)
FROM Orders
GROUP BY CustomerID
HAVING COUNT(OrderID) > 20
ORDER BY COUNT(OrderID) DESC;

--BT2: Hãy lọc ra các nhân viên (EmployeeID) có tổng số đơn hàng lớn hơn 
--hoặc bằng 100, sắp xếp theo tổng số đơn hàng giảm dần
SELECT	EmployeeID, 
		COUNT(OrderID) AS [Tổng số đơn hàng]
FROM Orders
GROUP BY EmployeeID
HAVING COUNT(OrderID) >= 100
ORDER BY COUNT(OrderID) DESC;

--BT3: Hãy cho biết những thể loại nào (CategoryID) có số sản phẩm khác nhau lớn hơn 11
SELECT	CategoryID,
		COUNT(ProductID) AS [Số sản phẩm khác nhau]
FROM Products
GROUP BY CategoryID
HAVING COUNT(ProductID) > 11;

--BT4: Hãy cho biết những thể loại nào (CategoryID) có tổng số lượng 
--sản phẩm trong kho (UnitsInStock) lớn hơn 350
SELECT	CategoryID,
		SUM(UnitsInStock)
FROM Products
GROUP BY CategoryID
HAVING SUM(UnitsInStock) > 350;

--BT5: Hãy cho biết những quốc gia nào có nhiều hơn 7 đơn hàng
SELECT	ShipCountry,
		COUNT(OrderID)
FROM Orders
GROUP BY ShipCountry
HAVING COUNT(OrderID) > 7;

--BT6: Hãy cho biết những ngày nào có nhiều hơn 5 đơn hàng được giao, sắp xếp tăng dần theo ngày giao hàng
SELECT	ShippedDate,
		COUNT(*) AS [Total of Orders] 
FROM Orders
GROUP BY ShippedDate
HAVING COUNT(*) > 5
ORDER BY ShippedDate ASC;

--BT7: Hãy cho biết những quốc gia bắt đầu bằng chữ 'A' hoặc 'G'
-- và có số lượng đơn hàng lớn hơn 29
SELECT	ShipCountry,
		COUNT(*) AS [Số lượng đơn hàng]
FROM Orders
WHERE ShipCountry LIKE '[A,G]%'
GROUP BY ShipCountry
HAVING COUNT(*) > 29;

--BT8: Hãy cho biết những thành phố nào có số lượng đơn hàng được giao là khác 1 và 2, 
--ngày đặt hàng từ ngày '1997-04-01' đến ngày '1997-08-31' 
SELECT	ShipCity,
		COUNT(OrderID) AS [Số lượng đơn hàng được giao]
FROM Orders
WHERE OrderDate BETWEEN '1997-04-01' AND '1997-08-31'
GROUP BY ShipCity
HAVING COUNT(OrderID) NOT IN (1, 2)
