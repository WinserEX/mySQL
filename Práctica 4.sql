#1- Muestre cantidad, carga (freigth) mínima, carga máxima, carga promedio y carga total de todas  las ordenes registradas. 
SELECT count(OrderId), min(freight), max(freight), avg(freight) 
FROM orders

#2- Escriba una consulta para mostrar el número de personas con el mismo puesto. 
SELECT title, count(EmployeeID)
FROM Employees
GROUP BY title	

#3- Hacer un reporte que muestre código de categoría, cantidad y precio de producto promedio por  categoría, ordenados por cantidad en forma descendente.
SELECT categoryID, count(categoryID) AS 'Cantidad de Productos', round(avg(UnitPrice)) AS 'Precio Promedio'
FROM products
GROUP BY categoryID
ORDER BY 'Cantidad de Productos' ASC

#4- listar el año, código de empleado y cantidad de ordenes realizadas en el año 1996 por cada  empleado. Ordénelos por cantidad de órdenes.  
SELECT year(OrderDate) AS 'Year', EmployeeID, count(OrderID) AS 'Cantidad de Ordenes'
FROM orders
WHERE year(OrderDate) IN (1996)
group by EmployeeID

#5-Listar numero de la orden y el precio total de cada orden en la tabla (order details) agrupados  por numero de orden. Al final solo se mostrarán los grupos en los que el precio total sea mayor  a 11,400.
SELECT  OrderId, sum(UnitPrice) 
FROM northwind.`order details`
group by OrderId
having sum(UnitPrice) > 11.40
order by 2 asc

#6- Listar código de producto, cantidad mínima, cantidad máxima, y cantidad total de productos  vendidos de todas las órdenes en la tabla ‘Order Details’. Muestre solo los registros cuya  cantidad mínima sea 5 o más. Ordénelos por cantidad total en forma descendente. 
SELECT  ProductID, min(Quantity) as "min", max(Quantity) as "max", sum(Quantity) as "total"
FROM northwind.`order details`
group by ProductID
having min(Quantity) > 5
order by 4 asc

#7- Hacer un reporte que liste año, código de empleado, carga (freigth) promedio y cantidad total  de ordenes realizadas, ordenados por código de empleado y año en forma ascendente.
SELECT year(OrderDate), employeeid, avg(Freight) as Carga, count(EmployeeID) as Ordenes
FROM orders 
group by EmployeeID  
order by 2 ASC     