USE Hermosa
GO

-- NO 1
SELECT Member.MemberID, MemberName, [Total Rent Quantity] = SUM (RentQty)
FROM 
	Member JOIN RentTransaction ON Member.MemberID = RentTransaction.MemberID
	JOIN RentTransactionDetail ON RentTransactionDetail.RentTransactionID = RentTransaction.RentTransactionID 
	JOIN Payment ON Payment.PaymentID = RentTransaction.PaymentID
WHERE MONTH(RentTransactionDate) = 6 AND CAST(RIGHT(Member.MemberID, 1) as int) BETWEEN 1 AND 5
GROUP BY Member.MemberID, MemberName
GO
--cara lain
SELECT Member.MemberID, MemberName, [Total Rent Quantity] = SUM (RentQty)
FROM 
	Member JOIN RentTransaction ON Member.MemberID = RentTransaction.MemberID
	JOIN RentTransactionDetail ON RentTransactionDetail.RentTransactionID = RentTransaction.RentTransactionID 
	JOIN Payment ON Payment.PaymentID = RentTransaction.PaymentID
WHERE DATENAME(MONTH,RentTransactionDate) = 'June' AND CAST(RIGHT(Member.MemberID, 1) as int) BETWEEN 1 AND 5
GROUP BY Member.MemberID, MemberName
GO

-- NO 2
SELECT Staff.StaffID, StaffName, [Total Purchase Transaction] = COUNT(PurchaseTransaction.PurchaseTransactionID)
FROM
	Staff JOIN PurchaseTransaction ON Staff.StaffID = PurchaseTransaction.StaffID
	JOIN Payment ON Payment.PaymentID = PurchaseTransaction.PaymentID
WHERE Amount > 1000000 AND MONTH(PurchaseTransactionDate) = 5
GROUP BY Staff.StaffID, StaffName
GO

-- NO 3
SELECT [Member Name] = 'Mrs. ' + MemberName, 
[Renting Cost] = SUM(GownRentPrice * DATEDIFF(day, RentTransactionDetail.StartDate, RentTransactionDetail.ReturnDate)), 
[Total Gown Rented] = SUM(RentQty)
FROM Member JOIN RentTransaction ON Member.MemberID = RentTransaction.MemberID 
	JOIN RentTransactionDetail ON RentTransactionDetail.RentTransactionID = RentTransaction.RentTransactionID 
	JOIN Payment ON Payment.PaymentID = RentTransaction.PaymentID
	JOIN Gown ON RentTransactionDetail.GownID = Gown.GownID
WHERE MemberGender = 'Female' AND DAY(RentTransactionDate) = 15
GROUP BY MemberName
UNION
SELECT [Member Name] = 'Mr. ' + MemberName, 
[Renting Cost] = SUM(GownRentPrice * DATEDIFF(day, RentTransactionDetail.StartDate, RentTransactionDetail.ReturnDate)), 
[Total Gown Rented] = SUM(RentQty)
FROM Member JOIN RentTransaction ON Member.MemberID = RentTransaction.MemberID 
	JOIN RentTransactionDetail ON RentTransactionDetail.RentTransactionID = RentTransaction.RentTransactionID 
	JOIN Payment ON Payment.PaymentID = RentTransaction.PaymentID
	JOIN Gown ON RentTransactionDetail.GownID = Gown.GownID
WHERE MemberGender = 'Male' AND DAY(RentTransactionDate) = 15
GROUP BY MemberName
GO

-- NO 4
SELECT Staff.StaffID, [First Name] = LEFT (StaffName, CHARINDEX(' ', StaffName + ' ')), 
[Total Purchasing Amount] = SUM(Amount)
FROM Staff JOIN PurchaseTransaction ON PurchaseTransaction.StaffID = Staff.StaffID
	JOIN Payment ON PurchaseTransaction.PaymentID = Payment.PaymentID
WHERE Staff.StaffID = 'ST001'
GROUP BY Staff.StaffID, StaffName
HAVING COUNT(PurchaseTransactionID) >= 1
GO

--NO 5
SELECT StaffID,
	CASE CHARINDEX(' ',StaffName,1)
		WHEN 0 THEN StaffName
		ELSE SUBSTRING(StaffName,1,CHARINDEX(' ',StaffName,1))
END AS 'First Name','Total Purchasing Amount' = 'Rp. ' + CAST(StaffSalary as varchar)
FROM (
	SELECT [avgSalary] = AVG(StaffSalary)
	FROM Staff
) as t1,Staff
WHERE StaffSalary > t1.avgSalary
GO

