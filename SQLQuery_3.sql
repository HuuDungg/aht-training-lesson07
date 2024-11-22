create DATABASE 
use bank

CREATE TABLE Customers (
    customer_number INT PRIMARY KEY, 
    fullname VARCHAR(100),
    address VARCHAR(255),
    email VARCHAR(100),
    phone VARCHAR(15)
);

CREATE TABLE Accounts (
    account_number INT PRIMARY KEY, 
    account_type VARCHAR(50),
    date DATE,
    balance DECIMAL(15, 2),
    customer_number INT,          
    FOREIGN KEY (customer_number) REFERENCES Customers(customer_number)
);

CREATE TABLE Transactions (
    tran_number INT PRIMARY KEY,    
    account_number INT,            
    date DATETIME,
    amounts DECIMAL(15, 2),
    descriptions TEXT,
    FOREIGN KEY (account_number) REFERENCES Accounts(account_number)
);
