/* Script 11 - Output */
use Empresa
go
--
/* 
 INSERTED - Copia os dados que serão inseridos
 DELETED -  Copia os dados que serão excluídos
 OUTPUT - Externa os dados contidos nas tabelas
		  Inserted / Deleted
*/
insert Cargo values('Desenvolvedor Pleno')
insert Cargo output inserted.* 
	values('Desenvolvedor Senior')
insert Cargo output inserted.* 
	values('Desenvolvedor Junior')
--
insert Funcionario output inserted.*
values('Joca',3,17500)
--
--
delete Funcionario output deleted.Nome_func
from Funcionario
where Codigo_func = 6
--