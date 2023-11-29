-- Вывести клиентов не из Germany, имена которых начинаются на букву A

SELECT * 
FROM Customers
WHERE Country <> "Germany" 
AND CustomerName LIKE "A%";

---------------------

SELECT CustomerName
FROM Customers
WHERE Country <> "Germany" 
AND CustomerName LIKE "A%";

-- Вывести данные о заказах клиентов 1, 2, 5 (проекция: номерзаказа, названиекомпании_перевозчика)

SELECT 
	t1.OrderID,
	t2.ShipperName
FROM Orders t1
JOIN Shippers t2
ON t1.ShipperID=t2.ShipperID
WHERE t1.CustomerID IN (1, 2, 5);

-- Вывести данные о заказах клиентов не из France (проекция: номерзаказа, имяклиента, фамилия_менеджера)

SELECT 
	t1.OrderID,
	t2.CustomerName,
    t3.LastName
FROM Orders t1
JOIN Customers t2
ON t1.CustomerID=t2.CustomerID
JOIN Employees t3
ON t1.EmployeeID=t3.EmployeeID
WHERE t2.Country <> "France" ;

-- Вывести ср/стоимость товаров от поставщика 4

SELECT
	AVG (Price) AS avg_price
FROM Products
WHERE SupplierID=4;

-- Вывести один самый дешевый товар от поставщика 1

SELECT *
FROM Products
WHERE SupplierID=1
ORDER BY Price ASC
LIMIT 1;

-- Зачем нужна проекция в БД. Дайте короткий ответ
1. фильтрация (для вывода только необходимых данных для конкретной задачи)
2. улучшение производительности
3. снижение нагрузки на систему





