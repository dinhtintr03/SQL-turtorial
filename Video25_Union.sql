USE NORTHWND;

-- Truy vấn 1: Từ bảng Order Details hãy liệt kê các đơn đặt hàng có UnitPrice nằm trong phạm vi 100 đến 200
SELECT OrderID
FROM [Order Details]
WHERE UnitPrice BETWEEN 100 AND 200 ;

-- Truy vấn 2: Đưa ra các đơn đặt hàng có số lượng 10 hoặc 20 
SELECT OrderID
FROM [Order Details]
WHERE Quantity IN (10, 20)

--Kết hợp 2 truy vấn trên
SELECT OrderID
FROM [Order Details] AS od
WHERE	UnitPrice BETWEEN 100 AND 200
		AND Quantity IN (10, 20)

SELECT OrderID
FROM [Order Details] AS od
WHERE	UnitPrice BETWEEN 100 AND 200
		OR Quantity IN (10, 20)

SELECT DISTINCT OrderID
FROM [Order Details] AS od
WHERE	UnitPrice BETWEEN 100 AND 200
		OR Quantity IN (10, 20)