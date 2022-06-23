/* Script 06 - Associações (JOIN) */
use VentoNorte
go
--
/* Produtos por Categoria */
select 
	Categoria.Nome_CAT,
	Produto.Nome_Prod
from 
	Categoria inner join Produto on
		Categoria.Cod_CAT = Produto.Cod_CAT
order by 1,2
--
/* Pedidos por cliente - 
	Cliente/Pedido/Emissão */
select 
	Cliente.Nome_CLI as Cliente,
	Pedido.Numero_PED as Pedido,
	Pedido.DataPedido_PED as Emissão
from
	Cliente inner join pedido on
		Cliente.Cod_CLI = Pedido.Cod_CLI
order by 1,2
---
/* Pedido, Emissão, Transportadora 
	dos pedidos emitidos em abril/97 */
select
	Pedido.Numero_PED as Pedido,
	Pedido.DataPedido_PED as Emissão,
	Transportadora.Nome_TRA as Transportadora
from	
	Transportadora join Pedido on
		Transportadora.Cod_TRA =
		Pedido.Via_Tra
where 
	Pedido.DataPedido_PED 
		between '04/01/97' and '04/30/97'
order by 1
--
/* Nome completo do vendedor, 
	pedido, emissão */
select
	Funcionario.Nome_FUNC + ' ' +
	Funcionario.Sobrenome_FUNC as Vendedor,
	Pedido.Numero_PED as Pedido,
	Pedido.DataPedido_PED as Emissão
from 
	Funcionario join Pedido on
		Funcionario.Cod_FUNC =
		Pedido.Cod_FUNC
order by 1, 2
--
/* Fornecedor, produto, categoria */
select	
	Fornecedor.Nome_FOR as Fornecedor,
	Produto.Nome_PROD as Produto,
	Categoria.Nome_CAT as Categoria
from 
	Categoria join Produto on 
		Categoria.Cod_CAT = Produto.Cod_CAT
			  join Fornecedor on
		Fornecedor.Cod_FOR = Produto.Cod_FOR
order  by 1,2
--
/* Pedido, emissão, cliente, transportadora */
select 
	Pedido.Numero_PED as Pedido,
	Pedido.DataPedido_PED as Emissão,
	Cliente.Nome_CLI as Cliente,
	Transportadora.Nome_TRA as Transportadora
from
	Cliente join Pedido on
		Cliente.Cod_CLI = Pedido.Cod_CLI
			join Transportadora on
		Transportadora.Cod_TRA =
		Pedido.Via_TRA
order by 1
--
select
	P.Numero_PED as Pedido,
	P.DataPedido_PED as Emissão,
	C.Nome_CLI as Cliente,
	T.Nome_TRA as Transportadora
from 
	Cliente as C join Pedido as P on
		C.Cod_CLI = P.Cod_CLI
				 join Transportadora as t on
		t.Cod_TRA = p.Via_TRA
order by 1,2
--
/* nome completo do vendedor, pedido, emissão,
	tempo em dias que demorou para 
	ser entregue, transportadora */
select
	f.Nome_FUNC + ' ' + 
	f.Sobrenome_FUNC as Vendedor,
	p.Numero_PED as Pedido,
	p.DataPedido_PED as Emissão,
	datediff(dd,p.DataPedido_PED,
				p.DataEntrega_PED) as Tempo,
	t.Nome_TRA as Transportadora
from
	Funcionario as f 
			join Pedido as p on
		f.Cod_FUNC = p.Cod_FUNC
			join Transportadora as t on
		t.Cod_TRA = p.Via_TRA
order by 1,2
--
/* pedido, emissão, produto, preço da venda,
quantidade da venda, valor bruto, desconto, 
valor líquido para o mês de abril/97 */
select
	pe.Numero_PED as Pedido,
	pe.DataPedido_PED as Emissão,
	pr.Nome_PROD as Produto,
	d.Preco_DET as Preço,
	d.Quantidade_DET as Qtde,
	d.Preco_DET*d.Quantidade_DET as [Valor Bruto],
	d.Desconto_DET as [Desc],
	d.Preco_DET*d.Quantidade_DET*
	(1-d.Desconto_DET) as [Valor Líquido]
from 
	Produto as pr 
		join DetalhesDoPedido as d on
			pr.Cod_PROD = d.Cod_PROD
		join Pedido as pe on
			pe.Numero_PED = d.Numero_PED
where 
	pe.DataPedido_PED
		between '04/01/97' and '04/30/97'	
order by 1
--	
/* cliente, pedido, emissão, 
	vendedor, transportadora 
	para os clientes que começam por G */
select
	c.Nome_CLI as Cliente,
	p.Numero_PED as Pedido,
	p.DataPedido_PED as Emissão,
	f.Nome_FUNC + ' ' + 
	f.Sobrenome_FUNC as Vendedor,
	t.Nome_TRA as Transportadora
