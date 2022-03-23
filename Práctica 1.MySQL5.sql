SELECT CategoryID, CategoryName
FROM categories

SELECT *
FROM categories
ORDER BY 1 DESC;

SELECT FirstName, LastName, title
FROM employees;

SELECT companyName, contactName, phone
FROM customers;

SELECT companyName, contactName, phone
FROM customers;

SELECT companyName, contactName, country, phone
FROM suppliers
ORDER BY country ASC

SELECT country
FROM suppliers
GROUP BY country;

SELECT productid, ProductName, UnitPrice, UnitPrice * 0.18 AS ITBIS
FROM products


