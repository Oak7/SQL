/* Script 08 - Union */
use VentoNorte
go
--
/* Regras da Union 
* Todos os SELECTs devem ter o mesmo nº de 
	colunas
* As colunas devem ser do mesmo tipo de dado
	respectivamente entre os SELECTs
* O Alias é dado no primeiro SELECT
* A ordenação é dada no último SELECT
* Claúsula FROM cada select tem a sua
* Cláusula WHERE cada select tem a sua

obs.: 
UNION - suprime repetições (faz distinct)
UNION ALL - Retorna todos os registros 
			inclusive as repetições
*/

select 
	Nome_CLI as Empresa,
	NomeContato_CLI as Contato,
	Pais_CLI as País,
	'Cliente' as Tipo
from 
	Cliente
where 
	Pais_CLI = 'brasil'
union
select 
	Nome_FOR,
	NomeContato_FOR,
	Pais_FOR,
	'Fornecedor'
from 
	Fornecedor
order by 1
--
/* Union All entre Previstos e Realizados */
/* Empresa / CNPJ */
select
	Empresa as Empresa,
	Cnpj as CNPJ
from Previstos
union
select
	Empresa,
	Cnpj
from Realizados
--
select
	Empresa as Empresa,
	Cnpj as CNPJ
from Previstos
union all
select
	Empresa,
	Cnpj
from Realizados
--
/* MISSÃO: Empresa | CNPJ | Status */
select
	p.Empresa as Empresa,
	p.Cnpj as CNPJ,
	'Previsto e Realizado' as [Status]
from
	Previstos as p inner join Realizados as r on
		p.Cnpj = r.Cnpj
UNION
select
	p.Empresa,
	p.Cnpj,
	'Previsto e Não Realizado'
from
	Previstos as p left join Realizados as r on
		p.Cnpj = r.Cnpj
where 
	r.Cnpj IS NULL
UNION
select
	r.Empresa,
	r.Cnpj,
	'Realizado e Não Previsto'
from
	Previstos as p right join Realizados as r on
		p.Cnpj = r.Cnpj
where 
	p.Cnpj IS NULL
--


