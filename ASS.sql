-- Tạo cơ sở dữ liệu
CREATE DATABASE ASSJAVA5;
GO

USE ASSJAVA5;
GO

-- Bảng Categories
CREATE TABLE Categories (
    Id CHAR(4) PRIMARY KEY,
    Name NVARCHAR(50) NOT NULL
);

-- Bảng Products
CREATE TABLE Products (
    Id INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(50) NOT NULL,
    Image NVARCHAR(50),
    Price FLOAT NOT NULL,
    CreateDate DATE NOT NULL,
    Available BIT NOT NULL,
    CategoryId CHAR(4) NOT NULL,
    FOREIGN KEY (CategoryId) REFERENCES Categories(Id)
);

-- Bảng Accounts
CREATE TABLE Accounts (
    Username NVARCHAR(50) PRIMARY KEY,
    Password NVARCHAR(50) NOT NULL,
    Fullname NVARCHAR(50) NOT NULL,
    Email NVARCHAR(50) NOT NULL,
    Photo NVARCHAR(50),
    Activated BIT NOT NULL,
    Admin BIT NOT NULL
);

-- Bảng Orders
CREATE TABLE Orders (
    Id BIGINT IDENTITY PRIMARY KEY,
    Username NVARCHAR(50) NOT NULL,
    CreateDate DATETIME NOT NULL,
    Address NVARCHAR(100) NOT NULL,
    FOREIGN KEY (Username) REFERENCES Accounts(Username)
);

-- Bảng OrderDetails
CREATE TABLE OrderDetails (
    Id BIGINT IDENTITY PRIMARY KEY,
    OrderId BIGINT NOT NULL,
    ProductId INT NOT NULL,
    Price FLOAT NOT NULL,
    Quantity INT NOT NULL,
    FOREIGN KEY (OrderId) REFERENCES Orders(Id),
    FOREIGN KEY (ProductId) REFERENCES Products(Id)
);
