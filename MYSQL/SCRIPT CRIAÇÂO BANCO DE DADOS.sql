/* Possui algumas alterações que não me atentei na que tinha enviado na atividade 2*/

/* Criação do Banco de Dados e Seleção do Banco de Dados */
CREATE DATABASE  hospital_db_LuizHenrique;
USE hospital_db_LuizHenrique;

/* Criação da tabela medicos */
CREATE TABLE medicos (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(60) NOT NULL,
  data_nascimento DATE NOT NULL,
  cpf VARCHAR(11) NOT NULL,
  crm_codigo VARCHAR(15) NOT NULL,
  uf_crm VARCHAR(20) NOT NULL,
  telefone VARCHAR(20) NOT NULL,
  endereco VARCHAR(200) NOT NULL,
  INDEX nome (nome ) ,
  PRIMARY KEY (id),
  UNIQUE INDEX crm_codigo_UNIQUE (crm_codigo)
  );


/* Criação da tabela pacientes */
CREATE TABLE pacientes (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(60) NOT NULL,
  email VARCHAR(35) NOT NULL,
  telefone VARCHAR(25) NOT NULL,
  data_nascimento DATE NOT NULL,
  INDEX nomePaciente(nome ) ,
  PRIMARY KEY (id)
  );


/* Criação da tabela convenio */  
CREATE TABLE convenio (
  id INT NOT NULL AUTO_INCREMENT,
  nomeConvenio VARCHAR(45) NOT NULL,
  codigoConvenio VARCHAR(45) NOT NULL,
  CNPJ VARCHAR(20) NOT NULL,
  dataCarencia DATE NOT NULL,
  pacientes_id INT NOT NULL,
  PRIMARY KEY (id),
  UNIQUE INDEX codigoConvenio_UNIQUE (codigoConvenio),
  INDEX fk_convenio_pacientes1_idx (pacientes_id),
  
  CONSTRAINT fk_convenio_pacientes1
    FOREIGN KEY (pacientes_id)
    REFERENCES hospital_db_LuizHenrique.pacientes(id)
    ON DELETE cascade
    ON UPDATE NO ACTION);


