-- +, -, *, /, %
USE NORTHWND;
GO
--VD1: Tính số lượng sản phẩm còn lại trong kho (UnitsInStock)
-- sau khi bán hết các sản phẩm đã được đặt hàng (UnitsOnOrder)
SELECT	ProductID,
		ProductName AS [Ten san pham],
		UnitsInStock - UnitsOnOrder
FROM Products;

--VD2: Tính giá trị đơn hàng chi tiết cho tất cả các sản phẩm trong bảng OrderDetails
-- OrderDetail = UnitPrice * Quantity
SELECT	OrderID, 
		ProductID, 
		UnitPrice * Quantity AS [Price Order Detail]
FROM [Order Details];

--VD3: Tính tỷ lệ giá vận chuyển đơn đặt hàng (Freight) trung bình
--của các đơn hàng trong bảng Orders so với giá trị vận chuyển của 
-- đơn hàng lớn nhất (MaxFreight)
-- FreightRatio = AVG(Freight) / MAX(Freight)
SELECT	AVG(Freight) / MAX(Freight) AS [Freight Ratio]
FROM Orders;

--BT1: Hãy liệt kê danh sách các sản phẩm và giá (UnitPrice)
--của từng sản phẩm sẽ được giảm đi 10%
--Cách 1: dùng phép nhân + phép chia 
--Cách 2: chỉ được dùng phép nhân