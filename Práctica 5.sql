#1- Hacer un listado que contenga código de producto, nombre del producto y nombre de su  categoría. 
SELECT p.productId, p.ProductName, c.CategoryName
FROM products p
LEFT JOIN categories c
ON p.CategoryID = c.CategoryID

#2- Cree un informe que muestre el apellido del empleado y el código de empleado junto al  apellido y código de supervisor del supervisor del empleado. 
#Etiquete las columnas como  Employee, Emp#, Manager y Mgr#, respectivamente #
SELECT e.LastName, e.EmployeeID, e.ReportsTo as 'Manager ID', IF(e.ReportsTo IS NOT NULL, )
FROM employees e

#3- Modifique el ejercicio 4 para que muestre todos los empleados aunque no tengan supervisor. 
SELECT cu.CustomerId, cu.companyName, cu.contactName, cu.Phone, ord.OrderId, emp.LastName
FROM customers cu
LEFT JOIN orders ord
ON cu.CustomerId = ord.CustomerID
LEFT JOIN employees emp
ON ord.EmployeeId = emp.EmployeeId
WHERE ord.RequiredDate < ord.shippeddate 

#4- Listar customerId, companyName, contactName, Phone y OrderId de todos los pedidos que  hayan sido enviados después de la fecha requerida.
SELECT cu.CustomerId, cu.companyName, cu.contactName, cu.Phone, ord.OrderId
FROM customers cu
LEFT JOIN orders ord
ON cu.CustomerId = ord.CustomerID
WHERE ord.RequiredDate < ord.shippeddate

#5- Genere un script que liste orderId, productId, productName, unitPrice, quantity de cada detalle de orden realizado. Ordenar por numero de orden. 

SELECT ord.orderId, ordd.productId, pro.productName, pro.unitPrice, ordd.quantity 
FROM orders ord
LEFT JOIN `order details` ordd
ON ord.orderId = ordd.orderId 
LEFT JOIN products pro
ON ordd.productId = pro.productId
ORDER BY orderId

#6- Genere un script que liste código y nombre del empleado y la cantidad de ordenes realizadas  por cada empleado. Incluir los empleados que no hayan realizado ordenes. 
SELECT emp.EmployeeID, emp.FirstName, count(ord.orderID)
FROM employees emp
LEFT JOIN orders ord 
ON emp.employeeid = ord.employeeid
group by 1
 

#7- Generar un script que liste código de categoría, nombre de categoría, nombre de producto y  cantidades vendidas de cada producto 
SELECT c.CategoryID, c.CategoryName, p.ProductName, ordd.quantity
FROM categories c
LEFT JOIN products p
ON c.CategoryID = p.CategoryID
LEFT JOIN `order details` ordd
ON ordd.productid = p.productid
GROUP BY p.productname

#8- Hacer un reporte que muestre la cantidad total de ordenes realizadas por región
SELECT reg.regiondescription as region, count(ord.orderid) as orders
FROM orders ord
LEFT JOIN employees emp
ON ord.employeeid = emp.employeeid
LEFT JOIN employeeterritories empt
ON emp.employeeid = empt.employeeid
LEFT JOIN territories t
ON empt.territoryid = t.territoryid
LEFT JOIN region reg
ON t.regionid = reg.regionid
GROUP BY regiondescription
#9- Generar un script que liste nombre de la ciudad, nombre de la compañía y relación comercial,  de cada cliente o suplidor registrado en la base de datos


