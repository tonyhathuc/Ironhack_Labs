USE adventureworks;
SELECT * FROM customer;

#1. 	Write a SELECT statement that lists the customerid along with their account number, type, the city the customer lives in and their postalcode.
SELECT c.CustomerID, c.AccountNumber, c.CustomerType, a.City, a.PostalCode
FROM Customer c
JOIN customeraddress ca ON c.CustomerID = ca.CustomerID
JOIN address a ON ca.AddressID = a.AddressID;

#2. 	Write a SELECT statement that lists the 20 most recently launched products, their name and colour
SELECT p.ProductID, p.Name, p.Color FROM product p 
ORDER BY p.SellStartDate DESC
LIMIT 20;

#3. 	Write a SELECT statement that shows how many products are on each shelf in 2/5/98, broken down by product category and subcategory
SELECT pi.Shelf, psc.ProductCategoryID, psc.ProductSubcategoryID, p.Name, pi.Quantity, pi.ModifiedDate
FROM productinventory pi
JOIN product p ON pi.ProductID = p.ProductID
JOIN productsubcategory psc on p.ProductSubcategoryID = psc.ProductSubcategoryID
WHERE pi.ModifiedDate LIKE '%9%'
ORDER BY pi.Shelf, psc.ProductCategoryID, psc.ProductSubcategoryID;

#4. 	I am trying to track down a vendor email address… his name is Stuart and he works at G&K Bicycle Corp. Can you help?
SELECT c.EmailAddress, v.Name
FROM vendor v 
JOIN vendorcontact vc ON v.VendorID = vc.VendorID
JOIN contact c ON vc.ContactID = c.ContactID
WHERE v.Name LIKE 'G & K Bicycle Corp.'; 

#5. 	What’s the total sales tax amount for sales to Germany? What’s the top region in Germany by sales tax?
#Total tax germany 
SELECT st.Name, SUM(soh.SubTotal) AS total_sales, SUM(soh.TaxAmt) AS total_tax
FROM salesorderheader soh
JOIN salesterritory st ON soh.TerritoryID = st.TerritoryID
JOIN address a ON soh.ShipToAddressID = a.AddressID
JOIN stateprovince sp ON a.StateProvinceID = sp.StateProvinceID
WHERE st.Name = 'Germany'
GROUP BY st.Name
ORDER BY total_tax DESC;
#Highest region tax
SELECT sp.Name, SUM(soh.SubTotal) AS total_sales, SUM(soh.TaxAmt) AS total_tax
FROM salesorderheader soh
JOIN salesterritory st ON soh.TerritoryID = st.TerritoryID
JOIN address a ON soh.ShipToAddressID = a.AddressID
JOIN stateprovince sp ON a.StateProvinceID = sp.StateProvinceID
WHERE st.Name = 'Germany'
GROUP BY sp.Name
ORDER BY total_tax DESC
LIMIT 1;

#6. 	Summarise the distinct # transactions by month
SELECT SUBSTRING(th.TransactionDate,6,2) AS month, COUNT( th.TransactionID) as no_distinct_transactions
FROM transactionhistory th
GROUP BY month
ORDER BY month;

#7.  Which ( if any) of the sales people exceeded their sales quota this year and last year?
SELECT sp.SalesPersonID , sp.SalesQuota, sp.SalesYTD, sp.SalesLastYear
FROM salesperson sp
WHERE sp.SalesYTD>sp.SalesQuota AND sp.SalesLastYear > sp.SalesQuota;

#8.  Do all products in the inventory have photos in the database and a text product descriptions? 
SELECT COUNT(pi.ProductID) as no_prod_without_foto 
FROM productphoto pp 
JOIN productproductphoto ppp ON pp.ProductPhotoID = ppp.ProductPhotoID
JOIN productinventory pi ON ppp.ProductID = pi.ProductID
WHERE pp.ThumbnailPhotoFileName LIKE '%no_image%';

#9.  What's the average unit price of each product name on purchase orders which were not fully, but at least partially rejected?
SELECT p.Name, AVG(pod.UnitPrice) AS avg_unit_price_partial_rejections
FROM purchaseorderdetail pod
JOIN product p ON pod.ProductID = p.ProductID
WHERE pod.RejectedQty != pod.ReceivedQty AND pod.RejectedQty > 0
GROUP BY pod.ProductID
ORDER BY p.Name;

#10. How many engineers are on the employee list? Have they taken any sickleave?
SELECT e.EmployeeID, e.SickLeaveHours 
FROM employee e
JOIN employeedepartmenthistory edh ON edh.EmployeeID = e.EmployeeID
JOIN department d ON edh.DepartmentID = d.DepartmentID 
WHERE d.Name = 'Engineering';



#11. How many days difference on average between the planned and actual end date of workorders in the painting stages?
SELECT AVG(date(ScheduledEndDate)-date(ActualEndDate)) AS average_diff_plan_actual_date_days_paint
FROM workorderrouting wor
JOIN location l ON wor.LocationID = l.LocationID
WHERE l.name LIKE '%paint%';