/* Criação da tabela documentos */
CREATE TABLE documentos (
  id INT NOT NULL AUTO_INCREMENT,
  cpf VARCHAR(11) NOT NULL,
  rg VARCHAR(9) NOT NULL,
  pacientes_id INT NOT NULL,
  PRIMARY KEY (id),
  UNIQUE INDEX cpf_UNIQUE ( cpf ),
  UNIQUE INDEX rg_UNIQUE (rg),
  INDEX fk_documentos_pacientes1_idx (pacientes_id),
  
  CONSTRAINT fk_documentos_pacientes1
    FOREIGN KEY (pacientes_id)
    REFERENCES hospital_db_LuizHenrique.pacientes(id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    );


/* Criação da tabela especialidades */
CREATE TABLE especialidades(
  id INT NOT NULL AUTO_INCREMENT,
  especialidade VARCHAR(45) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE INDEX especialidade_UNIQUE (especialidade)
  );


/* Criação da tabela consultas*/
CREATE TABLE consultas (
  id INT NOT NULL AUTO_INCREMENT,
  data_e_hora DATETIME NOT NULL,
  medicos_id INT NOT NULL,
  pacientes_id INT NOT NULL,
  valorConsulta FLOAT NOT NULL,
  convenio_id INT NULL,
  especialidade_requerida_id INT NOT NULL,
  PRIMARY KEY (id),
  INDEX fk_consultas_convenio1_idx (convenio_id),
  INDEX fk_consultas_medicos1_idx (medicos_id) ,
  INDEX fk_consultas_pacientes1_idx (pacientes_id),
  INDEX fk_consultas_especialidades1_idx (especialidade_requerida_id),
  CONSTRAINT fk_consultas_convenio1
    FOREIGN KEY (convenio_id)
    REFERENCES hospital_db_LuizHenrique.convenio(id)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT fk_consultas_medicos1
    FOREIGN KEY (medicos_id)
    REFERENCES hospital_db_LuizHenrique.medicos(id)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT fk_consultas_pacientes1
    FOREIGN KEY (pacientes_id)
    REFERENCES hospital_db_LuizHenrique.pacientes(id)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT fk_consultas_especialidades1
    FOREIGN KEY (especialidade_requerida_id)
    REFERENCES hospital_db_LuizHenrique.especialidades(id)
    ON DELETE CASCADE
    ON UPDATE NO ACTION
    
    );

/* Criação da tabela receitas */
CREATE TABLE receitas (
  id INT NOT NULL AUTO_INCREMENT,
  via_farmacia MEDIUMTEXT NOT NULL,
  via_paciente MEDIUMTEXT NOT NULL,
  consulta_id INT NOT NULL,
  PRIMARY KEY (id),
  INDEX fk_receitas_consultas1_idx (consulta_id),
  CONSTRAINT fk_receitas_consultas1
    FOREIGN KEY (consulta_id)
    REFERENCES hospital_db_LuizHenrique.consultas(id)
    ON DELETE CASCADE
    ON UPDATE NO ACTION
    );

/* Criação da tabela medico possui especialidades */
CREATE TABLE  medico_especialidades (
  medicos_id INT NOT NULL,
  especialidades_id INT NOT NULL,
  PRIMARY KEY (medicos_id, especialidades_id),
  INDEX fk_medicos_has_especialidades_especialidades1_idx (especialidades_id),
  INDEX fk_medicos_has_especialidades_medicos1_idx (medicos_id),
  CONSTRAINT fk_medicos_has_especialidades_medicos1
    FOREIGN KEY (medicos_id)
    REFERENCES hospital_db_LuizHenrique.medicos(id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_medicos_has_especialidades_especialidades1
    FOREIGN KEY (especialidades_id)
    REFERENCES hospital_db_LuizHenrique.especialidades(id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    );
    
/* Criação da tabela tipo do quarto */
CREATE TABLE tipo_quarto (
  id INT NOT NULL AUTO_INCREMENT,
  descricao VARCHAR(45) NOT NULL,
  valor_diaria FLOAT NOT NULL,
  PRIMARY KEY (id),
  UNIQUE INDEX descricao_UNIQUE (descricao)
  );

/* Criação da tabela que identificam os quartos */
CREATE TABLE quarto (
  id INT NOT NULL AUTO_INCREMENT,
  Numero_do_quarto INT NOT NULL,
  tipo_quarto_id INT NOT NULL,
  PRIMARY KEY (id),
  INDEX fk_quarto_tipo_quarto1_idx (tipo_quarto_id),
  UNIQUE INDEX numero_UNIQUE (Numero_do_quarto) ,
  CONSTRAINT fk_quarto_tipo_quarto1
    FOREIGN KEY (tipo_quarto_id)
    REFERENCES hospital_db_LuizHenrique.tipo_quarto (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    );

/* Criação da tabela das internações */
CREATE TABLE internacao (
  id INT NOT NULL AUTO_INCREMENT,
  pacientes_id INT NOT NULL,
  medicos_id INT NOT NULL,
  data_entrada DATE NOT NULL,
  data_prev_saida DATE NOT NULL,
  data_alta DATETIME,
  procedimento_realizado MEDIUMTEXT NOT NULL,
  quarto_id INT NOT NULL,
  PRIMARY KEY (id),
  INDEX fk_Internacao_pacientes1_idx (pacientes_id),
  INDEX fk_Internacao_medicos1_idx (medicos_id),
  INDEX fk_Internacao_quarto1_idx (quarto_id),
  CONSTRAINT fk_Internacao_pacientes1
    FOREIGN KEY (pacientes_id)
    REFERENCES hospital_db_LuizHenrique.pacientes(id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Internacao_medicos1
    FOREIGN KEY (medicos_id)
    REFERENCES hospital_db_LuizHenrique.medicos(id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Internacao_quarto1
    FOREIGN KEY (quarto_id)
    REFERENCES hospital_db_LuizHenrique.quarto(id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    );

/* Criação da tabela com os dados dos enfermerios */
CREATE TABLE enfermeiro (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(60) NOT NULL,
  cpf VARCHAR(11) NOT NULL,
  cre VARCHAR(14) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE INDEX cpf_UNIQUE  (cpf) ,
  UNIQUE INDEX cre_UNIQUE (cre)
  );

/* Criação da tabela da participação dos enfermeiros em internações*/
CREATE TABLE participacao_enfermeiros(
  enfermeiro_id INT NOT NULL,
  Internacao_id INT NOT NULL,
  INDEX fk_enfermeiro_has_Internacao_Internacao1_idx (Internacao_id ),
  INDEX fk_enfermeiro_has_Internacao_enfermeiro1_idx (enfermeiro_id ),
  PRIMARY KEY (enfermeiro_id, Internacao_id),
  CONSTRAINT fk_enfermeiro_has_Internacao_enfermeiro1
    FOREIGN KEY (enfermeiro_id)
    REFERENCES hospital_db_LuizHenrique.enfermeiro (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_enfermeiro_has_Internacao_Internacao1
    FOREIGN KEY (Internacao_id)
    REFERENCES hospital_db_LuizHenrique.Internacao(id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    );
