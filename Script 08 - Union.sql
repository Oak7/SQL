/* Script 08 - Union */
use VentoNorte
go
--
/* Regras da Union 
* Todos os SELECTs devem ter o mesmo n� de 
	colunas
* As colunas devem ser do mesmo tipo de dado
	respectivamente entre os SELECTs
* O Alias � dado no primeiro SELECT
* A ordena��o � dada no �ltimo SELECT
* Cla�sula FROM cada select tem a sua
* Cl�usula WHERE cada select tem a sua

obs.: 
UNION - suprime repeti��es (faz distinct)
UNION ALL - Retorna todos os registros 
			inclusive as repeti��es
*/

select 
	Nome_CLI as Empresa,
	NomeContato_CLI as Contato,
	Pais_CLI as Pa�s,
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
/* MISS�O: Empresa | CNPJ | Status */
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
	'Previsto e N�o Realizado'
from
	Previstos as p left join Realizados as r on
		p.Cnpj = r.Cnpj
where 
	r.Cnpj IS NULL
UNION
select
	r.Empresa,
	r.Cnpj,
	'Realizado e N�o Previsto'
from
	Previstos as p right join Realizados as r on
		p.Cnpj = r.Cnpj
where 
	p.Cnpj IS NULL
--


