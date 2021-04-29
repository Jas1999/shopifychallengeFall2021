select 'Q2' as ' ';
select 'a' as ' ';

select count(OrderID) from Orders
inner join Shippers
on Shippers.ShipperID = Orders.ShipperID
where ShipperName = "Speedy Express"
group by Orders.ShipperName;


select 'b' as ' ';

with EmployeeOrders(OrdersCount,EmployeeID) as
        (select (count(OrderID)) as OrderCount,EmployeeID from Orders group by EmployeeID),
    MaxOrders(MaxOrders,EmployeeID)  as
        (select MAX(OrdersCount) as MaxOrders, EmployeeID from EmployeeOrders)

Select LastName, MaxOrders from Employees Join MaxOrders on MaxOrders.EmployeeID = Employees.EmployeeID;

select 'c' as ' ';

with GermanCustomers as
	   (select CustomerID, Country from Customers where Country = "Germany"),
    GermanOrders as
	   (select * from Orders inner join GermanCustomers on GermanCustomers.CustomerID = Orders.CustomerID inner join OrderDetails on OrderDetails.OrderID = Orders.OrderID),
	ProductsOrderedInGermany as
	   (select count(ProductID) as ProductCount,ProductID,ProductName from GermanOrders inner join Products using (ProductID) group by ProductID order by ProductCount DESC)
select max(ProductCount),ProductID,ProductName from ProductsOrderedInGermany;
