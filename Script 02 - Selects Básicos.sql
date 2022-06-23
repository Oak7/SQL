/* Script 02 - Selects Básicos */
use VentoNorte
go
--------------------------------------------------------------
/* Selecionar todas as colunas e 
	todos os registros da tabela Cliente */
select * from Cliente
--------------------------------------------------------------
/* Selecionar algumas colunas e 
	todos os registros da tabela Cliente */
select 
	Nome_CLI, 
	NomeContato_CLI, 
	Fone_CLI, 
	Pais_CLI 
from 
	Cliente
----------------------------------------------------------------

/* Selecionar algumas colunas 
	com rótulos (Álias) diferentes
	todos os registros da tabela Cliente */
select 
	Nome_CLI as Cliente, 
	NomeContato_CLI as Contato, 
	Fone_CLI Telefone, 
	País = Pais_CLI 
from 
	Cliente
--------------------------------------------------------------
select 
	Nome_CLI as [Nome do Cliente], 
	NomeContato_CLI as 'Nome do Contato', 
	Fone_CLI Telefone, 
	País = Pais_CLI 
from 
	Cliente
--------------------------------------------------------------

/* Ordenação */
select 
	Nome_CLI as Cliente, 
	NomeContato_CLI as Contato, 
	Fone_CLI Telefone, 
	País = Pais_CLI 
from 
	Cliente
order by 2 -- ordena por nome do Contato
--- order by 4
--order by País
--order by Pais_CLI
--repare que são 3 maneiras diferentes de ordenar por País
---------------------------------------------------------
select 
	Nome_CLI as Cliente, 
	NomeContato_CLI as Contato, 
	Fone_CLI Telefone, 
	País = Pais_CLI 
from 
	Cliente
order by 4 desc, 1
------------------------------------------------
select 
	Nome_CLI as Cliente, 
	NomeContato_CLI as Contato, 
	Fone_CLI Telefone, 
	País = Pais_CLI 
from 
	Cliente
order by 4, 1
-------------------------------------------------

/* Distinção de REGISTRO */
select distinct
	pais_cli 
from 
	Cliente 
--order by 1
--------------------------------------------------
select distinct
	Pais_CLI ,
	Cidade_CLI
from 
	Cliente 
order by 1,2
--------------------------------------------------

select * from Produto order by Estoque_PROD desc
--------------------------------------------------
/* TOP /  */
select top 3
	Nome_PROD as Produto,
	Estoque_PROD as Estoque
from 
	Produto 
order by 
	Estoque_PROD desc
----------------------------------------------------
select top 1 with ties
	Nome_PROD as Produto,
	Estoque_PROD as Estoque
from 
	Produto 
order by 
	Estoque_PROD desc
-----------------------------------------------------




