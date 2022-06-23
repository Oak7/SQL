/* Script 07 - Sumarização */
use VentoNorte
go
--
/* Funções de agregação */
--
/* COUNT */
select count(nome_cli) from Cliente

/* COUNT NÃO CONTA NULOS */
select count(Regiao_CLI) from Cliente

/* CONTE REGISTROS */
select count(*) from Cliente
--

/* SUM / AVG / MAX / MIN */

/* SUM */
select sum(frete_ped) from Pedido

/* AVG */
select avg(frete_ped) from Pedido

/* MAX */
select max(frete_ped) from Pedido

/* MIN */
select min(frete_ped) from Pedido

/* Quem não está agregando 
	OBRIGATORIAMENTE deverá 
	estar agrupando */

/* GROUP BY */
/* Quantos clientes por país */
select
	Pais_CLI,
	count(Nome_CLI) as Contagem
from
	Cliente 
group by Pais_CLI
--
/* Valor do pedido */
select 
	Numero_PED as Pedido,
	sum(Preco_DET * Quantidade_DET) 
		as [Valor Bruto]
from 
	DetalhesDoPedido
group by 
	Numero_PED
--
/* Valor bruto, desconto médio, valor líquido
de cada pedido */
select 
	Numero_PED as Pedido,
	[Valor Bruto] = 
		sum(Preco_DET * Quantidade_DET),
	[Desconto Médio] = 
		avg(Desconto_DET),
	[Valor Líquido] = 
		sum(Preco_DET * Quantidade_DET * 
			(1 - Desconto_DET))		 
from 
	DetalhesDoPedido
group by 
	Numero_PED
--
/* Quantos produtos por categoria */
select
	Categoria.Nome_CAT as Categoria,
	count(Produto.Nome_PROD) as Contagem
from	
	Categoria join Produto on
		Categoria.Cod_CAT = Produto.Cod_CAT
group by 
	Categoria.Nome_CAT
--
/* Valores em estoque por categoria */
select
	Categoria.Nome_CAT as Categoria,
	[Valor em Estoque] = 
	sum(Produto.Preco_PROD *
		Produto.Estoque_PROD) 
from	
	Categoria join Produto on
		Categoria.Cod_CAT = Produto.Cod_CAT
group by 
	Categoria.Nome_CAT
--
/* Quantos pedidos por cliente no 
	mês de abril/97 */
select
	Cliente.Nome_CLI as Cliente,
	Contagem = count(Pedido.Numero_PED)
from
	cliente join Pedido on
		Cliente.Cod_CLI = Pedido.Cod_CLI
where 
	Pedido.DataPedido_PED 
		between '04/01/97' and '04/30/97'
group by 
	Cliente.Nome_CLI
--
/* Quanto cada cliente gastou com frete 
	no primeiro tri/97 */
select
	Cliente.Nome_CLI as Cliente,
	[Total em Fretes] = sum(Frete_PED)
from
	cliente join Pedido on
		Cliente.Cod_CLI = Pedido.Cod_CLI
where 
	Pedido.DataPedido_PED 
		between '01/01/97' and '03/31/97'
group by 
	Cliente.Nome_CLI
--
/* Tempo médio de entrega por transportadora 
no primeiro tri/97 */
select
	t.Nome_TRA as Transportadora,
	[Tempo Médio] =
		avg(DATEDIFF(dd, p.DataPedido_PED,
					     p.DataEntrega_PED))
from 
	Transportadora as t join Pedido as p on
		t.Cod_TRA = p.Via_TRA
where 
	p.DataPedido_PED 
		between '01/01/97' and '03/31/97'
group by 
	t.Nome_TRA
--
/* Tempo médio de entrega por transportadora, 
por país no primeiro tri/97 */
select
	c.Pais_CLI as País,
	t.Nome_TRA as Transportadora,
	[Tempo Médio] =
		avg(DATEDIFF(dd, p.DataPedido_PED,
					     p.DataEntrega_PED))
from 
	Transportadora as t 
		join Pedido as p on 
			t.Cod_TRA = p.Via_TRA
		join Cliente as c on
			c.Cod_CLI = p.Cod_CLI
where 
	p.DataPedido_PED 
		between '01/01/97' and '03/31/97'
group by 
	t.Nome_TRA,
	c.Pais_CLI
--
/* Total bruto vendido por funcionario */
select
	Vendedor = 
		f.Nome_FUNC + ' ' + f.Sobrenome_FUNC,
	[Total Bruto] = 
		sum(d.Preco_DET * d.Quantidade_DET)
from
	Funcionario as f 
		join Pedido as p on
			f.Cod_FUNC = p.Cod_FUNC
		join DetalhesDoPedido as d on
			p.Numero_PED = d.Numero_PED
group by 
	f.Nome_FUNC + ' ' + f.Sobrenome_FUNC
order by 2 desc
--
/* Total bruto vendido por funcionario 
	a partir de 200000 */
select
	Vendedor = 
		f.Nome_FUNC + ' ' + f.Sobrenome_FUNC,
	[Total Bruto] = 
		sum(d.Preco_DET * d.Quantidade_DET)
from
	Funcionario as f 
		join Pedido as p on
			f.Cod_FUNC = p.Cod_FUNC
		join DetalhesDoPedido as d on
			p.Numero_PED = d.Numero_PED
group by 
	f.Nome_FUNC + ' ' + f.Sobrenome_FUNC
having 
	sum(d.Preco_DET * 
		d.Quantidade_DET) >= 200000
order by 2 desc
--
select
	Vendedor = 
		f.Nome_FUNC + ' ' + f.Sobrenome_FUNC,
	[Total Bruto] = 
		sum(d.Preco_DET * d.Quantidade_DET)
		--, count(p.Numero_PED)
from
	Funcionario as f 
		join Pedido as p on
			f.Cod_FUNC = p.Cod_FUNC
		join DetalhesDoPedido as d on
			p.Numero_PED = d.Numero_PED
group by 
	f.Nome_FUNC + ' ' + f.Sobrenome_FUNC
having 
	count(p.Numero_PED) >= 250
order by 2 desc
--


