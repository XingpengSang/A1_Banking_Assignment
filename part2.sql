PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS Customer (
    cid INTEGER PRIMARY KEY,
    cname TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS Company (
    cid INTEGER PRIMARY KEY,
    street TEXT NOT NULL,
    city TEXT NOT NULL,
    FOREIGN KEY (cid) REFERENCES Customer(cid)
);

CREATE TABLE IF NOT EXISTS Individual (
    cid INTEGER PRIMARY KEY,
    gender TEXT NOT NULL,
    age INTEGER NOT NULL,
    FOREIGN KEY (cid) REFERENCES Customer(cid)
);

CREATE TABLE IF NOT EXISTS Account (
    aid INTEGER PRIMARY KEY,
    overdraft_limit REAL NOT NULL,
    cid INTEGER NOT NULL,
    start_date TEXT NOT NULL,
    pin_number TEXT NOT NULL,
    FOREIGN KEY (cid) REFERENCES Customer(cid)
);

CREATE TABLE IF NOT EXISTS Branch (
    branch_number INTEGER PRIMARY KEY,
    city TEXT NOT NULL,
    street TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS Loan (
    loan_number INTEGER PRIMARY KEY,
    loan_type TEXT NOT NULL,
    amount REAL NOT NULL,
    branch_number INTEGER NOT NULL,
    FOREIGN KEY (branch_number) REFERENCES Branch(branch_number)
);

CREATE TABLE IF NOT EXISTS Borrows (
    cid INTEGER NOT NULL,
    loan_number INTEGER NOT NULL,
    PRIMARY KEY (cid, loan_number),
    FOREIGN KEY (cid) REFERENCES Customer(cid),
    FOREIGN KEY (loan_number) REFERENCES Loan(loan_number)
);

CREATE TABLE IF NOT EXISTS Loan_Payment (
    loan_number INTEGER NOT NULL,
    payment_number INTEGER NOT NULL,
    payment_date TEXT NOT NULL,
    payment_amount REAL NOT NULL,
    PRIMARY KEY (loan_number, payment_number),
    FOREIGN KEY (loan_number) REFERENCES Loan(loan_number)
);