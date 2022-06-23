/* Script 14 - View */
use VentoNorte
go
--
/* View é um atalho para um select */
go
create view vClientesDoBrasil
as
select 
	Nome_CLI as Cliente,
	Fone_CLI as Telefone,
	Pais_CLI as País
from
	Cliente
where Pais_CLI = 'Brasil'
--order by 1
go
--
select * from vClientesDoBrasil
--
/* Pedido, Produto, Fornecedor, Categoria 
para a categoria Frutos do Mar */
go
create view vRelatorioFrutosDoMar
as
select 
	pe.Numero_PED as Pedido,
	pr.Nome_PROD as Produto,
	f.Nome_FOR as Fornecedor,
	c.Nome_CAT as Categoria
from	
	Pedido as pe 
		join DetalhesDoPedido as d on
			pe.Numero_PED = d.Numero_PED
		join Produto as pr on
			pr.Cod_PROD = d.Cod_PROD
		join Categoria as c on
			c.Cod_CAT = pr.Cod_CAT
		join Fornecedor as f on
			f.Cod_FOR = pr.Cod_FOR
where 
	c.Nome_CAT = 'Frutos do Mar'
--order by 1
go
--
select * from vRelatorioFrutosDoMar
--
select distinct Produto 
from vRelatorioFrutosDoMar
order by 1
--
select name from sys.objects
where type ='v'
--
exec sp_helptext vRelatorioFrutosDoMar
--