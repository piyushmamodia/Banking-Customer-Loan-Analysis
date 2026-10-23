                                                 Project banking & Loans Risk Analysis
                                                 Database : BankDB
                                                 File     : 01_create_tables.sql
                                                 Purpose  : Create Database and Tables



                                                 
CREATE DATABASE BankDB;

USE BankDB;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Age INT,
    Gender VARCHAR(10),
    City VARCHAR(50),
    AnnualIncome DECIMAL(12,2),
    CreditScore INT
);

CREATE TABLE Loans (
    LoanID INT PRIMARY KEY,
    CustomerID INT,
    LoanType VARCHAR(50),
    LoanAmount DECIMAL(12,2),
    InterestRate DECIMAL(5,2),
    LoanStatus VARCHAR(30),
    IssueDate DATE,
    CONSTRAINT fk_loans_customers
        FOREIGN KEY (CustomerID)
        REFERENCES Customers(CustomerID)
);