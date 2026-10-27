# Banking Customer & Loan Risk Analysis Using SQL

## Project Overview

This project focuses on analyzing banking customer profiles and loan portfolio data using MySQL. The objective is to extract meaningful business insights related to customer creditworthiness, loan distribution, lending performance, and loan risk.

The project demonstrates practical SQL skills through structured queries, data aggregation, joins, subqueries, window functions, and business-oriented analysis.

## Business Objectives

* Analyze customer demographics, annual income, and credit scores.
* Evaluate loan distribution by loan type and loan status.
* Identify customers with high loan exposure and strong credit profiles.
* Calculate total loan amounts, average interest rates, and loan percentages.
* Compare lending activity across different cities.
* Segment loans into categories based on loan amounts.
* Generate insights to support data-driven banking decisions.

## Tools & Technologies

* **Database:** MySQL
* **Query Language:** SQL
* **Development Environment:** MySQL Workbench
* **Version Control:** GitHub

## Database Schema

The project uses two relational tables: `Customers` and `Loans`.

### 1. Customers Table

Stores customer demographic and financial information.

| Column       | Description                                |
| ------------ | ------------------------------------------ |
| CustomerID   | Unique customer identifier and Primary Key |
| CustomerName | Customer name                              |
| Age          | Customer age                               |
| Gender       | Customer gender                            |
| City         | Customer location                          |
| AnnualIncome | Customer's annual income                   |
| CreditScore  | Customer's credit score                    |

### 2. Loans Table

Stores loan details associated with customers.

| Column       | Description                            |
| ------------ | -------------------------------------- |
| LoanID       | Unique loan identifier and Primary Key |
| CustomerID   | Customer reference and Foreign Key     |
| LoanType     | Type of loan                           |
| LoanAmount   | Amount of loan                         |
| InterestRate | Loan interest rate                     |
| LoanStatus   | Current loan status                    |
| IssueDate    | Date the loan was issued               |

### Table Relationship

The `Customers` and `Loans` tables are connected through `CustomerID`. The foreign key establishes the relationship between customer records and their loans, enabling customer-level and loan-level analysis.

## SQL Concepts Demonstrated

### Basic SQL

* SELECT and WHERE
* BETWEEN and IN
* ORDER BY and LIMIT
* Filtering with multiple conditions

### Intermediate SQL

* GROUP BY and aggregate functions
* COUNT, SUM, AVG and ROUND
* HAVING
* CASE WHEN statements
* Conditional aggregation
* Percentage calculations

### Advanced SQL

* INNER JOIN
* Subqueries
* Window functions
* DENSE_RANK()
* PARTITION BY
* Ranking and top-N analysis
* Grouping and filtering for business analysis

## Business Questions Answered

The project includes 15 SQL analysis questions organized into basic, intermediate, and advanced levels.

1. Identify customers with credit scores below 700.
2. Find customers whose annual income is between ₹3,00,000 and ₹7,00,000.
3. Retrieve customers from selected cities.
4. Identify customers with credit scores above 700 and annual income greater than ₹5,00,000.
5. Find the 10 customers with the highest annual income.
6. Calculate the number of loans by loan status.
7. Calculate the total loan amount and number of loans by loan type.
8. Compare average interest rates across loan types.
9. Calculate the percentage distribution of loans by status.
10. Classify loans into small, medium, and large categories.
11. Identify the top three customers by total loan amount.
12. Analyze total loan amounts and average interest rates by city.
13. Identify customers whose credit scores are above the average.
14. Analyze loan status distribution and associated loan amounts.
15. Identify the top loan types by total loan amount in each city.


## How to Run the Project

1. Install and open MySQL Workbench.
2. Open and execute `01_create_tables.sql` to create the database and tables.
3. Execute `02_insert_customers_loans.sql` to insert the sample records.
4. Open `sql_analysis_questions.sql` and execute the analysis queries.
5. Review the query results in MySQL Workbench.
6. Refer to `sql_analysis_questions.md` for the business questions and explanations.


## Key Learnings

* Designing relational database tables with primary and foreign keys.
* Writing SQL queries to retrieve and filter business data.
* Applying aggregate functions to summarize financial information.
* Joining related tables for customer and loan analysis.
* Using subqueries and window functions for ranking and comparative analysis.
* Translating business questions into structured SQL solutions.

## Conclusion

This project demonstrates the application of SQL to banking customer and loan data, with an emphasis on data exploration, portfolio analysis, customer segmentation, and lending-related business questions.

It showcases practical SQL problem-solving skills and the ability to organize analytical queries with clear explanations for business understanding.


