/* Script 15 - Stored Procedures */
use VentoNorte
go
--
/* Listar Clientes */
go
create procedure pCliente_SEL_Todos
as
select * from Cliente order by 2
go
--
exec pCliente_SEL_Todos
--
/* Clientes por País */
go
create procedure pCliente_SEL_PorPais
	@pais varchar(25)
as
select 
	Nome_CLI as Cliente,
	NomeContato_CLI as Contato,
	Fone_CLI as Telefone,
	Pais_CLI as País
from Cliente 
where Pais_CLI like @pais + '%'
order by 2
go
--
exec pCliente_SEL_PorPais 'canadá'
exec pCliente_SEL_PorPais 'brasil'
exec pCliente_SEL_PorPais 'a'
-- Alterar a procedure
go
alter procedure pCliente_SEL_PorPais
	@pais varchar(25)
as
select 
	Nome_CLI as Cliente,
	NomeContato_CLI as Contato,
	Fone_CLI as Telefone,
	Pais_CLI as País
from Cliente 
where Pais_CLI like @pais + '%'
order by 1
go
--
exec pCliente_SEL_PorPais 'a'
--
/* Inserir transportadora */
go
create procedure pTransportadora_INS
	@codigo int,
	@nome varchar(40),
	@telefone varchar(15)
as
insert into 
	Transportadora(Cod_TRA, Nome_TRA, Fone_TRA)
values(
	@codigo, upper(@nome),@telefone)
go
--
exec pTransportadora_INS 4,'Vai e Volta','999887766'
--
select * from Transportadora
--
go
create procedure pTransportadora_UPD_PorCodigo
	@codigo int,
	@nome varchar(40),
	@telefone varchar(15)
as
update Transportadora
set Nome_TRA = upper(@nome),
	Fone_TRA = @telefone
where Cod_TRA = @codigo
go
--
exec pTransportadora_UPD_PorCodigo
	4, 'Vai e Volta LTDA','(011) 99988-7766'
--
select * from Transportadora
--
go
create procedure pTransportadora_DEL_PorCodigo
	@codigo int
as
delete Transportadora
from Transportadora
where Cod_TRA = @codigo
go
--
exec pTransportadora_DEL_PorCodigo 4
--
select * from Transportadora
--
select * from sys.objects
where type = 'p'
--
select * from sys.objects
where type = 'pk'
--


	

