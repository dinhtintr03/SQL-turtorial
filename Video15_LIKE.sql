USE NORTHWND;

--VD1: Hãy lọc ra tất cả các khách hàng đến từ các quốc gia (Country) bắt đầu bằng chữ 'A'
SELECT *
FROM Customers
WHERE Country LIKE 'A%';

--VD2: Lấy danh sách các đơn đặt được gửi đến các thành phố có chứa chữ 'a'
SELECT *
FROM Orders
WHERE ShipCountry LIKE '%a%';

--VD3: Hãy lọc ra tất cả các đơn hàng với điều kiện : ShipCountry LIKE 'U_'
													--ShipCountry LIKE 'U%'
SELECT *
FROM Orders
WHERE ShipCountry LIKE 'U_';

SELECT *
FROM Orders
WHERE ShipCountry LIKE 'U%';

--BT: Hãy lấy ra tất cả các nhà cung cấp hàng có chữ chữ 'b' trong tên của công ty 
SELECT *
FROM Suppliers
WHERE CompanyName LIKE '%b%';

--WILDCARD - kí tự đại diện
--VD1: Hãy lọc ra tất cả các khách hàng có tên liên hệ bắt đầu bằng chữ 'A'
SELECT * 
FROM Customers
WHERE ContactName LIKE 'A%';

--VD2: Hãy lọc ra tất cả các khách hàng có tên liên hệ bắt đầu bằng chữ 'H', và có chữ thứ 2 là bất kỳ kí tự nào
SELECT *
FROM Customers
WHERE ContactName LIKE 'H_%';

--VD3: Hãy lọc ra tất cả các đơn hàng được gửi đến thành phố có chữ cái bắt đầu là L, chữ cái thứ 2 là u hoặc o
SELECT OrderID, ShipCity
FROM Orders
WHERE ShipCity LIKE 'L[u, o]%';

--VD4: Hãy lọc ra tất cả các đơn hàng được gửi đến thành phố có chữ cái bắt đầu là L, chữ cái thứ hai không phải là u hoặc o
SELECT OrderID, ShipCity
FROM Orders
WHERE ShipCity LIKE 'L[^uo]%';

--VD5: Hãy lọc ra tất cả các đơn hàng được gửi đến thành phố có chữ cái bắt đầu là L, chữ cái thứ 2 là các ký tự từ a đến e
SELECT OrderID, ShipCity
FROM Orders
WHERE ShipCity LIKE 'L[a-e]%';

--BT: Hãy lấy ra tất cả các nhà cung cấp hàng có tên công ty bắt đầu bằng chữ A và không chứa ký tự b
SELECT *
FROM Suppliers
WHERE CompanyName LIKE 'A%[^b]%';