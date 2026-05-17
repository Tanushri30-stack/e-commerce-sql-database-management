-- ==============================================================================
-- E-COMMERCE ORDER MANAGEMENT SYSTEM - SAMPLE DATA
-- ==============================================================================
-- This script populates the database with realistic sample data to allow for 
-- meaningful queries and operations.

-- 1. Insert Categories
INSERT INTO Categories (CategoryName, Description) VALUES
('Electronics', 'Laptops, smartphones, and accessories'),
('Home & Garden', 'Furniture, decor, and gardening tools'),
('Apparel', 'Clothing, shoes, and accessories'),
('Books', 'Physical books and e-books');

-- 2. Insert Customers
INSERT INTO Customers (FirstName, LastName, Email, Phone) VALUES
('John', 'Doe', 'john.doe@example.com', '555-0100'),
('Jane', 'Smith', 'jane.smith@example.com', '555-0101'),
('Michael', 'Johnson', 'mjohnson@example.com', '555-0102'),
('Emily', 'Davis', 'emily.d@example.com', '555-0103'),
('William', 'Brown', 'wbrown@example.com', '555-0104');

-- 3. Insert Products
-- Assuming Category IDs: Electronics=1, Home & Garden=2, Apparel=3, Books=4
INSERT INTO Products (Name, Description, Price, StockQuantity, CategoryID) VALUES
('MacBook Pro 16"', 'High-performance laptop for professionals', 2499.99, 15, 1),
('iPhone 15 Pro', 'Latest smartphone with advanced camera', 1099.99, 40, 1),
('Noise-Cancelling Headphones', 'Wireless over-ear headphones', 299.99, 100, 1),
('Ergonomic Office Chair', 'Comfortable chair with lumbar support', 199.50, 25, 2),
('Coffee Maker', 'Programmable drip coffee machine', 79.99, 50, 2),
('Men''s Running Shoes', 'Lightweight athletic sneakers', 120.00, 60, 3),
('Women''s Winter Coat', 'Warm insulated jacket', 150.00, 30, 3),
('SQL in 10 Minutes', 'A crash course in SQL', 29.99, 100, 4),
('Clean Code', 'A Handbook of Agile Software Craftsmanship', 45.50, 45, 4);

-- 4. Insert Orders
-- Assuming Customer IDs: John=1, Jane=2, Michael=3, Emily=4, William=5
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount, Status) VALUES
(1, '2023-10-15 10:30:00', 2799.98, 'Delivered'),
(2, '2023-10-16 14:45:00', 120.00, 'Shipped'),
(3, '2023-10-18 09:15:00', 279.49, 'Delivered'),
(4, '2023-10-20 16:20:00', 2499.99, 'Processing'),
(1, '2023-10-22 11:00:00', 75.49, 'Pending');

-- 5. Insert Order Items
-- Order 1 (John, Total: 2799.98) -> MacBook Pro (2499.99) + Headphones (299.99)
INSERT INTO OrderItems (OrderID, ProductID, Quantity, UnitPrice) VALUES
(1, 1, 1, 2499.99),
(1, 3, 1, 299.99);

-- Order 2 (Jane, Total: 120.00) -> Men's Running Shoes (120.00)
INSERT INTO OrderItems (OrderID, ProductID, Quantity, UnitPrice) VALUES
(2, 6, 1, 120.00);

-- Order 3 (Michael, Total: 279.49) -> Office Chair (199.50) + Coffee Maker (79.99)
INSERT INTO OrderItems (OrderID, ProductID, Quantity, UnitPrice) VALUES
(3, 4, 1, 199.50),
(3, 5, 1, 79.99);

-- Order 4 (Emily, Total: 2499.99) -> MacBook Pro (2499.99)
INSERT INTO OrderItems (OrderID, ProductID, Quantity, UnitPrice) VALUES
(4, 1, 1, 2499.99);

-- Order 5 (John, Total: 75.49) -> SQL in 10 Minutes (29.99) + Clean Code (45.50)
INSERT INTO OrderItems (OrderID, ProductID, Quantity, UnitPrice) VALUES
(5, 8, 1, 29.99),
(5, 9, 1, 45.50);
