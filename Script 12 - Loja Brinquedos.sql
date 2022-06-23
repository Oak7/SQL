/* EXTRA - Loja Brinquedos */
USE master
GO
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
	Codigo_Brinq 	INT IDENTITY(1, 1),
	Nome_Brinq 		VARCHAR(50),
	Idade_Brinq 	TINYINT,
	Quantidade_Brinq INT,
	Valor_Brinq 	DECIMAL(10,2)
	
	constraint pk_Brinquedo primary key(Codigo_Brinq)
)
GO
-----------------------------------------------
INSERT   Brinquedo VALUES(
'Amiguinha',7,100,150.00)

INSERT   Brinquedo VALUES(
'Beb� Balancinho',3,200,30.00)

INSERT   Brinquedo VALUES(
'Beb� Chuverinho',3,50,25.00)

INSERT   Brinquedo VALUES(
'Bolinha de Sab�o',5,40,30.00)

INSERT   Brinquedo VALUES(
'Em�lia',2,70,60.00)

INSERT   Brinquedo VALUES(
'Hora de Pap�',1,50,50.00)

INSERT   Brinquedo VALUES(
'Frutinha Chaverinho',2,30,20.00)

INSERT   Brinquedo VALUES(
'Banco Imobili�rio',10,10,100.00)

INSERT   Brinquedo VALUES(
'Cai n�o Cai',3,15,35.00)

INSERT   Brinquedo VALUES(
'Cara a Cara',4,16,28.00)

INSERT   Brinquedo VALUES(
'Cilada',10,17,25.00)

INSERT   Brinquedo VALUES(
'Combate',7,19,40.00)

INSERT   Brinquedo VALUES(
'Detetive',7,20,50.00)

INSERT   Brinquedo VALUES(
'A Galinha Magricela',7,21,90.00)

INSERT   Brinquedo VALUES(
'Puxa Puxa Batatinha',2,22,150.00)

INSERT   Brinquedo VALUES(
'Rob� Baby',2,23,200.00)

INSERT   Brinquedo VALUES(
'Action Man',3,26,150.00)

INSERT   Brinquedo VALUES(
'Batcicle',5,30,180.00)

INSERT   Brinquedo VALUES(
'Batman',3,40,50.00)

INSERT   Brinquedo VALUES(
'Superman',4,50,50.00)

INSERT   Brinquedo VALUES(
'Maga Patal�gica',4,66,100.00)

INSERT   Brinquedo VALUES(
'Paty Gatinha',3,80,20.00)

INSERT   Brinquedo VALUES(
'Goleiro Maluco',5,92,20.00)

INSERT   Brinquedo VALUES(
'Bichinhos do Beb�',6,100,20.00)

INSERT   Brinquedo VALUES(
'Caixa-Encaixa',7,200,35.00)

INSERT   Brinquedo VALUES(
'Guitarrinha do Beb�',1,200,80.00)

INSERT   Brinquedo VALUES(
'Sr. e Sra. Cabe�a de Batata',6,300,150.00)

INSERT   Brinquedo VALUES(
'Ponteirinho', 4, 100, 50.00)

INSERT   Brinquedo VALUES(
'BateCar', 5, 200, 30.00)

INSERT   Brinquedo VALUES(
'CapotCar', 5, 200, 30.00)
GO
--------------------------------------------------------------------
SELECT * FROM BRINQUEDO
--
/* Aumentar em 10,00 reais o valor de
todos os brinquedos */
select
	Valor_Brinq as Atual,
	Valor_Brinq + 10 as [Valor Aumentado]
from Brinquedo

--
update Brinquedo
set Valor_Brinq = Valor_Brinq + 10
--from Brinquedo

--
select * from Brinquedo
--
/* Aumentar em 10% o valor de todos os 
brinquedos cujo nome come�a com C - 6 linhas */
select
	Nome_Brinq,
	Valor_Brinq as Atual,
	Valor_Brinq * 1.1 as  [Valor Aumentado]
from Brinquedo
where
	Nome_Brinq like 'c%'
--
update Brinquedo
set Valor_Brinq = Valor_Brinq * 1.1
where Nome_Brinq like 'c%'
--
select * from Brinquedo
where Nome_Brinq like 'c%'
--
/* Aumentar em 10 unidades a quantidade de todos 
os brinquedos cujo valor seja inferior a 50,00 
- 13 linhas */
select
Nome_Brinq,
	Valor_Brinq,
	Quantidade_Brinq,
	Quantidade_Brinq + 10
from Brinquedo
where Valor_Brinq < 50
--
update Brinquedo
set Quantidade_Brinq = Quantidade_Brinq + 10
where Valor_Brinq < 50
--
/* Diminuir em 1 ano a idade, aumentar em 20,00
 o valor de todos os brinquedos cujo nome
 contenha a palavra beb� - 4 linhas */
 select 
	Nome_Brinq,
	Idade_Brinq,
	Idade_Brinq - 1,
	Valor_Brinq,
	Valor_Brinq + 20
from Brinquedo
where Nome_Brinq like '%beb�%'
--
update Brinquedo
set Idade_Brinq = Idade_Brinq - 1,
    Valor_Brinq = Valor_Brinq + 20
where Nome_Brinq like '%beb�%'
--
/* Conceder um desconto de 10% no valor dos 
brinquedos cujo nome contenha a 
palavra batata ou batatinha - 2 linhas */ 

select 
	Nome_Brinq,
	Valor_Brinq,
	Valor_Brinq * 0.9
from Brinquedo	
where Nome_Brinq like '%batat[a,inha]%'
--
update Brinquedo
set Valor_Brinq = Valor_Brinq * 0.9
where Nome_Brinq like '%batat[a,inha]%'
--
/* Excluir os brinquedos cujo valor esteja na 
faixa de 100,00 a 150,00 (inclusive) - 6 linhas */
select 
	Valor_Brinq
from Brinquedo
where Valor_Brinq between 100 and 150
--
delete Brinquedo
--from Brinquedo
where Valor_Brinq between 100 and 150