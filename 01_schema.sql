-- ==============================================================================
-- E-COMMERCE ORDER MANAGEMENT SYSTEM - SCHEMA DEFINITION
-- ==============================================================================
-- This script creates the core tables for an e-commerce database.
-- It demonstrates the use of primary keys, foreign keys, constraints, and standard data types.

-- 1. Customers Table
-- Stores user information. We use a UNIQUE constraint on the email to prevent duplicates.
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1), -- Using IDENTITY for SQL Server (AUTO_INCREMENT in MySQL, SERIAL in Postgres)
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Phone VARCHAR(20),
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- 2. Categories Table
-- Helps organize products into different departments.
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    CategoryName VARCHAR(50) NOT NULL UNIQUE,
    Description TEXT
);

-- 3. Products Table
-- Stores inventory items. Includes a foreign key to the Categories table.
CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(100) NOT NULL,
    Description TEXT,
    Price DECIMAL(10, 2) NOT NULL CHECK (Price >= 0), -- Ensure price is never negative
    StockQuantity INT NOT NULL DEFAULT 0 CHECK (StockQuantity >= 0), -- Prevent negative inventory
    CategoryID INT,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID) ON DELETE SET NULL
);

-- 4. Orders Table
-- Tracks customer purchases. 
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT NOT NULL,
    OrderDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    TotalAmount DECIMAL(12, 2) NOT NULL DEFAULT 0.00,
    Status VARCHAR(20) NOT NULL DEFAULT 'Pending' CHECK (Status IN ('Pending', 'Processing', 'Shipped', 'Delivered', 'Cancelled')),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE
);

-- 5. OrderItems Table
-- The junction table that resolves the many-to-many relationship between Orders and Products.
CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    UnitPrice DECIMAL(10, 2) NOT NULL CHECK (UnitPrice >= 0), -- Captured at the time of order to prevent historical price changes
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID) ON DELETE RESTRICT -- Prevent deleting a product if it has been ordered
);

-- Note: The syntax used here is compatible with SQL Server. 
-- For PostgreSQL, replace `IDENTITY(1,1)` with `SERIAL`.
-- For MySQL, replace `IDENTITY(1,1)` with `AUTO_INCREMENT` and `DATETIME DEFAULT CURRENT_TIMESTAMP` with `TIMESTAMP DEFAULT CURRENT_TIMESTAMP`.
