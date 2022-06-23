/* Script 05 - Locadora */
use master
go
--
if exists(select name from sys.databases
			where name = 'Locadora')
	drop database Locadora
go
--
create database Locadora
go
--
use Locadora
go
--
/* 
	0 - Casado
	1 - Solteiro
	2 - Viuvo
	3 - Amasiado
	4 - Outro
*/
/* Tabela Cliente */
create table Cliente
(
	Codigo_cli int not null identity,
	Nome_cli varchar(80) not null,
	CPF_cli char(11) not null,
	EstadoCivil_cli tinyint not null,

	constraint PK_Cliente primary key(Codigo_cli),
	constraint UQ_Cliente_CPF unique(CPF_cli),
	constraint CH_Cliente_EstadoCivil
			   check(EstadoCivil_cli in(0,1,2,3,4))
)
go
--
select * from Cliente
--
insert into Cliente values('Mirosmar','11111111111',0),
                          ('Uelton','22222222222',1),
						  ('Leovegildo','33333333333',2),
						  ('Givanete','44444444444',4),
						  ('Dathiele','55555555555',0)
go
--
select * from Cliente
--
insert into Cliente values('Bianor','666666',0)
--
select * from Cliente
--
/* Tabela Categoria */
create table Categoria
(
	Codigo_cat int not null identity 
		constraint PK_Categoria primary key,
	Nome_cat varchar(25) not null 
		constraint UQ_Categoria_Nome unique
)	
go
--
select * from Categoria
--
insert into Categoria values('Drama'),
							('Suspense'),
							('Comédia'),
							('Aventura'),
							('Ficção')
go
--
select * from Categoria
--
/* Tabela Filme */
create table Filme
(
	Codigo_fil int not null identity,
	Nome_fil varchar(55) not null,
	Codigo_cat int not null,

	constraint PK_Filme primary key(Codigo_fil),
	constraint FK_Filme_Categoria
				foreign key(Codigo_cat)
				references Categoria(Codigo_cat)
)
go
--
--select len('eu ainda sei o que voces fizeram no verao passado')
--
--drop table Categoria
--
insert into Filme values('Titanic',1),
						('Identidade',2),
						('Eu, eu mesmo e Irene',3),
						('Deby e Loyd',3)
go
--
select * from Filme
--
--delete categoria where Codigo_cat = 3
--delete categoria where Codigo_cat = 4
--
/* Tabela Locacao */
create table Locacao
(
	Codigo_loc int not null identity,
	Codigo_cli int not null,
	Retirada_loc smalldatetime 
		constraint DF_Locacao_Retirada 
		default getdate(),

	constraint PK_Locacao primary key(Codigo_loc),
	constraint FK_Locacao_Cliente
				foreign key(Codigo_cli)
				references Cliente(Codigo_cli)
)
go
---
select getdate()
select datediff(dd,'08/22/2003',getdate())
select datediff(dd,'01/21/2001',getdate())
---
select * from cliente
--
insert into Locacao values(5,'10/21/2016 08:39')
insert into Locacao values(3, default)
insert into Locacao(Codigo_cli) values(2)
--
select * from Locacao
--
/* Tabela DetalhesLocacao */
create table DetalhesLocacao
(
	Codigo_loc int not null,
	Codigo_fil int not null,
	Devolucao_det smalldatetime null,

	constraint FK_Detalhes_Locacao
				foreign key(Codigo_loc)
				references Locacao(Codigo_loc),
	constraint FK_Detalhes_Filme
				foreign key(Codigo_fil)
				references Filme(Codigo_fil),

	constraint PK_Detalhes 
				primary key(Codigo_loc, Codigo_fil)
)
go
--
select * from Locacao
select * from filme
--
insert into DetalhesLocacao values(1,4,null)
insert into DetalhesLocacao values(1,2,null)

insert into DetalhesLocacao
	(Codigo_loc, Codigo_fil) values(2, 1)
insert into DetalhesLocacao
	(Codigo_loc, Codigo_fil) values(2, 3)
--
select * from DetalhesLocacao
--

/* Devolvendo um filme */
update DetalhesLocacao
set Devolucao_det = getdate()
where Codigo_loc = 1
	  and 
	  Codigo_fil = 4
--
update DetalhesLocacao
set Devolucao_det = getdate()
where Codigo_loc = 2
	  and 
	  Codigo_fil = 3
--
select * from DetalhesLocacao
--
/* Alugar novamente */
insert into DetalhesLocacao
	(Codigo_loc, Codigo_fil) values(3, 3)
insert into DetalhesLocacao
	(Codigo_loc, Codigo_fil) values(3, 4)
--
select * from DetalhesLocacao
--
/* Quais filmes estão alugados */
select * from DetalhesLocacao
where Devolucao_det is null
--
select
	DetalhesLocacao.Codigo_loc as Locação,
	Filme.Nome_fil as Título
from
	Filme inner join DetalhesLocacao on
		Filme.Codigo_fil = DetalhesLocacao.Codigo_fil
where 
	DetalhesLocacao.Devolucao_det is null
--
/* Filmes por categoria */
select 
	Categoria.Nome_cat as Categoria,
	Filme.Nome_fil as Título
from 
	Categoria inner join Filme on
		Categoria.Codigo_cat = Filme.Codigo_cat
order by 1,2
---
/* Cliente, locação, data da locação */
select
	Cliente.Nome_cli as Cliente,
	Locacao.Codigo_loc as Locação,
	Locacao.Retirada_loc as [Data da Locação]
from
	Cliente inner join Locacao on
		Cliente.Codigo_cli = Locacao.Codigo_cli
order by 1,2
--
/* Cliente, Locação, Filme, retirada, devolução */
select 
	Cliente.Nome_cli as Cliente,
	Locacao.Codigo_loc as Locação,
	Filme.Nome_fil as Título,
	Locacao.Retirada_loc as Retirada,
	DetalhesLocacao.Devolucao_det as Devolução
from
	Cliente
		inner join Locacao on
			Cliente.Codigo_cli = Locacao.Codigo_cli
		inner join DetalhesLocacao on
			Locacao.Codigo_loc = DetalhesLocacao.Codigo_loc
		inner join Filme on
			Filme.Codigo_fil = DetalhesLocacao.Codigo_fil
where
	DetalhesLocacao.Devolucao_det is null
order by 1,3
---
/* nome do cliente que alugou comédia */
select distinct
	Cliente.Nome_cli as Cliente,
	Categoria.Nome_cat as Categoria
from
	Cliente
		inner join Locacao on
			Cliente.Codigo_cli = Locacao.Codigo_cli
		inner join DetalhesLocacao on
			Locacao.Codigo_loc = DetalhesLocacao.Codigo_loc
		inner join Filme on
			Filme.Codigo_fil = DetalhesLocacao.Codigo_fil
		inner join Categoria on
			Categoria.Codigo_cat = Filme.Codigo_cat
where
	Categoria.Nome_cat = 'comédia'
order by 1,2