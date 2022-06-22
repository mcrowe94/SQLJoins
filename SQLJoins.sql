/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT products.Name, categories.Name
FROM products
INNER JOIN categories
ON categories.CategoryID = products.CategoryID
WHERE categories.Name = 'Computers';
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT products.Name, products.Price, reviews.Rating
FROM products
INNER JOIN reviews
ON reviews.ProductID = products.ProductID AND products.Price
WHERE reviews.Rating = 5;
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT employees.EmployeeID, employees.FirstName, employees.LastName, sales.EmployeeID, Sum(Quantity)
FROM employees
INNER JOIN sales
group by employees.EmployeeID = sales.EmployeeID;
/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT departments.Name AS DEPO_NAME, categories.Name AS CAT_NAME, departments.DepartmentID
FROM departments
INNER JOIN categories
WHERE departments.DepartmentID = 1 AND categories.Name LIKE '%Appliances' OR departments.DepartmentID = 3 AND categories.Name LIKE '%Games';
/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT products.Name, products.ProductID, SUM(sales.PricePerUnit) AS TOTAL_PRICE, sales.ProductID, SUM(sales.Quantity) AS TOTAL_SOLD
FROM products
INNER JOIN sales
WHERE products.ProductID = sales.ProductID AND products.Name = 'Eagles: Hotel California';
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT products.NAME, products.ProductID, reviews.Reviewer, reviews.Rating, reviews.Comment, reviews.ProductID
FROM products
INNER JOIN reviews
WHERE products.Name = 'Visio TV' AND reviews.Rating = 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
SELECT employees.EmployeeID, employees.FirstName, employees.LastName, sales.ProductID, sales.EmployeeID, products.Name AS PRODUCT_SOLD, sales.Quantity AS TOTAL_SOLD
FROM employees
INNER JOIN sales 
INNER JOIN products
WHERE sales.EmployeeID = employees.EmployeeID AND products.ProductID = sales.ProductID;