/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT 
    p.Name AS Product, c.Name AS Category
FROM
    products AS p
        INNER JOIN
    categories AS c ON p.CategoryID = c.CategoryID
WHERE
    c.Name = 'Computers';

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
Select p.Name, p.Price, r.Rating
from products as p
inner join reviews as r
on p.ProductID = r.ProductID
where r.Rating = 5;

/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
select concat(e.FirstName, " ", e.LastName) as Employee, sum(s.Quantity) as Total
from employees as e
inner join sales as s
on e.EmployeeID = s.EmployeeID
group by e.EmployeeID
order by Total desc, e.LastName asc;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
select d.Name as Department, c.Name as Category
from categories as c
inner join departments as d
on c.DepartmentID = d.DepartmentID
where c.Name = "Appliances" or c.Name = "Games";

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 select p.Name as Product, Sum(s.Quantity) as TotalSold, Sum(s.PricePerUnit * s.Quantity) as TotalPrice
 from products as p
 inner join sales as s
 on p.ProductID = s.ProductID
 where p.Name = "Eagles: Hotel California";

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
select p.Name as Product, r.Reviewer, r.Rating, r.Comment
from reviews as r
inner join products as p
on p.ProductID = r.ProductID
where p.Name = "Visio TV" and r.Rating = 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
select e.EmployeeID, concat(e.FirstName, " ", e.LastName) as Name, p.Name as ProductName,
sum(s.Quantity) as TotalProdSold 
from employees as e
inner join sales as s
on e.EmployeeID = s.EmployeeID
inner join products as p 
on s.ProductID = p.ProductID
group by e.EmployeeID, p.ProductID;
