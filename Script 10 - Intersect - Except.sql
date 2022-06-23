/* Script 10 - Intersect - Except */
use VentoNorte
go
--
/* Funcionario que emitiu pedido em abril/97 */
select Cod_FUNC from Funcionario
intersect
select Cod_FUNC from Pedido
where DataPedido_PED 
		between '04/01/97' and '04/30/97'
--
/* Funcionario que não emitiu pedido em abril/97 */
select Cod_FUNC from Funcionario
except
select Cod_FUNC from Pedido
where DataPedido_PED 
		between '04/01/97' and '04/30/97'
--

