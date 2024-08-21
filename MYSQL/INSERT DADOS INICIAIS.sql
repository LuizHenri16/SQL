/* Inserindo as informações básicas, considerei a tabela com as informações dos médicos,
   as informações dos pacientes, assim como a dos enfermeiros e os quartos existentes.
   Contendo também as tabelas que se relacionam com essas.
 */;

INSERT INTO medicos(nome, data_nascimento, cpf, crm_codigo, uf_crm, telefone, endereco)
VALUES
 ("Anny Quintanilha", "1970-11-10", "86132473009", "120935", "RS", "(69) 3752-5488", "Rua Flores 10, apto 101"),
 ("Suéli Simão Pegado", "1990-08-27", "62876978067", "15891", "SP", "(97) 2810-2734", "Avenida Japão 50"),
 ("Alisson Sacramento", "1981-01-15", "80814279023", "178105", "MG", "(79) 2718-0264", "Rua Albieri 480"),
 ("Lívia Veloso", "1972-03-22","20924987030", "17897", "MG",  "(61) 3019-1483", "Travessa A 89"),
 ("Gael Milheiro Lemes", "1964-02-13", "38603737061", "9826", "RS","(82) 2433-7762", "Rua das Rosas, 80, apto 200"),
 ("Gisela Espinosa", "1980-09-12", "23529091049", "34548","SP", "(86) 3368-4812", "Avenida Santos, 90"),
 ("Nelson Anjos Palmeira", "1980-10-14","03626639045", "344789", "SP", "(54) 3941-4795", "Rua Álamo, 180, ap 90"),
 ("Ezequiel Pestana Henriques", "1979-06-30", "67297959057", "9756", "RS", "(69) 2537-6076", "Avenida Chateaubriand, 150"),
 ("Tito Carqueijeiro", "1973-05-19", "74588651056", "14777", "RS", "(83) 3272-8326", "Rua Flores 670"),
 ("Fabiano Gomide",	"1989-08-31", "32972518080",  "65765", "RS", "(83) 3272-8326","Avenida das Águas 600"),
 ("Cristovão Xavier", "1979-12-12", "92690490005", "67432", "RS", "(24) 2448-9465","Rua da Luz, 80"),
 ("Alberto Veríssimo" , "1986-06-26", "70600178013", "13548", "SP", "(67) 3754-8886", "Avenida  das aves, 9912, apto 60"),
 ("Júlia Camarinho", "1980-07-05", "74492596054", "24654", "MG", "(61) 2615-4776", "Rua Albieri 590");

INSERT INTO especialidades(especialidade)
VALUES 
 ("Pediatria"),
 ("Clínico geral"),
 ("Gastroenterologia"),
 ("dermatologia"),
 ("Oftalmologia"), 
 ("Ortopedia"),
 ("Psiquiatria");	

INSERT INTO medico_especialidades(medicos_id, especialidades_id)
VALUES
 (1,1), (1, 2),
 (2, 2),
 (3, 3),
 (4, 1),(4, 3),
 (5, 4),
 (6, 2),
 (7, 1),
 (8, 1),
 (9, 2),
 (10, 2), (10, 6),
 (11, 4), (11, 1),
 (12, 1),
 (13, 3), (13, 2);

INSERT INTO pacientes(nome, email, telefone, data_nascimento)
VALUES
 ("Luiz Henrique Santana", "lhenrique22@gmail.com", "(23) 92343-4456", "2000-12-22"),
 ("João Carlos Nascimento","joazinho44@hotmail.com", "(23) 95331-1062", "1983-02-16"),
 ("Ana Paula Souza", "Paulinha92@outlook.com", "(21) 98765-4321", "1992-05-20"),
 ("Pedro Henrique Santos","SanPedro@gmail.com", "(22) 94321-5678", "1987-11-14"),
 ("Isabela Oliveira","bellebelinha22@gmail.com", "(21) 91234-9876", "2000-07-03"),
 ("Leonardo Gomes","LeoFortao@gmail.com", "(21) 95432-1098", "1990-08-06"),
 ("Felipe Oliveira","felipe22@gmail.com", "(11) 92345-6789", "1996-11-29"),
 ("Laura Martins","lucasali@gmail.com", "(21) 92245-8729", "2002-08-19"),
 ("Bruno Silva Nasicmento","brunosilva22@hotmail.com", "(13) 90123-4567", "1973-01-28"),
 ("Vinícius Martins","viniMar@gmail.com", "(24) 99876-5432", "1989-09-07"),
 ("Matheus Pereira","pereira231@gmail.com", "(21) 98765-4321", "1984-02-23"),
 ("Amanda Dias","diasamanda@hotmail.com", "(21) 97654-3210", "1999-10-12"),
 ("Jéssica Ferreira","", "(21) 92315-2709", "1996-11-29");

INSERT INTO documentos (cpf, rg, pacientes_id)
VALUES
 ("55254482702","334699605", 1),
 ("02001001738","351828473", 2),
 ("84479420746","437703770", 3),
 ("60690042728","369564674", 4),
 ("63297783702","303388754", 5),
 ("46810466711","210710263", 6),
 ("80118699733","468219274", 7),
 ("15464339701","144802259", 8),
 ("14326459786","184016873", 9),
 ("93227270714","348156650", 10),
 ("22454410796","376696527", 11),
 ("01995716782","259583856", 12),
 ("28254723796","193575759", 13);

INSERT INTO convenio (nomeConvenio, codigoConvenio, CNPJ, dataCarencia, pacientes_id)
VALUES
 ("MedMais","847693", "11.289.660/0001-50", "2023-04-14", 4),
 ("UniSaude","4548643", "59.927.300/0001-63", "2024-02-11" , 5),
 ("Pro Health","5528243", "50.399.999/0001-61", "2021-05-04" , 9),
 ("Saúde Sempre","324324321", "49.916.605/0001-16", "2026-02-12", 1),
 ("Saude Sempre","334524829", "49.916.605/0001-16", "2023-06-11", 3),
 ("UniSaude","1344643", "59.927.300/0001-63", "2025-03-11" , 6);

INSERT INTO tipo_quarto(descricao, valor_diaria)
VALUES
 ("Enfermaria", 50.00),
 ("Quarto duplo", 100.00),
 ("Apartamento", 300.00);

INSERT INTO quarto(Numero_do_quarto, tipo_quarto_id)
VALUES
 (01, 1),
 (02, 1),
 (03, 1), 
 (04, 1),
 (05, 1),
 (11, 2),
 (12, 2),
 (13, 2),
 (100, 3),
 (103, 3),
 (104, 3);

INSERT INTO enfermeiro(nome, cpf, cre)
VALUES
 ("Maria Fernanda dos Santos", "40013226096", "8976342"),
 ("joão Carlos Almeida de Jesus", "06868589050", "9921034"),
 ("josé Alberto de Carvalho", "76668562010", "1165021"),
 ("Catarina Paolino Barros", "82382128046", "2147812"),
 ("Pedro Fernandez", "85481141035", "3412529"),
 ("Bruno Santana Ferreira", "15362728043", "6321429");