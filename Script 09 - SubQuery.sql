/* Script 09 - SubQuery */
use Empresa
go
--
/* Cargo que tem funcionário */
select * from Cargo
where 
	Codigo_cargo in(select Codigo_cargo
					from Funcionario)
--
/* Cargo que NÃO tem funcionário */
select * from Cargo
where 
	Codigo_cargo not in(select Codigo_cargo
					    from Funcionario)
--
/* Funcionario que tem dependente */
select * from Funcionario
where 
	Codigo_func in(select Codigo_func
				   from Dependente)
--
/* Funcionario que não tem dependente */
select * from Funcionario
where 
	Codigo_func not in(select Codigo_func
					   from Dependente)
--
/* Cargo que tem funcionario 
	que tem dependente */
select * from Cargo
where Codigo_cargo 
	  in(select Codigo_cargo
		 from Funcionario
		 where Codigo_func 
			  in (select Codigo_func
			      from Dependente))
--
/* Cargo que tem funcionario 
	que não tem dependente */
select * from Cargo
where Codigo_cargo 
	  in(select Codigo_cargo
		 from Funcionario
		 where Codigo_func 
			  not in (select Codigo_func
			          from Dependente))
--
/* funcionario que recebem o maior salario */
select * from Funcionario
where 
	Salario_func = (select max(salario_func)
	                from Funcionario)
--
/* funcionario que recebem o menor salario */
select * from Funcionario
where 
	Salario_func = (select min(salario_func)
	                from Funcionario)
--
/* funcionario que recebem 
	salario acima da média salarial */
select * from Funcionario
where 
	Salario_func > (select avg(salario_func)
	                from Funcionario)
--
/* SubQuery Correlacionada */
select *, (select count(*) 
		   from Funcionario
		   where 
		   Codigo_cargo = Cargo.Codigo_cargo)
from Cargo
--

/* Banco VentoNorte */
use VentoNorte
go
--
/* Cliente que não tem pedido */
select 
	Nome_CLI as Cliente
from Cliente
where Cod_CLI not in(select Cod_CLI
                     from Pedido)
--
/* Contagem de pedidos por cliente */
select 
	Nome_CLI as Cliente,
	Contagem = (select count(*) from Pedido
	            where 
				Cod_CLI = Cliente.Cod_CLI)
from
	Cliente
--
/* Contagem de produtos por fornecedor */
select 
	Nome_FOR as Fornecedor,
	Contagem = (select count(*)
				from Produto
				where 
				Cod_FOR = Fornecedor.Cod_FOR)
from 
	Fornecedor
--
/* Produtos com o maior preço */
select 
	Nome_PROD as Produto
from 
	Produto
where Preco_PROD = (select max(preco_prod)
					from Produto)
--
/* Produtos com estoque acima 
	do estoque médio */
select 
	Nome_PROD as Produto,
	Estoque_PROD as Estoque
from 
	Produto
where estoque_prod>=(select avg(estoque_prod)
					from Produto)
order by 2
--
/* Cliente que comprou Frutos do Mar */
select distinct
	Cliente.Nome_cli as Cliente
from
	Cliente  
		join Pedido on
			Cliente.Cod_CLI = Pedido .Cod_CLI
		join DetalhesDoPedido on
			Pedido.Numero_PED = DetalhesDoPedido.Numero_PED
		join Produto on 
			Produto.Cod_PROD = DetalhesDoPedido.Cod_PROD
		join Categoria on
			Categoria.Cod_CAT = Produto.Cod_CAT
where 
	Categoria.Nome_CAT = 'Frutos do Mar'
order by 1
--

/* Cliente que não comprou Frutos do Mar */
select
	Nome_CLI as Cliente
from
	Cliente
where 
	Cod_CLI not in(select Cliente.Cod_CLI
					from
						Cliente  
							join Pedido on
								Cliente.Cod_CLI = Pedido .Cod_CLI
							join DetalhesDoPedido on
								Pedido.Numero_PED = DetalhesDoPedido.Numero_PED
							join Produto on 
								Produto.Cod_PROD = DetalhesDoPedido.Cod_PROD
							join Categoria on
								Categoria.Cod_CAT = Produto.Cod_CAT
					where 
						Categoria.Nome_CAT = 'Frutos do Mar')
--
/* Vendedor que não vendeu em abril/97 */
select 
	Vendedor = Nome_FUNC + ' ' + Sobrenome_FUNC 
from	
	Funcionario
where 
	Cod_FUNC not in(select Cod_FUNC 
					from Pedido
					where DataPedido_PED
					 between '04/01/97' and '04/30/97')
--
