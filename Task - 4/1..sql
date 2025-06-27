-- Create the Database
CREATE DATABASE `ccc`;
USE `The Literary Haven`;

-- user's 
CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    UserName VARCHAR(10a0) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE
);

-- Books
CREATE TABLE Books (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(200) NOT NULL,
    Author VARCHAR(100) NOT NULL,
    Genre VARCHAR(100) NOT NULL,
    ISBN VARCHAR(20) NOT NULL UNIQUE,
    Publisher VARCHAR(100),
    YearOfPublication INT,
    NoOfRevisedVersions INT DEFAULT 0,
    Price DECIMAL(10, 2) NOT NULL, 
    SectionID INT,
    FOREIGN KEY (SectionID) REFERENCES Sections(SectionID)
);

-- Purchase
CREATE TABLE Purchases (
    PurchaseID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT NOT NULL,
    BookID INT NOT NULL,
    PurchaseDate DATE NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Interaction
CREATE TABLE Interactions (
    InteractionID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT NOT NULL,
    BookID INT NOT NULL,
    InteractionType VARCHAR(50) NOT NULL, -- e.g., 'view', 'like'
    InteractionDate DATE NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

CREATE TABLE Sections (
    SectionID INT PRIMARY KEY AUTO_INCREMENT,
    SectionName VARCHAR(100) NOT NULL
);




