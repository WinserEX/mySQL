--1- Listar código, nombre, apellido, cargo y pais de los empleados que proceden de reino unido (UK) 
SELECT EmployeeID, FirstName, lastName, title, BirthDate, country
FROM employees
WHERE country = "UK"

--2- En la tabla empleados hay un campo llamado “ReportsTo” el cual indica el código del supervisor  con el cual se reporta el empleado. Listar código, nombre, cargo, y reportsTo, de aquellos empleados que tienen con quien reportarse. 
SELECT EmployeeID, FirstName, lastName, title, reportsTo
FROM employees
WHERE reportsTo IS NOT NULL

--3- Listar código, nombre, cargo, y reportsTo, de aquellos empleados que no tienen que reportarse  con nadie.
SELECT EmployeeID, FirstName, lastName, title, reportsTo
FROM employees
WHERE reportsTo IS NULL 

--4- Listar código, nombre y precio unitario de los productos cuyo precio unitario sea igual o mayor a  55 dólares. Ordénelos por precio unitario en orden descendente. 
SELECT productID, ProductName, UnitPrice
FROM products
WHERE UnitPrice >= 55
ORDER BY UnitPrice desc

--5- Listar todas las ordenes realizadas entre el primero de enero y el 31 de diciembre de 1994.
SELECT *
FROM orders
WHERE OrderDate BETWEEN '1996-01-01 00:00:00' AND '1996-12-31 00:00:00'

--6- Listar las ordenes que hayan sido registradas por el empleado código 3 y enviadas en forma  tardía. Es decir que fueron enviadas después de la fecha en la que fueron requeridas. 
SELECT *
FROM orders
WHERE ShippedDate > RequiredDate AND EmployeeID = 3;

--7- Listar número de orden, código de cliente, código de empleado, fecha y país de envió de todas  las ordenes trabajadas por los empleados 5, 4 y 3 para enviar a Venezuela. 
SELECT orderID, CustomerID, employeeID, OrderDate, ShipCountry
FROM orders
WHERE ShipCountry = 'Venezuela' AND (employeeID = 5 OR employeeID = 4 OR employeeID = 3);

--8- Listar nombre de la compañía, nombre de contacto, teléfono, ciudad y país de todos los clientes que pertenezcan a un país cuyo nombre empieza con la letra “A” o el nombre de la ciudad  termine con “a”. Ordénelos por ciudad. 
SELECT companyName, contactName, Phone, City, Country
FROM customers
WHERE country LIKE 'A%' OR city LIKE '%a'
ORDER BY City

--9- Listar nombre de la compañía, nombre de contacto y país de todos los suplidores que no tengan  número de fax y que no pertenezcan a los países México, Francia y Argentina. Ordénelos por  país. 
SELECT companyName, contactName, Country, Fax
FROM customers
WHERE (Country <> "Mexico" OR "France" OR "Argentina") AND Fax IS NULL
order by Country

--10- Usando Subconsultas: Listar código de producto, nombre de producto y precio unitario de todos  los productos que pertenezcan a la categoría ‘Beverages’
SELECT pro.ProductID, pro.ProductName, pro.CategoryID, pro.UnitPrice, cat.CategoryName
FROM products pro
LEFT JOIN categories cat
ON pro.CategoryID = cat.CategoryID
WHERE cat.CategoryName = 'Beverages'