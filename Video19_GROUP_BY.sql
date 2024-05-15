USE NORTHWND;

--VD1: Hãy cho biết mỗi khách hàng đã đặt bao nhiêu đơn hàng
SELECT	CustomerID,
		COUNT(OrderID) AS [Total Order]
FROM Orders
GROUP BY CustomerID;

--VD2: Hãy tính giá trị đơn giá trung bình theo mỗi nhà cung cấp sản phẩm
SELECT	SupplierID,
		AVG(UnitPrice) AS [Đơn giá trung bình]
FROM Products
GROUP BY SupplierID;

--VD3: Hãy cho biết mỗi thể loại có tổng số bao nhiêu sản phẩm trong kho (UnitsInStock)
SELECT	CategoryID,
		SUM(UnitsInStock) AS[Sum of unitsInStock]
FROM Products
GROUP BY CategoryID;

--VD4: Hãy cho biết giá vận chuyển thấp nhất và lớn nhất của các đơn theo từng thành phố và quốc gia khác nhau
SELECT	ShipCity,
		ShipCountry,
		MIN(Freight) AS [Giá thấp nhất],
		MAX(Freight) AS [Giá cao nhất]
FROM Orders
GROUP BY ShipCity, ShipCountry;

--BT: Hãy thống kê số lượng nhân viên theo từng quốc gia khác nhau
SELECT	Country,
		COUNT(EmployeeID)
FROM Employees
GROUP BY Country;

--CL1: Thống kê số khách hàng ở từng quốc gia, từng thành phố
-- Tìm các khách hàng có CompanyName có chữ a trong tên
-- Sắp xếp theo chiều A-Z Country
SELECT	Country,
		City,
		COUNT(CustomerID)
FROM Customers
WHERE CompanyName LIKE '%a%'
GROUP BY Country, City
ORDER BY Country ASC;

--CL2: Tính tổng số tiền vận chuyển ở từng thanh phố, quốc gia
-- Chỉ lấy những ShipName có chữ 'b'
-- Sắp xếp theo chiều từ A-Z của ShipName
SELECT	ShipCountry,
		ShipCity,
		SUM(Freight) AS [Tổng số tiền vận chuyển]
FROM Orders
WHERE ShipName LIKE '%b%'
GROUP BY ShipCountry, ShipCity
ORDER BY ShipCountry ASC;

-- DAY MONTH YEAR
--VD1: Tính số lượng đơn đặt hàng trong năm 1997 của từng khách hàng
SELECT	CustomerID,
		COUNT(OrderID) AS [Số lượng đơn đặt hàng],
		YEAR(OrderDate) AS [Year]
FROM Orders
WHERE YEAR(OrderDate) = 1997
GROUP BY CustomerID, YEAR(OrderDate);

--VD2: Hãy lọc ra các đơn hàng được đặt hàng vào tháng 5 năm 1997
SELECT	*
FROM Orders
WHERE MONTH(OrderDate) = 5 AND YEAR(OrderDate) = 1997;

--Lấy danh sách khách hàng đặt hàng trong năm 1998 và số đơn hàng mỗi tháng, sắp xếp tháng tăng dần
SELECT	CustomerID,
		MONTH(OrderDate),
		COUNT(*)
FROM Orders
WHERE YEAR(OrderDate) = 1998
GROUP BY CustomerID, MONTH(OrderDate)
ORDER BY MONTH(OrderDate) ASC;

--BT: Hãy lọc các đơn đặt hàng đã được giao vào tháng 5, và sắp xếp tăng dần theo năm
SELECT *
FROM Orders
WHERE MONTH(ShippedDate) = 5
ORDER BY YEAR(ShippedDate) ASC;