/*Aqui defino primeiro todos como 1 na coluna em_atividade, depois disso escolhi dois que não usei nos insert de dados e indiquei como 0*/
ALTER TABLE medicos
ADD em_atividade bit default 1;

update medicos 
set em_atividade = 0
where id = 11 or id = 7;

/* Fazendo o update pelo id da internação*/
update internacao
set data_alta =
date_add(data_entrada, interval 3 day)
where id = 1;
update internacao
set data_alta =
date_add(data_alta, interval 10 hour)
where id = 1;

/* Fazendo o update pelo id do paciente*/
update internacao
set data_alta = date_add(data_entrada, interval 3 day)
where pacientes_id = 2;
update internacao
set data_alta =
date_add(data_alta, interval 12 hour)
where pacientes_id = 2;

/* Para pegar o valor máximo do id, ou último da tabela e apagar os valores a partir desse valor  */
set @valor_maximoID = (select max(id) from convenio);
delete from consultas where convenio_id = @valor_maximoID;
delete  FROM convenio  where id = @val_max;
