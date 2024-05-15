USE NORTHWND;

--HAVING: lọc dữ liệu sau GROUP BY
--VD1: Hãy cho biết những khách hàng nào đã đặt nhiều hơn 20 đơn hàng
-- sắp xếp theo thứ tự tổng số đơn hàng giảm dần
SELECT	CustomerID,
		COUNT(OrderID) AS [Tổng số đơn hàng]
FROM Orders
GROUP BY CustomerID
HAVING COUNT(OrderID) > 20
ORDER BY COUNT(OrderID) DESC;

--VD2: Hãy lọc ra những nhà cung cấp sản phẩm có tổng số lượng hàng trong kho 
--lớn hơn 30, và có trung bình đơn giá có giá trị dưới 50
SELECT	SupplierID,
		SUM(UnitsInStock) AS [Tổng lượng hàng trong kho],
		AVG(UnitPrice) AS [Trung bình đơn giá]
FROM Products
GROUP BY SupplierID
HAVING SUM(UnitsInStock) > 30 AND AVG(UnitPrice) < 50
ORDER BY SUM(UnitsInStock);

--VD3: Hãy cho biết tổng số tiền vận chuyển của từng tháng, 
--trong nửa năm sau của 1996, sắp xếp tháng tăng dần
--tổng tiền vận chuyển lớn hơn 1000đô

SELECT	MONTH(ShippedDate) AS [Tháng],
		SUM(Freight) AS [Tổng số tiền vận chuyển của từng tháng]
FROM Orders
WHERE MONTH(ShippedDate) > 6 AND YEAR(ShippedDate) = 1996
GROUP BY MONTH(ShippedDate)
HAVING SUM(Freight) > 1000
ORDER BY MONTH(ShippedDate) ASC;

--BT: Hãy lọc ra những thành phố có số lượng đơn hàng lớn hơn 16
-- sắp xếp theo tổng số lượng giảm dần
SELECT	ShipCity,
		COUNT(OrderID)
FROM Orders
GROUP BY ShipCity
HAVING COUNT(OrderID) > 16
ORDER BY COUNT(OrderID) DESC;