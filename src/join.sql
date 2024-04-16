--Бардык клиенттердин шаарлары уникалдуу чыксын
SELECT distinct city
from Customers;

--Туулган жылы 1950 жана 1960 - жылдардын арасындагы ишкерлер чыксын
SELECT *
from Employees
where year ( BirthDate ) between 1921 and 1968;

--Франциялык поставщиктердин аттары жана мамлекети чыксын
SELECT SupplierName, Country
from Suppliers;

--Олкосу Испаниядан башка, аты “A” дан башталган клиенттердин аты, адресси жана олкосу чыксын
SELECT CustomerName, Address, Country
from Customers
where Country not in ('Spain')
  AND CustomerName like 'A%';

--PostalCode бош болгон клиенттер чыксын
SELECT *
from Customers
where PostalCode ='’ ;                                                                                                                                                                    '

--Лондондон болгон клиенттердин биринчи эки клиентин чыгаргыла
SELECT top 2 *
from Customers
where City = 'London’;

--Фамилиясы 4 тамгадан турган ишкерлердин аты жана туулган жылдары чыксын
SELECT FirstName, BirthDate from Employees where LastName like '____’;

--Ар бир олкодо канчадан поставщик бар экенин чыгаргыла
SELECT Country, count(*) as suppliers_count
from Suppliers
group by Country;

--Поставщиктердин саны 1 эле болгон олколорду аты менен сорттоп чыгаргыла
SELECT country
from Suppliers
group by country
having count(*) = 1
order by country;

--Ар бир категориядагы продуктылардын жалпы суммасын чыгаргыла
SELECT SUM(Products.Price) as total_sum
from Products
         inner join Categories on Categories.CategoryID = Products.CategoryID;

--6 жана 8 категориясындагы продуктылардын эн арзан баасын жана атын чыгаргыла
SELECT min(Products.Price) as min_price, Products.ProductName
from Products
         inner join Categories on Products.CategoryID = Categories.CategoryID
group by Products.ProductName;

--Продуктылар жана алардын поставщиктеринин аттары чыксын(сортировка болсун)
SELECT Products.ProductName, Suppliers.SupplierName
from Products
         inner join Suppliers on Products.SupplierId = Suppliers.SupplierId
order by Products.ProductName;

--Ар бир поставщиктин канчадан продуктысы бар экени кемуу тартибинде сорттолуп чыксын
SELECT count(p.ProductID) as count_product, p.SupplierID
from Products as p
         inner join Suppliers as s on p.SupplierID = s.SupplierID
group by p.SupplierID
order by count(p.ProductID) desc;

--Клиенттердин аты CustomerName деп, ага саткан ишкерлердин
-- аты жана алар кандай служба доставки колдонгону тууралуу маалымат чыксын
SELECT c.CustomerName, e.FirstName, sh.ShipperName
from Customers as c,
     Orders as o,
     Employees as e,
     Shippers as sh
where c.CustomerID = o.CustomerID
  and o.EmployeeID = e.EmployeeID
  and sh.ShipperID = o.ShipperID;

--Кайсы ишкер канча клиент обслуживайтеткен чыксын
SELECT e.FirstName, count(c.CustomerName) as NumberOfClients
from Customers as c,
     Orders as o,
     Employees as e
where c.CustomerID = o.CustomerID
  and o.EmployeeID = e.EmployeeID
group by e.FirstName
order by count(c.CustomerName) desc;














