/* Script 13 - Transação */
use VentoNorte
go
--
begin transaction
update Produto
set Preco_PROD = 
	Preco_PROD + 100

--if @@Error<>0
--	rollback transaction

update Produto
set Estoque_PROD = 
	Estoque_PROD + 500

--if @@Error<>0
--	rollback transaction

--commit transaction
--
commit transaction
--
rollback transaction
--
select * from Produto
--
select @@trancount
--

