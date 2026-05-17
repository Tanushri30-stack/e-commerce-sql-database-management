-- ==============================================================================
-- E-COMMERCE ORDER MANAGEMENT SYSTEM - CRUD OPERATIONS
-- ==============================================================================
-- This script demonstrates standard Create, Read, Update, and Delete operations.

-- ------------------------------------------------------------------------------
-- 1. CREATE (Insert)
-- ------------------------------------------------------------------------------

-- Scenario: A new customer registers on the website.
INSERT INTO Customers (FirstName, LastName, Email, Phone) 
VALUES ('Sarah', 'Connor', 'sarah.connor@example.com', '555-0199');

-- Scenario: Adding a new product to the inventory.
INSERT INTO Products (Name, Description, Price, StockQuantity, CategoryID)
VALUES ('Wireless Mouse', 'Ergonomic optical mouse', 25.99, 150, 1);

-- ------------------------------------------------------------------------------
-- 2. READ (Select)
-- ------------------------------------------------------------------------------

-- Scenario: Retrieve a list of all products that are low in stock (less than 30 items).
SELECT ProductID, Name, StockQuantity, Price
FROM Products
WHERE StockQuantity < 30
ORDER BY StockQuantity ASC;

-- Scenario: Fetch a specific customer's profile using their email.
SELECT CustomerID, FirstName, LastName, Phone, CreatedAt
FROM Customers
WHERE Email = 'john.doe@example.com';

-- Scenario: View a summary of all orders (who ordered, when, and the total).
SELECT 
    o.OrderID,
    c.FirstName + ' ' + c.LastName AS CustomerName,
    o.OrderDate,
    o.TotalAmount,
    o.Status
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID
ORDER BY o.OrderDate DESC;

-- ------------------------------------------------------------------------------
-- 3. UPDATE
-- ------------------------------------------------------------------------------

-- Scenario: The price of the 'MacBook Pro 16"' needs to be updated.
UPDATE Products
SET Price = 2399.99
WHERE Name = 'MacBook Pro 16"';

-- Scenario: An order has been shipped. Update its status.
UPDATE Orders
SET Status = 'Shipped'
WHERE OrderID = 4;

-- Scenario: Restocking inventory. Add 50 units to the 'Ergonomic Office Chair'.
UPDATE Products
SET StockQuantity = StockQuantity + 50
WHERE ProductID = 4;

-- ------------------------------------------------------------------------------
-- 4. DELETE
-- ------------------------------------------------------------------------------

-- Scenario: A customer requests to cancel an order that is still 'Pending'.
-- Note: Because of ON DELETE CASCADE on OrderItems, deleting the order will 
-- automatically delete the associated order items.
DELETE FROM Orders
WHERE OrderID = 5 AND Status = 'Pending';

-- Scenario: A product is discontinued and never sold.
-- (If it was sold, we would use a 'soft delete' by adding an IsActive column 
-- and setting it to FALSE, but for this basic CRUD example, we do a hard delete).
DELETE FROM Products
WHERE Name = 'Wireless Mouse';
