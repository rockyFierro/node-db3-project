-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
select productname, categoryname 
from ProductDetails_V
-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
select o.id as 'order num.' , s.companyname as 'shipper', orderdate as 'ordered on'
from [Order] o
join shipper s
 on o.shipvia = s.id
where orderdate < '2012-08-09'
order by orderdate desc;
-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
select productname, quantity as [Units Ordered]
from orderdetail od
join  [order] o ON od.orderid = o.id
join  product p ON p.id = od.productid
where o.id = '10251'
order by productname;
-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
select
 o.id as 'Order num.',
 c.companyname as 'Company',
 e.lastname as 'Employee' 
from [order] o
join customer c on o.customerid = c.id
join employee e on o.employeeid = e.id