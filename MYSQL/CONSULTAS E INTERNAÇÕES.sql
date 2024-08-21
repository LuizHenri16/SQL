INSERT INTO consultas  (data_e_hora, medicos_id, pacientes_id, valorConsulta, convenio_id, especialidade_requerida_id)
VALUES 
  ("2017-01-17 14:20:00", 1, 3, 100.00, 5, 2),
  ("2017-10-22 15:00:30", 10, 6, 120.00, 6, 6),
  ("2018-04-20 15:30:20", 9, 5, 300.00, 2, 2),
  ("2021-11-10 11:00:20", 10, 1, 200.00, 4, 6),
  ("2018-12-10 14:10:00", 4, 9, 100.00, 3, 3),
  ("2018-03-15 13:30:00", 9, 5, 80.00, null, 2),
  ("2019-05-12 14:50:00", 13, 3, 50.00, null, 2),
  ("2022-07-05 16:00:00", 2, 10, 80.00, null, 2),
  ("2020-01-15 09:00:00", 11, 4, 130.00, null, 4),
  ("2019-08-20 15:00:00", 4, 12, 100.00, null, 3),
  ("2020-01-15 10:00:00", 11, 7, 190.00, null, 4),
  ("2020-01-15 11:00:00", 11, 8, 190.00, null, 4),
  ("2020-03-15 10:00:00", 11, 7, 100.00, null, 4),
  ("2020-05-15 09:30:00", 11, 7, 220.00, null, 4);

INSERT INTO receitas  (via_farmacia, via_paciente, consulta_id)
VALUES 
  ("Dipirona Monoidratada 500mg e Expec Xarope", "Usar dipirona a cada 8 horas e Xarope a cada 6 horas", 3),
  ("Dipirona Monoidratada 500mg", "", 8),
  ("Florent 200mg", "Usar a cada 4 horas", 1),
  ("Gastrobem Suspensão Oral e Florent", "Gastrobem a cada 8 horas e Florent a cada 4 horas", 5),
  ("Expec Xarope", "Usar a cada 6 horas", 2),
  ("Dorflex 1g e Cataflampro Emulgel", "Usar o Dorflex a cada 8 horas e passar a pomada Emulgel sempre que o efeito passar", 6);
/*	Script para inserir os dados de consultas e internações com suas respectivas tabelas
	que se relacionam.
 */;
INSERT INTO internacao (pacientes_id, medicos_id, data_entrada, data_prev_saida, data_alta, procedimento_realizado, quarto_id)
VALUES
 (4, 2, "2020-04-01", "2020-04-04", null, "Remoção de um alimento da garganta", 1),
 (5, 6, "2022-02-15", "2022-02-15", "2022-02-15 15:00:00", "Inserção de Aparelho que ajuda no batimento cardiaco", 1),
 (2, 10, "2021-05-12", "2021-05-20", "2021-05-20 12:30:00", "Remoção de objeto estranho dentro do corpo", 3), 
 (8, 10, "2020-10-22", "2020-10-25", "2020-10-25 10:20:00", "Procedimento no nariz, paciente com dificuldade na respiração", 2),
 (2, 13, "2019-04-25", "2019-04-29", "2019-04-29 12:00:00", "Cirurgia na garganta", 3),
 (7, 10, "2018-02-22", "2018-02-22", "2018-02-22 16:00:00" , "Cirurgia no coração", 3),
 (9, 6, "2017-07-22", "2017-07-23", "2017-07-23 18:30:00", "Procedimento no nariz, paciente com dificuldade na respiração", 2),
 (2, 13, "2019-05-22", "2019-06-02", null, "Cirurgia na garganta" , 1);

INSERT INTO participacao_enfermeiros (Internacao_id, enfermeiro_id )
VALUES
 (1, 2),  (1,4),
 (2, 6),  (2, 4), 
 (3, 4),  (3, 1),
 (4, 2),  (4, 5),
 (5, 1),  (5, 2),
 (6, 4),  (6, 3),
 (7, 3),  (7, 2),
 (8, 6), (8, 1);