USE master
GO

CREATE DATABASE Hermosa
GO

USE Hermosa
GO

CREATE TABLE GownType(
	GownTypeID CHAR(5) PRIMARY KEY CHECK(GownTypeID LIKE 'GT[0-9][0-9][0-9]'),
	GownTypeName VARCHAR(50),
	GownTypeDesc VARCHAR(50) CHECK(LEN(GownTypeDesc) <= 50)
)
GO

CREATE TABLE Member(
	MemberID CHAR(5) PRIMARY KEY CHECK(MemberID LIKE'MM[0-9][0-9][0-9]'),
	MemberName VARCHAR(50),
	MemberPhone VARCHAR(20) CHECK (MemberPhone LIKE '+62%'),
	MemberGender VARCHAR(20) CHECK (MemberGender = 'Male' OR  MemberGender = 'Female'),
	MemberEmail VARCHAR(50)
)
GO

CREATE TABLE Staff(
	StaffID CHAR(5) PRIMARY KEY CHECK(StaffID LIKE'ST[0-9][0-9][0-9]'),
	StaffName VARCHAR(50),
	StaffPhone VARCHAR(20) CHECK (StaffPhone LIKE '+62%'),
	StaffGender VARCHAR(20) CHECK (StaffGender = 'Male' OR  StaffGender = 'Female'),
	StaffEmail VARCHAR(50),
	StaffAddress VARCHAR(50),
	StaffSalary BIGINT
)
GO

CREATE TABLE Supplier(
	SupplierID CHAR(5) PRIMARY KEY CHECK(SupplierID LIKE'VD[0-9][0-9][0-9]'),
	SupplierName VARCHAR(50),
	SupplierAddress VARCHAR(50),
	SupplierPhone VARCHAR(20) CHECK (SupplierPhone LIKE '+62%'),
	SupplierEmail VARCHAR(50)
)
GO

CREATE TABLE Gown(
	GownID CHAR(5) PRIMARY KEY CHECK(GownID LIKE'GW[0-9][0-9][0-9]'),
	GownTypeID CHAR(5) FOREIGN KEY REFERENCES GownType(GownTypeID),
	GownColor VARCHAR(20),
	GownRentPrice BIGINT,
	GownQty INT
)
GO

CREATE TABLE PaymentType(
	PaymentTypeID CHAR(5) PRIMARY KEY CHECK(PaymentTypeID LIKE'PT[0-9][0-9][0-9]'),
	PaymentTypeName VARCHAR(20)
)
GO

CREATE TABLE Payment(
	PaymentID CHAR(5) PRIMARY KEY CHECK(PaymentID LIKE'PY[0-9][0-9][0-9]'),
	PaymentTypeID CHAR(5) FOREIGN KEY REFERENCES PaymentType(PaymentTypeID),
	Amount BIGINT
)
GO

CREATE TABLE RentTransaction(
	RentTransactionID CHAR(5) PRIMARY KEY CHECK(RentTransactionID LIKE'RE[0-9][0-9][0-9]'),
	StaffID CHAR(5) FOREIGN KEY REFERENCES Staff(StaffID),
	MemberID CHAR(5) FOREIGN KEY REFERENCES Member(MemberID),
	PaymentID CHAR(5) FOREIGN KEY REFERENCES Payment(PaymentID),
	RentTransactionDate DATE
)
GO

CREATE TABLE RentTransactionDetail(
	RentTransactionID CHAR(5) FOREIGN KEY REFERENCES RentTransaction(RentTransactionID),
	GownID CHAR(5) FOREIGN KEY REFERENCES Gown(GownID),
	PRIMARY KEY (RentTransactionID, GownID),
	RentQty INT CHECK(RentQty <= 5),
	StartDate DATE,
	ReturnDate DATE
)
GO

CREATE TABLE PurchaseTransaction(
	PurchaseTransactionID CHAR(5) PRIMARY KEY CHECK(PurchaseTransactionID LIKE'PD[0-9][0-9][0-9]'),
	StaffID CHAR(5) FOREIGN KEY REFERENCES Staff(StaffID),
	SupplierID CHAR(5) FOREIGN KEY REFERENCES Supplier(SupplierID),
	PaymentID CHAR(5) FOREIGN KEY REFERENCES Payment(PaymentID),
	PurchaseTransactionDate DATE
)
GO

CREATE TABLE PurchaseTransactionDetail(
	PurchaseTransactionID CHAR(5) FOREIGN KEY REFERENCES PurchaseTransaction(PurchaseTransactionID),
	GownID CHAR(5) FOREIGN KEY REFERENCES Gown(GownID),
	PRIMARY KEY (PurchaseTransactionID, GownID),	
	PurchaseQty INT CHECK (PurchaseQty <= 5)
)
GO
