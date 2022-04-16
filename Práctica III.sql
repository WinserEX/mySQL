
-- Usando la base de datos Northwind, escribir un query que: 
-- 1- Liste apellido de todos los empleados en mayúsculas y su país de origen en minúsculas. 
select upper(LastName) as 'apellido', lower(country) as 'país'
from employees


-- 2- Que genere el siguiente resultado de la tabla empleados (employees): 
--Ms. Nancy trabaja como Sales Representative desde 1992-05-01 00:00:00
select concat(FirstName, ' trabaja como ', Title, ' desde ', HireDate) as 'Nombre Completo'
from employees

-- 3- Que liste el código, nombre, apellido y correo de los empleados. El correo electrónico debe  formarse concatenando la primera letra del nombre con el primer apellido y la cadena literal  ‘@miempresa.com’ (tomar en cuenta que los correos se escriben con letras minúsculas). 
select EmployeeID, FirstName, LastName, concat(SUBSTRING(FirstName FROM 1 FOR 1), LastName, '@miempresa.com') as 'Email'
from employees

-- 4- Listar Nombre de compañía y cantidad de caracteres (longitud) que tiene cada nombre de  compañía de la tabla de clientes (customers) ordenelos por longitud en orden descendente.  
select CompanyName, length(CompanyName) as 'Longitud'
from customers
order by 2 DESC

-- 5- Listar código de empleado como un string del tipo ‘0001’ , nombre del producto, y el campo  cantidades por unidad (quantityPerUnit) reemplazando la palabra ‘bottles’ por ‘botellas’
-- Instructor: Francis Fulgencio 
select concat('000', o.EmployeeID) as 'codigo', p.ProductName, REPLACE(p.QuantityPerUnit , 'bottle', 'botella') as 'Cantidad por Unidad'
from northwind.`order details` od
left join products p
on od.ProductID = p.ProductID
left join orders o
on od.OrderID = o.OrderID
order by 3 desc

-- 6- Listar el nombre de las distintas ciudades de la tabla customers, normal y en reverso.  Asegurándose de eliminar los espacios en blanco del inicio y el final de la ciudad. Todo debe  aparecer en mayúsculas. 
select upper(City) as 'Normal', reverse(upper(City)) as 'Reverse'
from customers
where City is not NULL

-- 7- Genere un query que muestre un numero entero (sin parte decimal) aleatorio entre 0 y 100 , un  literal numérico fijo, la raíz cuadrada de ese número, y el resultado de elevar ese mismo número  a la 3. 
select FLOOR(RAND()*(100-0+1))+10 as 'Inter', 7 as 'Literal', sqrt(7) as 'Raíz', pow(7,3) as 'Poteciación'

-- 8- Liste código, nombre, precio unitario (normal, redondeado a dos decimales, redondeado hacia  arriba y redondeado hacia abajo) de todos los productos 
select ProductID, ProductName, round(UnitPrice, 2) as 'Round', ceiling(UnitPrice) as 'Arriba', floor(UnitPrice) as 'Abajo'
from products

-- 9- Listar código, nombre, cantidades en stock, cantidad mínima de reposición (reorderLevel) y el  valor absoluto de su diferencia, para todos los productos que tengan unidades en stock menores  a la cantidad mínima de reposición. 
select ProductID, ProductName, UnitsInStock, ReorderLevel, ReorderLevel - UnitsInStock as 'Diferencia'
from products
where UnitsInStock < ReorderLevel
order by 5 desc

-- 10- Escribir un script que genere el siguiente resultado:
select concat('La orden  número ', OrderId, ' fue enviada en ', ShippedDate) as 'Historico de Envios'
from orders
where 'Historico de Envios' is not NULL

-- Instructor: Francis Fulgencio 
-- 11- Muestre el código de la orden, código de cliente, código de empleado y año de la orden y  nombre del día de la semana, de todas las ordenes realizadas los lunes durante los años 1994 y  1996, 
-- por el empleado código 6. 
select orderid, customerid, EmployeeID, year(OrderDate) as 'Año', dayname(OrderDate) as 'Day'
from orders
where dayname(OrderDate) = 'Monday' and year(OrderDate) = 1994

-- 12- Muestre el código, nombre, apellido, fecha de contratación, fecha de nacimiento, y edad que  tenían al momento de su contratación de todos los empleados 

select EmployeeID, FirstName, LastName, HireDate, BirthDate, TIMESTAMPDIFF(YEAR, BirthDate, CURDATE()) as 'Edad', TIMESTAMPDIFF(YEAR, HireDate, CURDATE()) as 'Tiempo en la empresa', TIMESTAMPDIFF(YEAR, BirthDate, CURDATE()) - TIMESTAMPDIFF(YEAR, HireDate, CURDATE()) as 'Edad Contratado' 
from employees




-- 13- Hacer un script que muestre código de orden, fecha de orden, fecha requerida y posible fecha  de envío, a todas las ordenes que no tengan fecha de envío. La posible fecha de envío debe  calcularse como 15 días después de la fecha requerida. 

select OrderID, OrderDate, RequiredDate, DATE_ADD(RequiredDate, INTERVAL 15 DAY) as 'Posible'
from orders
where ShippedDate is NULL