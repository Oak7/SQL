/* Script 04 - Condicional WHERE */
use VentoNorte
go
-----
/* Clientes do Brasil */
select 
	Nome_CLI as Cliente,
	Pais_CLI as País
from	
	Cliente
where 
	Pais_CLI = 'brasil'
--
/* Clientes do brasil e clientes da alemanha */
select 
	Nome_CLI as Cliente,
	Pais_CLI as País
from	
	Cliente
where 
	Pais_CLI = 'brasil'
	or
	Pais_CLI = 'alemanha'
--
select 
	Nome_CLI as Cliente,
	Pais_CLI as País
from	
	Cliente
where 
	Pais_CLI in('brasil', 'alemanha')
--
/* Clientes NEIM brasil  NEIM alemanha */
select 
	Nome_CLI as Cliente,
	Pais_CLI as País
from	
	Cliente
where 
	Pais_CLI <> 'brasil'
	and
	Pais_CLI <> 'alemanha'
--
select 
	Nome_CLI as Cliente,
	Pais_CLI as País
from	
	Cliente
where 
	not (Pais_CLI = 'brasil'
	or
	Pais_CLI = 'alemanha')
--
select 
	Nome_CLI as Cliente,
	Pais_CLI as País
from	
	Cliente
where 
	Pais_CLI not in('brasil', 'alemanha')
--
/* Produto com estoque não ZERADO - 72 linhas */
select
	Nome_PROD as Produto,
	Estoque_PROD as Estoque
from 
	Produto
where
	Estoque_PROD > 0
order by 1
--
/* Produto com estoque não ZERADO com preço
 igual ou superior a 20 - 35 linhas */
select
	Nome_PROD as Produto,
	Estoque_PROD as Estoque
from 
	Produto
where
	Estoque_PROD > 0
	and
	Preco_PROD >= 20
order by 1
--
/* Produto com estoque não ZERADO, 
	não DESCONTINUADO - 68 linhas */
select
	Nome_PROD as Produto,
	Estoque_PROD as Estoque
from 
	Produto
where
	Estoque_PROD > 0
	and
	Descontinuado_PROD = 0
order by 1
----
/* Produto com estoque não ZERADO, 
	não DESCONTINUADO com preço na 
	faixa de 30 a 40 (inclusive)  - 11 linhas */
select
	Nome_PROD as Produto,
	Estoque_PROD as Estoque
from 
	Produto
where
	Estoque_PROD > 0
	and
	Descontinuado_PROD = 0
	and
	Preco_PROD >= 30 and Preco_PROD <= 40
order by 1
----
/* Produto com estoque não ZERADO, 
	não DESCONTINUADO com preço FORA da 
	faixa de 30 a 40 - 57 linhas */
select
	Nome_PROD as Produto,
	Estoque_PROD as Estoque
from 
	Produto
where
	Estoque_PROD > 0
	and
	Descontinuado_PROD = 0
	and
	(Preco_PROD < 30 or Preco_PROD > 40)
order by 1
----
select
	Nome_PROD as Produto,
	Estoque_PROD as Estoque
from 
	Produto
where
	Estoque_PROD > 0
	and
	Descontinuado_PROD = 0
	and
	not (Preco_PROD >= 30 and Preco_PROD <= 40)
order by 1
----
/* Produto com estoque não ZERADO com preço
 na faixa de 20 a 30 - 14 linhas */
select
	Nome_PROD as Produto,
	Estoque_PROD as Estoque
from 
	Produto
where
	Estoque_PROD > 0
	and
	Preco_PROD >= 20 and Preco_PROD <=30
order by 1
--
 select
	Nome_PROD as Produto,
	Estoque_PROD as Estoque
from 
	Produto
where
	Estoque_PROD > 0
	and
	Preco_PROD between 20 and 30
order by 1
--
/* Produto com estoque não ZERADO com preço
 fora da faixa de 20 a 30 - 58 linhas */
select
	Nome_PROD as Produto,
	Estoque_PROD as Estoque
from 
	Produto
where
	Estoque_PROD > 0
	and
	Preco_PROD not between 20 and 30
order by 1
/* Pedidos do mês de abril/97 - 
   (Pedido, Data do Pedido) */
select 
	Numero_PED as Pedido,
	DataPedido_PED as Emissão
from 
	Pedido
where
	DataPedido_PED >= '04/01/97'
	and
	DataPedido_PED >= '04/30/97'
order by 2
--
select 
	Numero_PED as Pedido,
	DataPedido_PED as Emissão
from 
	Pedido
where
	DataPedido_PED 
		between '04/01/97' and '04/30/97'
order by 2
--
select 
	Numero_PED as Pedido,
	DataPedido_PED as Emissão
from 
	Pedido
where
	month(DataPedido_PED) = 4
	and
	year(DataPedido_PED) =1997
order by 2
--
select 
	month(DataPedido_PED) as Mês,
	year(DataPedido_PED) as Ano,
	sum(Frete_PED) as Soma
from 
	Pedido
group by month(DataPedido_PED),
	year(DataPedido_PED)
order by 2,1
	
--
/* Clientes que começam com a letra G */
select
	Nome_CLI as Cliente
from
	Cliente
where
	Nome_CLI like 'g%'
--
select
	Nome_CLI as Cliente
from
	Cliente
where
	left(nome_cli, 1) = 'g'
--
select
	Nome_CLI as Cliente
from
	Cliente
where
	substring(nome_cli, 1, 1) = 'g'
--
/* Clientes que NÃO começam com a letra G */
select
	Nome_CLI as Cliente
from
	Cliente
where
	Nome_CLI not like 'g%'
--
/* Clientes que terminam com a letra G */
select
	Nome_CLI as Cliente
from
	Cliente
where
	Nome_CLI like '%g'
--
/* Clientes que NÃO terminam com a letra G */
select
	Nome_CLI as Cliente
from
	Cliente
where
	Nome_CLI not like '%g'
--
/* Clientes que contenham a letra G */
select
	Nome_CLI as Cliente
from
	Cliente
where
	Nome_CLI like '%g%'
--
/* Clientes que NÃO contenham a letra G */
select
	Nome_CLI as Cliente
from
	Cliente
where
	Nome_CLI not like '%g%'
--
/* Clientes que segunda letra seja Ó */
select
	Nome_CLI as Cliente
from
	Cliente
where
	Nome_CLI like '_Ó%'
--
select
	Nome_CLI as Cliente
from
	Cliente
where
	SUBSTRING(Nome_CLI,2,1) = 'Ó'
--
/* Clientes que segunda letra seja OÓÒÔ */
select
	Nome_CLI as Cliente
from
	Cliente
where
	Nome_CLI like '_[OÓÒÔ]%'
--
select
	Nome_CLI as Cliente
from
	Cliente
where
	substring(nome_cli,2,1) in('O','Ó','Ò','Ô')
--
/* Diferenciar maiúsculas de minúsculas */
select
	Nome_CLI as Cliente
from
	Cliente
where
	Nome_CLI 
	collate latin1_general_cs_as like 'A%'
--
select
	Nome_CLI as Cliente
from
	Cliente
where
	Nome_CLI 
	collate latin1_general_cs_as like 'a%'

/* CHARINDEX */
select substring(nome_cli,1,
(charindex(' ', nome_cli)-1))
from cliente
--
select substring(nome_cli, 
(charindex(' ', nome_cli) + 1), 200)
from cliente


