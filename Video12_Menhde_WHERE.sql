USE NORTHWND;

--VD1: Hãy liệt kê tất cả các nhân viên đến từ thành phố London
--Sắp xếp kết quả theo LastName A->Z
SELECT *
FROM Employees
WHERE City = 'London'
ORDER BY LastName ASC;

--VD2: Hãy liệt kê tất cả các đơn hàng bị giao muộn
-- ngày cần phải giao là RequiredDate
-- ngày giao thực tế là ShippedDate
SELECT	[OrderID],
		RequiredDate,
		ShippedDate
FROM Orders
WHERE ShippedDate > RequiredDate;

-- Đếm số đơn giao muộn
SELECT COUNT(*) AS [Tổng số đơn giao muôn]
FROM Orders
WHERE ShippedDate > RequiredDate;

--VD3: Lấy ra tất cả các đơn hàng chi tiết được giảm giá nhiều hơn 10%
-- Discount > 0.1
SELECT	OrderID,
		ProductID,
		UnitPrice
FROM [Order Details]
WHERE Discount > 0.1;

--BT: Hãy liệt kê tất cả các đơn hàng được gửi đến quốc gia France
SELECT *
FROM Orders
WHERE ShipCountry = 'France';

--BT2: Hãy liệt kê các sản phẩm có số lượng hàng trong kho (UnitsInStock) lớn hơn 20
SELECT *
FROM Products
WHERE UnitsInStock > 20;

--AND, OR, NOT
-- AND: Hiển thị một bản ghi nếu tất cả điều kiện đều đúng
-- OR: Một trong các điều kiện đúng
-- NOT: có giá trị không đúng của một điều kiện

--VD1: Hãy liệt kê tất cả các sản phẩm có số lượng trong kho
-- thuộc khoảng nhỏ hơn 50 hoặc lớn hơn 100
SELECT *
FROM Products
WHERE UnitsInStock < 50 OR UnitsInStock > 100;

--VD2: Hãy liệt kê tất cả các đơn hàng được giao đến Brazil,
-- đã bị giao muộn, ngày giao hàng là RequiredDate
-- ngày giao thực tế là ShippedDate
SELECT *
FROM Orders
WHERE ShipCountry = 'Brazil' AND ShippedDate > RequiredDate;

--VD3: Lấy ra tất cả các sản phẩm có giá dưới 100$ và mã thể loại khac 1
-- Lưu ý: dùng NOT
SELECT *
FROM Products
WHERE NOT (UnitPrice >= 100 AND CategoryID = 1)
ORDER BY UnitPrice DESC;

--BT: Hãy liệt kê tất cả các đơn hàng có giá vận chuyển Freight trong khoảng
-- [50, 100] đô la.
SELECT	OrderID,
		CustomerID,
		EmployeeID, 
		Freight
FROM Orders
WHERE Freight >= 50 AND Freight <= 100;

--BT2: Hãy liệt kê các sản phẩm có số lượng hàng trong kho lớn hơn 20 và số lượng hàng 
-- trong đơn nhỏ hơn 20
SELECT *
FROM Products
WHERE UnitsInStock > 20 AND UnitsOnOrder < 20;

-- BETWEEN
--chọn các giá trị trong một phạm vi nhất định
--các giá trị có thể là số, văn bản hoặc ngày tháng
-- WHERE column_name BETWEEN value1 AND value2

--VD1: Lấy danh sách các sản phẩm có giá bán khoảng từ 10 -> 20 đô
SELECT *
FROM Products
WHERE UnitPrice BETWEEN 10 AND 20;

--VD2: Lấy danh sách các đơn đặt hàng được đặt trong khoảng thời gian 
-- từ 1996-07-01 đến ngày 1996-07-31
SELECT *
FROM Orders
WHERE OrderDate BETWEEN '1996-07-01' AND '1996-07-31';

--VD3: Tính tổng số tiền vận chuyển (Freight) của các đơn đặt hàng được đặt trong
-- khoảng thời gian từ 1996-07-01 đến 1996-07-31
SELECT SUM(Freight) AS "Tổng số tiền vận chuyển"
FROM Orders
WHERE OrderDate BETWEEN '1996-07-01' AND '1996-07-31';

--BT1: Lấy danh sách các đơn đặt hàng có ngày đặt trong khoảng
--từ 1/1/1997 đến gày 31/12/1997 và được vận chuyển bằng đường tàu thủy (ShipVia = 3)
SELECT *
FROM Orders
WHERE	OrderDate BETWEEN '1997-01-01' AND '1997-12-31'
		AND ShipVia = 3;