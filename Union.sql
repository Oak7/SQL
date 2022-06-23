use VentoNorte

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
			inclusive as repetições */

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

