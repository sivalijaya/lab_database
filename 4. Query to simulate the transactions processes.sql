USE Hermosa
GO

-- PURCHASE

INSERT INTO Payment VALUES
('PY031','PT003',5000000)
GO

INSERT INTO PurchaseTransaction VALUES
('PD016','ST002','VD005','PY031','2019-10-21')
GO

INSERT INTO PurchaseTransactionDetail VALUES
('PD016','GW003',1),
('PD016','GW005',2)
GO

UPDATE Gown SET GownQty = GownQty + 1
WHERE GownID = 'GW003'
GO

UPDATE Gown SET GownQty = GownQty + 2
WHERE GownID = 'GW005'
GO


-- RENT

INSERT INTO Payment VALUES
('PY032','PT003',7500000)
GO

INSERT INTO RentTransaction VALUES
('RE016','ST003','MM010','PY032','2019-12-19')
GO

INSERT INTO RentTransactionDetail VALUES
('RE010','GW008','3','2019-04-03','2019-04-05'),
('RE006','GW005','2','2019-12-15','2019-12-20')
GO

UPDATE Gown SET GownQty = GownQty - 3
WHERE GownID = 'GW008'
GO

UPDATE Gown SET GownQty = GownQty - 2
WHERE GownID = 'GW005'
GO