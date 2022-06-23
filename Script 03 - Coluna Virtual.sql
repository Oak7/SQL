/* Script 03 - Coluna Virtual */
use VentoNorte
go
--
select 
	Nome_CLI as Cliente,
	Fone_CLI as Telefone,
	Pais_CLI as País,
	'Pessoa Jurídica' as Tipo
from
	Cliente
order by 1
--
select 
	Nome_CLI as Cliente,
	LEN(Nome_CLI) as Comprimento
from
	Cliente
order by 2 desc, 1
--
select 
	UPPER(Nome_CLI) as Cliente
from
	Cliente
order by 1
--
select * from Funcionario
--
select
	Nome_FUNC + ' ' + Sobrenome_FUNC as Funcionário,
	Cargo_Func as Cargo
from 
	Funcionario
order by 1
--
/* Produto, Preço de Custo, Estoque, Valor em Estoque */
select * from Produto
--
select
	Nome_PROD as Produto,
	Preco_PROD as [Preço de Custo],
	Estoque_PROD as Estoque,
	Preco_PROD * Estoque_PROD as [Valor em Estoque]	
from 
	Produto
order by 1
--
select
	Nome_PROD as Produto,
	Preco_PROD as [Preço de Custo],
	Estoque_PROD as Estoque,
	[Valor em Estoque] = Preco_PROD * Estoque_PROD 	
from 
	Produto
order by 1
--
/* Produto, Preço de Venda (preço acrescido de 20%) */
select 
	Nome_PROD as Produto,
	Preco_PROD + Preco_PROD * 0.2 as [Preço de Venda],
	Preco_PROD * 1.2 as [Preço de Venda]
from
	Produto
order by 1
--
/*  Pedido, Código Produto, preço, quantidade,
	VALOR BRUTO, % desconto, VALOR LÍQUIDO */
select * from DetalhesDoPedido
--
/* Acréscimo de % VALOR * (1 + %)
   Desconto de % VALOR * (1 - %) */
select
	Numero_PED as Pedido,
	Cod_PROD as [Código do Produto],
	Preco_DET as [Preço de Venda],
	Quantidade_DET as QT,
	Preco_DET * Quantidade_DET as [Valor Bruto],
	Desconto_DET as [Desc],
	[Valor Líquido] = Preco_DET * Quantidade_DET * 
					  (1 - Desconto_DET)
from
	DetalhesDoPedido
--
/* ISNULL */
select 
	Nome_CLI as Cliente,
	isnull(Regiao_CLI,'') as UF
from
	Cliente
--
/* CASE / END */
select 
	Nome_PROD as Produto,
	case Descontinuado_PROD
		when 0 then 'Em linha' else 'Fora de linha'
	end as [Status]
from 
	Produto
--
select 
	Nome_PROD as Produto,
	Estoque_prod as Estoque,
	NivelDeReposicao_PROD as 'Ponto de Encomenda',
	case
		when Estoque_PROD > NivelDeReposicao_PROD 
			then 'OK'
		when Estoque_PROD < NivelDeReposicao_PROD 
			then 'REPÔR'
			else 'CRÍTICO'
	end as [Status]
from 
	Produto





