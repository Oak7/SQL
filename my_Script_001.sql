use master
Go
------------------------------------------------------------
IF EXISTS(
			SELECT NAME 
			FROM SYSDATABASES 
			WHERE NAME = 'Loja_Brinquedos')
	DROP DATABASE Loja_Brinquedos
-------------------------------------------------------------
CREATE DATABASE Loja_Brinquedos
GO
------------------------------------------------------
USE Loja_Brinquedos
GO
---------------------------
create TABLE Brinquedo
(
	Codigo_Brinq 	INT IDENTITY(10, 2),
	Nome_Brinq 		VARCHAR(50),
	Idade_Brinq 	TINYINT,
	Quantidade_Brinq INT,
	Valor_Brinq 	DECIMAL(10,2)
	
	constraint pk_Brinquedo primary key(Codigo_Brinq)
)
GO
---------------------------------------------------------
select*from Brinquedo
---------------------------------------------------------

INSERT   Brinquedo VALUES('Amiguinha',7,100,150.00)
select*from Brinquedo

INSERT   Brinquedo VALUES('Bebê Balancinho',3,200,30.00)
select*from Brinquedo

INSERT   Brinquedo VALUES('Bebê Chuverinho',3,50,25.00)
select*from Brinquedo

INSERT   Brinquedo VALUES('Bolinha de Sabão',5,40,30.00)
select*from Brinquedo

INSERT   Brinquedo VALUES('Emília',2,70,60.00)
select*from Brinquedo

INSERT   Brinquedo VALUES('Hora de Papá',1,50,50.00)
select*from Brinquedo

INSERT   Brinquedo VALUES('Frutinha Chaverinho',2,30,20.00)
select*from Brinquedo

INSERT   Brinquedo VALUES('Banco Imobiliário',10,10,100.00)
select*from Brinquedo

INSERT   Brinquedo VALUES('Cai não Cai',3,15,35.00)
select*from Brinquedo

INSERT   Brinquedo VALUES('Cara a Cara',4,16,28.00)
select*from Brinquedo

INSERT   Brinquedo VALUES('Cilada',10,17,25.00)
select*from Brinquedo

INSERT   Brinquedo VALUES('Combate',7,19,40.00)
select*from Brinquedo

INSERT   Brinquedo VALUES('Detetive',7,20,50.00)
select*from Brinquedo

INSERT   Brinquedo VALUES('A Galinha Magricela',7,21,90.00)
select*from Brinquedo

INSERT   Brinquedo VALUES('Puxa Puxa Batatinha',2,22,150.00)
select*from Brinquedo

INSERT   Brinquedo VALUES('Robô Baby',2,23,200.00)
select*from Brinquedo

INSERT   Brinquedo VALUES('Action Man',3,26,150.00)
select*from Brinquedo

INSERT   Brinquedo VALUES('Batcicle',5,30,180.00)
select*from Brinquedo

INSERT   Brinquedo VALUES('Batman',3,40,50.00)
select*from Brinquedo

INSERT   Brinquedo VALUES('Superman',4,50,50.00)
select*from Brinquedo

INSERT   Brinquedo VALUES('Maga Patalógica',4,66,100.00)
select*from Brinquedo

INSERT   Brinquedo VALUES('Paty Gatinha',3,80,20.00)
select*from Brinquedo

INSERT   Brinquedo VALUES('Goleiro Maluco',5,92,20.00)
select*from Brinquedo

INSERT   Brinquedo VALUES('Bichinhos do Bebê',6,100,20.00)
select*from Brinquedo

INSERT   Brinquedo VALUES('Caixa-Encaixa',7,200,35.00)
select*from Brinquedo

INSERT   Brinquedo VALUES('Guitarrinha do Bebê',1,200,80.00)
select*from Brinquedo

INSERT   Brinquedo VALUES('Sr. e Sra. Cabeça de Batata',6,300,150.00)
select*from Brinquedo

INSERT   Brinquedo VALUES('Ponteirinho', 4, 100, 50.00)
select*from Brinquedo

INSERT   Brinquedo VALUES('BateCar', 5, 200, 30.00)
select*from Brinquedo

INSERT   Brinquedo VALUES('CapotCar', 5, 200, 30.00)
select*from Brinquedo

INSERT   Brinquedo VALUES('Trenzinho', 5, 200, 130.00),
						('baby chorão', 5, 20, 180.00),
						('chapeuzinho vermelho', 5, 200, 1130.00)
						select*from Brinquedo
GO
------------------------------------------