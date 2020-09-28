USE Hermosa
GO

INSERT INTO Staff VALUES
('ST001','Jordan','+62823737423','Male','jordan@gmail.com','jalan kenangan',4000000),
('ST002','Jeremy','+62825343623','Male','jeremy@gmail.com','jalan kambing ajaib',4500000),
('ST003','Arnold','+62356336463','Male','arnold@gmail.com','jalan binus',3500000),
('ST004','Alvaro','+62334656463','Male','alvaro@gmail.com','jalan manggisan',2500000),
('ST005','Sukma Indah','+6234534535','Female','sukma.i@gmail.com','jalan indah',4000000),
('ST006','Antonius Wahyu','+6283253252','Male','a.wahyu@gmail.com','jalan wahyu',6500000),
('ST007','Budi Budiman Setiawan','+6285545534','Male','b.setiawan@gmail.com','jalan binomo',8500000),
('ST008','Anto Sukiman','+62845698483','Male','anto.sukisuki@gmail.com','jalan sukisuki',1000000),
('ST009','Cinta Hwang','+62432424672','Female','hwang2000@gmail.com','jalan hwanghwang',2500000),
('ST010','Angelia Salim','+62427567675','Female','angeeel@gmail.com','jalan diponegoro',4225000)
GO

INSERT INTO Member VALUES
('MM001','Elisa Sihombing','+62798754391','Female','elisasihombing@gmail.com'),
('MM002','Caca Wijaya','+62786533227','Female','caca123@gmail.com'),
('MM003','Syasya Milea','+6286538952','Female','syasyamilea@gmail.com'),
('MM004','Mario Sebastian','+6234552678','Male','mariosebastian@gmail.com'),
('MM005','Eliana Margareta','+6287665497','Female','ellimargareta@gmail.com'),
('MM006','Manuela','+62673487659','Female','manuela55@gmail.com'),
('MM007','Brigita Aurell','+6289654443','Female','brigitaaurell@gmail.com'),
('MM008','Samuel Handoyo','+6276554886','Male','samuel@gmail.com'),
('MM009','Lili Lesmana','+6287669545','Female','lili.les@gmail.com'),
('MM010','Marry Simatupang','+62457972686','Female','marrysimatupang@gmail.com')
GO

INSERT INTO Supplier(SupplierID, SupplierName, SupplierPhone, SupplierEmail, SupplierAddress) VALUES
('VD001','Antoni Cahya','+62465747479','antonichy@gmail.com','jalan bambu tiga'),
('VD002','Intan Berlian','+62937693796','intan.b@gmail.com','jalan kambing lima'),
('VD003','Cintami Lara','+620325703345','cintami.lar@gmail.com','jalan panjang tiga'),
('VD004','Ika Uwa','+62053453453','ika@gmail.com','jalan batu'),
('VD005','Calvin Leonardo','+6236362856','calvinleo@gmail.com','jalan tiga kenangan'),
('VD006','Wahyudi Idya','+62305783760','wahyudi.id@gmail.com','jalan internasional'),
('VD007','Cherrylita Ollyvia','+6236346374','cherrylitaoliv@gmail.com','jalan terkenal'),
('VD008','Hubert Hermawan','+62435363627','hubertherm@gmail.com','jalan mh thamrin'),
('VD009','Lyanna Febrianna','+62242357477','lyanna.feb@gmail.com','jalan hadirin'),
('VD010','Siska Media','+62363603704','siskamedia@gmail.com','jalan lt suprapto')
GO

INSERT INTO GownType VALUES
('GT001','Mermaid Style','Style of evening fown'),
('GT002','A-line','Dress with a triangular silhouette'),
('GT003','Tea Length','Dress of a length that falls above the ankle'),
('GT004','Exaggerated','Dress with more noticeable detail'),
('GT005','Empire Waist','Dress that has a fitted bodice ending'),
('GT006','Jacket Gown','Gown with a mid-stomach-length'),
('GT007','The Sheath','Close-fitting dress'),
('GT008','Ball Gown','Full-length dress'),
('GT009','Princess Gown','Fitted dress or other farment cut'),
('GT010','Asymmetrical','Slanted hemline or neckline')
GO

INSERT INTO Gown(GownID, GownTypeID, GownColor, GownRentPrice, GownQty) VALUES 
('GW001','GT006','Maroon',650000,13),
('GW002','GT001','Sky Blue',2450000,12),
('GW003','GT010','Navy Blue',500000,15),
('GW004','GT009','Pink',6300000,12),
('GW005','GT004','Yellow Lemon',2500000,13),
('GW006','GT008','Milk White',9250000,18),
('GW007','GT007','Black',1250000,15),
('GW008','GT005','Brown',1500000,12),
('GW009','GT001','Red',4250000,12),
('GW010','GT002','Mint',1000000,19),
('GW011','GT009','White',7500000,11),
('GW012','GT003','Cream',500000,16),
('GW013','GT008','White Silver',7500000,12),
('GW014','GT003','Light Brown',825000,17),
('GW015','GT008','Light Pink',8500000,10)
GO

INSERT INTO PaymentType VALUES
('PT001','OVO'),
('PT002','GOPAY'),
('PT003','BCA'),
('PT004','CASH')
GO