from
	Cliente as c 
		join Pedido as p on
			c.Cod_CLI = p.Cod_CLI
		join Funcionario as f on
			f.Cod_FUNC = p.Cod_FUNC
		join Transportadora as t on
			t.Cod_TRA = p.Via_TRA
where 
	c.Nome_CLI like 'g%'
order by 1,2
--
/* Pedido, Produto, Fornecedor, Categoria 
para a categoria Frutos do Mar */
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
order by 1
--
/* Cliente que comprou Frutos do Mar */
select distinct
	c.Nome_cli as Cliente
from
	Cliente as c 
		join Pedido as p on
			c.Cod_CLI = p.Cod_CLI
		join DetalhesDoPedido as d on
			p.Numero_PED = d.Numero_PED
		join Produto as pr on 
			pr.Cod_PROD = d.Cod_PROD
		join Categoria as ct on
			ct.Cod_CAT = pr.Cod_CAT
where 
	ct.Nome_CAT = 'Frutos do Mar'
order by 1
--
/* Supervisor e seus funcionários */
select
	s.Nome_FUNC as Supervisor,
	f.Nome_FUNC as Funcionário
from
	Funcionario as s join Funcionario as f on
		s.Cod_FUNC = f.Supervisor_FUNC
order by 1,2
--
create table Previstos
(
	Cnpj char(14),
	Empresa	varchar(40)
)
go
--------------------------------
insert Previstos values(
'11111111111111','Trecos S/A')
insert Previstos values(
'22222222222222','Madeireira Pedra Nova')
insert Previstos values(
'333333333333','Central dos Tecidos')
----------------------------------
select * from Previstos
----------------------------------
create table Realizados
(
	Cnpj char(14),
	Empresa	varchar(40)
)
go
---------------------------------
insert Realizados values(
'11111111111111','Trecos S/A')
insert Realizados values(
'44444444444444','Supermercado O Bonzão')
---------------------------------
select * from Previstos
select * from Realizados
--
/* Clientes previstos e realizados */
select 
	p.Empresa as Previsto,
	r.Empresa as Realizado
from
	Previstos as p inner join realizados as r on
		p.Cnpj = r.Cnpj
--
/* Clientes previstos e NÃO realizados */
select
	Previstos.Empresa as Previsto,
	Realizados.Empresa as Realizado
from
	Previstos left join Realizados on
		Previstos.Cnpj = Realizados.Cnpj
where 
	Realizados.Cnpj is null
--
/* Clientes NÃO previstos e realizados */
select
	Previstos.Empresa as Previsto,
	Realizados.Empresa as Realizado
from
	Previstos right join Realizados on
		Previstos.Cnpj = Realizados.Cnpj
where 
	Previstos.Cnpj is null
--
/* Todos dos dois lados */
select
	Previstos.Empresa as Previsto,
	Realizados.Empresa as Realizado
from
	Previstos full join Realizados on
		Previstos.Cnpj = Realizados.Cnpj
--
/* Previstos não realizados e os 
realizados não previstos */
select
	Previstos.Empresa as Previsto,
	Realizados.Empresa as Realizado
from
	Previstos full join Realizados on
		Previstos.Cnpj = Realizados.Cnpj
where 
	Previstos.Cnpj is null
	or
	Realizados.Cnpj is null
--
/* Todos contra todos */
select
	Previstos.Empresa as Previsto,
	Realizados.Empresa as Realizado
from
	Previstos cross join Realizados
where 
	Previstos.Cnpj<>Realizados.Cnpj
--
/* Categoria que não tem produto */
select
	Categoria.Nome_CAT as Categoria,
	Produto.*
from 
	Categoria left join Produto on
		Categoria.Cod_CAT = Produto.Cod_CAT
where
	Produto.Cod_CAT is null
--
/* Cliente que não fez pedido */
select 
	Nome_CLI as Cliente,
	Pedido.*
from 
	Cliente left join Pedido on
		Cliente.Cod_CLI = Pedido.Cod_CLI
where
	Pedido.Cod_CLI is null
--
/* UPDATE / DELETE */
/* Aumentar em 10 o preço dos produtos
	da categoria Condimentos - 12 linhas */
select
	Produto.Nome_PROD,
	Produto.Preco_PROD as Atual,
	Produto.Preco_PROD + 10
from
	Categoria join Produto on
		Categoria.Cod_CAT = Produto.Cod_CAT
where
	Categoria.Nome_CAT = 'Condimentos'
--
update Produto
set Preco_PROD = Preco_PROD + 10
from
	Categoria join Produto on
		Categoria.Cod_CAT = Produto.Cod_CAT
where 
	Categoria.Nome_CAT = 'Condimentos'
--
/* Excluir as categorias que não tem produto */
select
	Categoria.Nome_CAT as Categoria,
	Produto.*
from 
	Categoria left join Produto on
		Categoria.Cod_CAT = Produto.Cod_CAT
where
	Produto.Cod_CAT is null
--
delete Categoria
from 
	Categoria left join Produto on
		Categoria.Cod_CAT = Produto.Cod_CAT
where
	Produto.Cod_CAT is null
--