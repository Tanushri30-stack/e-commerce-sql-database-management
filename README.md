# E-Commerce Order Management System (SQL Portfolio Project)

This project is designed to demonstrate proficiency in relational database design, standard CRUD operations, and advanced SQL querying. It simulates the backend database of an e-commerce platform, handling customers, products, categories, and complex order management.

## Project Structure

The project is broken down into modular SQL scripts to reflect a clean, professional workflow:

1. **`01_schema.sql`**: Defines the Data Definition Language (DDL). Creates tables (`Customers`, `Categories`, `Products`, `Orders`, `OrderItems`) with appropriate primary keys, foreign keys, constraints (like `CHECK` and `UNIQUE`), and default values.
2. **`02_insert_data.sql`**: Contains the Data Manipulation Language (DML) to populate the database with realistic sample data, ensuring that subsequent queries return meaningful results.
3. **`03_crud_operations.sql`**: Clearly outlines standard **C**reate, **R**ead, **U**pdate, and **D**elete operations corresponding to real-world business scenarios (e.g., registering a user, updating inventory, cancelling an order).
4. **`04_advanced_queries.sql`**: Showcases complex business intelligence queries. Includes multi-table `JOIN`s, `GROUP BY` aggregations, Window Functions (`RANK()`, `AVG() OVER()`), and a `VIEW` creation.

## Key Features Demonstrated

* **Entity-Relationship Modeling**: Implementation of one-to-many and many-to-many relationships (resolved via the `OrderItems` junction table).
* **Data Integrity**: Enforcement of business rules using `CHECK` constraints (e.g., preventing negative prices or stock quantities) and appropriate `ON DELETE` actions (`CASCADE`, `RESTRICT`, `SET NULL`).
* **Analytical Querying**: Ability to extract actionable insights from raw data (e.g., calculating total revenue by category, ranking top-spending customers).
* **Code Organization**: Clean, commented, and modular code structure.

## How to Run

These scripts use standard SQL syntax. They are primarily formatted for SQL Server (T-SQL), but can easily be adapted for PostgreSQL or MySQL.

1. Create a new, empty database in your SQL environment.
2. Execute `01_schema.sql` to build the structure.
3. Execute `02_insert_data.sql` to load the sample records.
4. Run scripts in `03_crud_operations.sql` or `04_advanced_queries.sql` individually to see the results of the operations and queries.

## Author

This project was built to showcase job-ready database engineering and SQL development skills.