INSERT INTO Payment VALUES
('PY001','PT003',27000000),
('PY002','PT004',5400000),
('PY003','PT003',12150000),
('PY004','PT003',4450000),
('PY005','PT003',10200000),
('PY006','PT004',8475000),
('PY007','PT004',9600000),
('PY008','PT003',18000000),
('PY009','PT003',35550000),
('PY010','PT002',11025000),
('PY011','PT004',30000000),
('PY012','PT002',27000000),
('PY013','PT001',17400000),
('PY014','PT004',8325000),
('PY015','PT003',72750000),
('PY016','PT002',2450000),
('PY017','PT004',36050000),
('PY018','PT003',15500000),
('PY019','PT001',16000000),
('PY020','PT003',18375000),
('PY021','PT002',14800000),
('PY022','PT004',500000),
('PY023','PT003',8500000),
('PY024','PT001',7500000),
('PY025','PT003',1500000),
('PY026','PT004',24800000),
('PY027','PT002',7500000),
('PY028','PT003',1650000),
('PY029','PT004',8500000),
('PY030','PT003',6300000)
GO

INSERT INTO PurchaseTransaction VALUES
('PD001','ST002','VD002','PY001','2018-05-15'),
('PD002','ST005','VD007','PY002','2018-06-16'),
('PD003','ST005','VD005','PY003','2018-09-13'),
('PD004','ST007','VD003','PY004','2018-12-08'),
('PD005','ST010','VD010','PY005','2019-02-14'),
('PD006','ST003','VD004','PY006','2019-02-25'),
('PD007','ST001','VD005','PY007','2019-04-20'),
('PD008','ST006','VD002','PY008','2019-05-10'),
('PD009','ST007','VD001','PY009','2019-05-15'),
('PD010','ST006','VD008','PY010','2019-06-29'),
('PD011','ST004','VD009','PY011','2019-08-18'),
('PD012','ST009','VD006','PY012','2019-09-27'),
('PD013','ST010','VD006','PY013','2019-10-13'),
('PD014','ST008','VD008','PY014','2019-11-15'),
('PD015','ST007','VD010','PY015','2019-12-15')
GO

INSERT INTO PurchaseTransactionDetail VALUES
('PD001','GW006',4),
('PD001','GW003',2),
('PD002','GW010',5),
('PD003','GW013',3),
('PD004','GW007',5),
('PD004','GW001',4),
('PD005','GW012',5),
('PD006','GW008',2),
('PD006','GW007',5),
('PD006','GW010',3),
('PD007','GW001',5),
('PD007','GW005',2),
('PD008','GW002',5),
('PD009','GW015',5),
('PD009','GW009',2),
('PD010','GW014',3),
('PD010','GW001',4),
('PD010','GW007',5),
('PD011','GW003',5),
('PD012','GW004',5),
('PD013','GW005',5),
('PD014','GW009',3),
('PD015','GW011',5),
('PD015','GW015',3),
('PD015','GW003',4)
GO

INSERT INTO RentTransaction VALUES
('RE001','ST001','MM003','PY016','2018-05-03'),
('RE002','ST003','MM005','PY017','2018-06-15'),
('RE003','ST006','MM004','PY018','2018-07-11'),
('RE004','ST002','MM009','PY019','2018-10-28'),
('RE005','ST010','MM010','PY020','2018-12-15'),
('RE006','ST001','MM007','PY021','2019-01-02'),
('RE007','ST004','MM002','PY022','2019-03-19'),
('RE008','ST009','MM008','PY023','2019-04-24'),
('RE009','ST005','MM001','PY024','2019-05-16'),
('RE010','ST003','MM005','PY025','2019-05-21'),
('RE011','ST009','MM009','PY026','2019-06-29'),
('RE012','ST007','MM001','PY027','2019-08-08'),
('RE013','ST008','MM004','PY028','2019-09-16'),
('RE014','ST007','MM003','PY029','2019-12-15'),
('RE015','ST002','MM006','PY030','2019-12-27')
GO

INSERT INTO RentTransactionDetail VALUES
('RE001','GW002','2','2018-05-03','2018-05-05'),
('RE002','GW004','1','2018-06-15','2018-06-20'),
('RE002','GW006','3','2018-06-15','2018-06-20'),
('RE002','GW010','2','2018-06-15','2018-06-20'),
('RE003','GW003','1','2018-07-11','2018-07-14'),
('RE003','GW013','2','2018-07-11','2018-07-14'),
('RE004','GW005','3','2018-10-28','2018-10-30'),
('RE004','GW009','2','2018-10-28','2018-10-30'),
('RE005','GW006','1','2018-12-15','2018-12-19'),
('RE005','GW010','5','2018-12-15','2018-12-19'),
('RE005','GW014','5','2018-12-15','2018-12-19'),
('RE006','GW004','1','2019-01-02','2019-01-04'),
('RE006','GW015','1','2019-01-02','2019-01-04'),
('RE007','GW003','1','2019-03-19','2019-03-22'),
('RE008','GW004','1','2019-04-24','2019-04-29'),
('RE008','GW008','4','2019-04-24','2019-04-29'),
('RE009','GW011','1','2019-05-16','2019-05-18'),
('RE010','GW012','3','2019-05-21','2019-05-25'),
('RE011','GW002','4','2019-06-29','2019-07-03'),
('RE011','GW011','2','2019-06-29','2019-07-03'),
('RE012','GW013','1','2019-08-08','2019-08-11'),
('RE013','GW014','2','2019-09-16','2019-09-20'),
('RE014','GW005','3','2019-12-15','2019-12-20'),
('RE014','GW010','1','2019-12-15','2019-12-20'),
('RE015','GW004','1','2019-12-27','2019-12-28')
GO