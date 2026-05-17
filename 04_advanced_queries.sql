-- ==============================================================================
-- E-COMMERCE ORDER MANAGEMENT SYSTEM - ADVANCED QUERIES
-- ==============================================================================
-- This script contains complex queries showcasing analytical skills, 
-- useful for reporting, business intelligence, and portfolio demonstration.

-- ------------------------------------------------------------------------------
-- 1. COMPLEX JOINS & AGGREGATIONS
-- ------------------------------------------------------------------------------

-- Query: Detailed Order Receipt
-- Shows order ID, customer name, individual product names purchased, 
-- the quantity, unit price, and the line item total.
SELECT 
    o.OrderID,
    c.FirstName + ' ' + c.LastName AS CustomerName,
    p.Name AS ProductName,
    oi.Quantity,
    oi.UnitPrice,
    (oi.Quantity * oi.UnitPrice) AS LineTotal
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN OrderItems oi ON o.OrderID = oi.OrderID
JOIN Products p ON oi.ProductID = p.ProductID
ORDER BY o.OrderID;

-- Query: Total Sales by Category
-- Helps the business understand which product categories generate the most revenue.
SELECT 
    cat.CategoryName,
    SUM(oi.Quantity * oi.UnitPrice) AS TotalRevenue,
    SUM(oi.Quantity) AS TotalItemsSold
FROM Categories cat
JOIN Products p ON cat.CategoryID = p.CategoryID
JOIN OrderItems oi ON p.ProductID = oi.ProductID
JOIN Orders o ON oi.OrderID = o.OrderID
WHERE o.Status != 'Cancelled'
GROUP BY cat.CategoryName
ORDER BY TotalRevenue DESC;

-- ------------------------------------------------------------------------------
-- 2. WINDOW FUNCTIONS (Requires SQL Server, Postgres, or newer MySQL/SQLite)
-- ------------------------------------------------------------------------------

-- Query: Top Customers by Spending
-- Ranks customers based on their total lifetime spending.
SELECT 
    c.CustomerID,
    c.FirstName + ' ' + c.LastName AS CustomerName,
    SUM(o.TotalAmount) AS TotalSpent,
    RANK() OVER (ORDER BY SUM(o.TotalAmount) DESC) AS SpendingRank
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.Status IN ('Shipped', 'Delivered')
GROUP BY c.CustomerID, c.FirstName, c.LastName;

-- Query: Moving Average of Order Totals
-- Useful for identifying sales trends over time.
SELECT 
    OrderID, 
    OrderDate, 
    TotalAmount,
    AVG(TotalAmount) OVER (
        ORDER BY OrderDate 
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS MovingAvg_3Orders
FROM Orders
WHERE Status != 'Cancelled';

-- ------------------------------------------------------------------------------
-- 3. VIEWS AND STORED PROCEDURES (Optional, but highly impressive)
-- ------------------------------------------------------------------------------

-- Create a View for Active Orders
-- Simplifies the querying of orders that need attention (not delivered or cancelled).
GO
CREATE VIEW vw_ActiveOrders AS
SELECT 
    o.OrderID, 
    c.Email, 
    o.OrderDate, 
    o.Status, 
    o.TotalAmount
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE o.Status IN ('Pending', 'Processing', 'Shipped');
GO

-- Querying the View
SELECT * FROM vw_ActiveOrders;

-- Note: The `GO` keyword is specific to SQL Server to separate batches. 
-- In MySQL or PostgreSQL, you can simply run the CREATE VIEW statement directly.
