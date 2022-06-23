/* Script - 01 */
/* CRIAR UM BANCO DE DADOS */
create database Coringao
go
--
/* USAR O BANCO DE DADOS */
use Coringao
--
/* CRIAR UMA TABELA */
create table Veiculo
(
	Placa char(7) primary key, 
	Modelo varchar(30) not null,
	Cor varchar(30) null,
	Ano smallint not null
)
go
--
select * from Veiculo
--
--INSERÇÃO POSICIONAL
insert into Veiculo values('ppp0808',
						   'Veraneio',
						   'Bege',
						   1972)

insert into Veiculo values('ttt5656',
						   'Audi TT',
						   'Prata',
						   2016)

insert into Veiculo values('ooo1212',
						   'Opala',
						   '',
						   1986)

insert into Veiculo values('ooo1414',
						   'Opala',
						   null,
						   1986)

insert into Veiculo values('ooo1616',
						   'Opala',
						   'null',
						   1986)
--
-- INSERÇÃO DECLARATIVA
insert into Veiculo(Modelo,Placa,Ano) 
values('Kombinationsfahrzeug', 'kkk2020',1986)

insert into Veiculo(Placa, modelo, cor,ano)
values('vvv1717','variant tl','verde oliva',1974)
--
select * from Veiculo
--
update Veiculo
set cor = 'Azul Marinho Metálico'
from Veiculo
where Placa = 'ttt5656'
--
delete Veiculo
from Veiculo
where Placa = 'ttt5656'
--
select * from Veiculo
--
--drop database Coringao