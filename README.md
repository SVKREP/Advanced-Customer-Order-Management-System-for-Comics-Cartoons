# MyDiary Store SQL Project

This project simulates a store database that manages customer orders, store items (comic books and cartoon movies), and order processing using Oracle SQL. The database is designed to handle customer types (regular or gold) with specific business logic for gold members, such as applying discounts and waiving shipping fees.
The entire code is these files: FINALDBMSPROJECT-sqlfile.SQL, all functions, procedures, and triggers in the project.txt, all tables in the project.txt
## Features

- **Customer Table:**
  - Stores customer information, including name, phone, address, and customer type.
  - Two types of customers: `regular` and `gold`.
  
- **StoreItems Table:**
  - Maintains information on items in the store, including price and number of copies available.
  - Includes comic books and cartoon movies.

- **Orders Table:**
  - Tracks customer orders, including order date, shipped date, and shipping fees.
  - Applies discounts for gold members based on the total order amount.
  - Validates shipping dates to ensure they are after the order date.

- **Triggers and Procedures:**
  - **Gold Member Trigger:** Automatically inserts gold members into the gold customer table when they are updated or added.
  - **Create Order Procedure:** Generates a new order for a customer, handles inventory checks, and applies appropriate shipping fees based on customer type.
  - **Order Line Items Procedure:** Manages items within an order, checks inventory, and updates the number of copies available for each item.
  
- **Discounts and Shipping Fees:**
  - Gold members get a 10% discount on orders over $100.
  - Gold members also receive free shipping.
  - Regular customers are charged a flat $10 shipping fee.

- **Order Processing:**
  - Stored procedures handle creating and managing orders, including applying discounts, checking inventory, and calculating taxes.

## Tables Overview

1. **Customer Table**:
   - Columns: `custID`, `name`, `phone`, `address`, `custype`.
   - Customer type is either `regular` or `gold`.

2. **Gold Table**:
   - Tracks gold members and their joining date.

3. **StoreItems Table**:
   - Columns: `itemID`, `price`, `no_of_copies`.
   - Contains both comic books and cartoon movies.

4. **ComicBook Table**:
   - Contains details about comic books, including title and publish date.

5. **CartoonMovie Table**:
   - Contains details about cartoon movies, including title, studio name, and description.

6. **CustOrder Table**:
   - Tracks orders placed by customers, including the order date, shipping fee, and shipped date.

7. **OrderPlaced Table**:
   - Tracks the items placed in each order, linking customers, items, and orders.

8. **OrderLineItems Table**:
   - Contains details about the individual line items in an order, including the quantity of each item ordered.

## SQL Concepts Used

- **Constraints:** Applied for ensuring data integrity such as non-negative stock counts, unique phone numbers for customers, etc.
- **Triggers:** Automatically inserts gold members into a special table when they are updated or added.
- **Stored Procedures:** Automates the process of placing orders, checking inventory, and computing order totals.
- **Functions:** Computes the total cost of an order, applying discounts, shipping fees, and taxes as needed.
- **Cursors:** Used to loop through order items for detailed processing and reporting.
- **VARRAY:** Used for passing lists of items to stored procedures for order processing.

## How to Use

1. **Create Tables:** Run the SQL scripts provided to create the necessary tables and insert some sample data.
2. **Stored Procedures and Functions:** Use the stored procedures to create orders, compute totals, and manage line items.
3. **Triggers:** Automatically handle the gold member upgrades and free shipping.
4. **Functions:** Calculate the total order amount, including applicable discounts and shipping fees.

## Sample Use Cases

- **Place an Order:** Use the `make_order` procedure to create a new order for a customer.
- **Apply Discounts:** Automatically apply a discount for gold members based on the total order value.
- **Manage Inventory:** Automatically deduct item quantities from the `storeItems` table when an order is placed.

## Getting Started

- Clone this repository to your local machine:
  ```bash
  git clone https://github.com/SVKREP/MyDiary-Store-SQL-Project.git
