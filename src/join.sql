SELECT distinct city
from Customers;

SELECT *
from Employees
where year ( BirthDate ) between 1921 and 1968;

SELECT SupplierName, Country
from Suppliers;

SELECT CustomerName, Address, Country
from Customers
where Country not in ('Spain')
  AND CustomerName like 'A%';

SELECT *
from Customers
where PostalCode =
      '’ ;                                                                                                                                                                    '

SELECT top 2 *
from Customers
where City = 'London’;

SELECT FirstName, BirthDate from Employees where LastName like '____’;   

SELECT Country, count(*) as suppliers_count
from Suppliers
group by Country;

SELECT country
from Suppliers
group by country
having count(*) = 1
order by country;

SELECT SUM(Products.Price) as total_sum
from Products
         inner join Categories on Categories.CategoryID = Products.CategoryID;

SELECT min(Products.Price) as min_price, Products.ProductName
from Products
         inner join Categories on Products.CategoryID = Categories.CategoryID
group by Products.ProductName;

SELECT Products.ProductName, Suppliers.SupplierName
from Products
         inner join Suppliers on Products.SupplierId = Suppliers.SupplierId
order by Products.ProductName;

SELECT count(p.ProductID) as count_product, p.SupplierID
from Products as p
         inner join Suppliers as s on p.SupplierID = s.SupplierID
group by p.SupplierID
order by count(p.ProductID) desc;

SELECT c.CustomerName, e.FirstName, sh.ShipperName
from Customers as c,
     Orders as o,
     Employees as e,
     Shippers as sh
where c.CustomerID = o.CustomerID
  and o.EmployeeID = e.EmployeeID
  and sh.ShipperID = o.ShipperID;

SELECT e.FirstName, count(c.CustomerName) as NumberOfClients
from Customers as c,
     Orders as o,
     Employees as e
where c.CustomerID = o.CustomerID
  and o.EmployeeID = e.EmployeeID
group by e.FirstName
order by count(c.CustomerName) desc;