-- NO 6
SELECT Gown.GownID,
'Rented Total Times' = CAST(COUNT(Gown.GownID) as varchar) + ' time(s)',
GownColor,
GownTypeName,
'Description Length' = LEN(GownTypeDesc) 
FROM Gown 
JOIN RentTransactionDetail ON Gown.GownID = RentTransactionDetail.GownID
JOIN GownType ON Gown.GownTypeID = GownType.GownTypeID,(
	SELECT [avglen] = AVG(LEN(GownType.GownTypeDesc))
	FROM GownType
) as t1
WHERE LEN(GownTypeDesc) > t1.avglen
GROUP BY Gown.GownID,GownColor,GownTypeName,GownTypeDesc
GO

-- NO 7
SELECT 'GownID' = REPLACE(Gown.GownID,'GW','Gown'),
GownTypeName,
'GownRentPrice' = 'Rp. ' + CAST(GownRentPrice as varchar),
'Gown Rented Times' = COUNT(Gown.GownID),
GownColor
FROM Gown JOIN GownType ON Gown.GownTypeID = GownType.GownTypeID
JOIN RentTransactionDetail ON Gown.GownID = RentTransactionDetail.GownID
JOIN RentTransaction ON RentTransactionDetail.RentTransactionID = RentTransaction.RentTransactionID
,(
	SELECT [avg_price] = AVG(GownRentPrice)
	FROM Gown
) as t1
WHERE GownRentPrice > t1.avg_price AND
DATENAME(MONTH,RentTransactionDate) = 'June'
GROUP BY Gown.GownID,GownRentPrice,GownColor,GownTypeName
ORDER BY Gown.GownID asc
GO

-- NO 8
SELECT 'Purchase Date' = CONVERT(varchar,PurchaseTransactionDate,107),
'Staff Number' = REPLACE(Staff.StaffID,'ST','Staff'),
PurchaseTransaction.PurchaseTransactionID,
Payment.PaymentID,
'Payment Amount' = 'Rp. ' + CAST(Amount as varchar),
'Total Gown Rented' = COUNT(Gown.GownID)
FROM PurchaseTransaction
JOIN Staff ON PurchaseTransaction.StaffID = Staff.StaffID
JOIN Payment ON Payment.PaymentID = PurchaseTransaction.PaymentID
JOIN PurchaseTransactionDetail ON PurchaseTransactionDetail.PurchaseTransactionID
= PurchaseTransaction.PurchaseTransactionID
JOIN Gown ON Gown.GownID = PurchaseTransactionDetail.GownID
JOIN RentTransactionDetail ON Gown.GownID = RentTransactionDetail.GownID,(
	SELECT [maxamount] = MAX(Amount)
	FROM Payment, PurchaseTransaction
	WHERE DATENAME(MONTH,PurchaseTransactionDate) = 'May' AND Payment.PaymentID = PurchaseTransaction.PaymentID
) as t1
WHERE t1.maxamount = Amount 
GROUP BY PurchaseTransactionDate,Staff.StaffID,
PurchaseTransaction.PurchaseTransactionID,Payment.PaymentID,Amount
GO

--No 9
CREATE VIEW [MemberTotalTransactions]
AS
SELECT 
Member.MemberID,
MemberName,
'Total Rent' = COUNT(RentTransaction.RentTransactionID),
'Total Purchase Amount' = SUM(GownRentPrice * DATEDIFF(DAY,StartDate,ReturnDate))
FROM Member
JOIN RentTransaction ON Member.MemberID = RentTransaction.MemberID
JOIN RentTransactionDetail ON RentTransaction.RentTransactionID = RentTransactionDetail.RentTransactionID
JOIN Gown ON Gown.GownID = RentTransactionDetail.GownID
GROUP BY Member.MemberID,MemberName
GO

-- No 10
CREATE VIEW [StaffInvolvement]
AS
SELECT Staff.StaffID,
StaffName,
'Staff Purchase Involvement' = COUNT(PurchaseTransaction.PurchaseTransactionID),
'Staff Total Expenses' = SUM(Amount)
FROM Staff 
JOIN PurchaseTransaction ON Staff.StaffID = PurchaseTransaction.StaffID
JOIN Payment ON PurchaseTransaction.PaymentID = Payment.PaymentID
GROUP BY Staff.StaffID,StaffName
GO