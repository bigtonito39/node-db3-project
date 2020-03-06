-- Multi-Table Query Practice

--1. Display the ProductName and CategoryName for all products in the database. Shows 77 records.
--Withough aliases:
SELECT ProductName, CategoryName  FROM Product
JOIN Category
ON  Product.CategoryId = Category.Id
--with aliases:
SELECT ProductName, CategoryName  FROM Product AS P
JOIN Category AS C
ON  P.CategoryId = C.Id
--2. Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
--without aliases:

SELECT "Order".Id, Shipper.CompanyName, "Order".OrderDate
FROM "Order"
Join Shipper
ON "Order".ShipVia = Shipper.Id --this works as a conditional, just like an if statement, if shipper id is equal to shipvia value then its true
WHERE "Order".OrderDate < '2012-08-09';
--with aliases
SELECT "O".Id, S.CompanyName, "O".OrderDate
FROM "Order" AS O
Join Shipper AS S
ON O.ShipVia = S.Id
WHERE O.OrderDate < '2012-08-09';

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
--without aliases
SELECT Product.ProductName, OrderDetail.Quantity
FROM OrderDetail
JOIN Product
ON OrderDetail.ProductId = Product.Id
WHERE OrderDetail.OrderId = 10251
ORDER BY Product.ProductName

--with aliases
SELECT P.ProductName, OD.Quantity
FROM OrderDetail AS OD
JOIN Product AS P
ON OD.ProductId = P.Id
WHERE OD.OrderId = 10251
ORDER BY P.ProductName

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
--With aliases
SELECT "Order".Id, Customer.CompanyName, Employee.LastName
FROM "Order"
JOIN Customer
ON "Order".CustomerId = Customer.Id
JOIN Employee
ON "Order".EmployeeId = Employee.Id;

--Wihout Aliases

SELECT o.Id, C.CompanyName, E.LastName
FROM "Order" AS o
JOIN Customer AS C
ON o.CustomerId = C.Id
JOIN Employee AS E
ON o.EmployeeId = E.Id;