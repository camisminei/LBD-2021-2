-- Nome: Camila Minei
-- RGA: 2017.1906.064-9

--1. Definição do esquema
CREATE SCHEMA empresadb;
SET SEARCH_PATH=empresadb;


--2. Definição de tabelas como chaves primárias. 

-- TABELA DEPARTAMENTO
CREATE TABLE departamento (
	cod_dep integer NOT NULL PRIMARY KEY,
	nome varchar(50) UNIQUE,
	endereco varchar(50)
);

-- TABELA DIVISAO
CREATE TABLE divisao (
	cod_divisao integer NOT NULL PRIMARY KEY,
	nome varchar(50),
	endereco varchar(50),
	cod_dep integer
);

-- TABELA EMPREGADO
CREATE TABLE empregado(
	matr integer NOT NULL PRIMARY KEY,
	nome varchar(50),
	endereco varchar (50),
	data_lotacao TIMESTAMP, 
	lotacao integer,
	gerencia_cod_dep integer, 
	lotacao_div integer, 
	gerencia_div integer
);

-- TABELA VENCIMENTO
	-- vencimento.valor  - possui um valor default de Zero
CREATE TABLE vencimento(
	cod_venc integer NOT NULL PRIMARY KEY,
	nome varchar(50) UNIQUE NOT NULL,
	tipo varchar (10), 
	valor decimal (10) DEFAULT 0
);


-- TABELA DEPENDENTE
	-- No atributo sexo coloque uma restrição de check para validar que o atributo possui os valores 'M' ou 'F'
CREATE TABLE dependente(
	matr integer NOT null,
	nome varchar(50) NOT NULL PRIMARY KEY,
	endereco varchar(50)
	
);


-- TABELA DESCONTO
CREATE TABLE desconto(
	cod_desc integer NOT NULL PRIMARY KEY, 
	nome varchar (50),
	tipo varchar (50),
	valor decimal (10)
);


-- TABELA EMP_DESC
CREATE TABLE emp_desc(
	cod_desc integer, 
	matr integer NOT NULL,
	PRIMARY KEY(cod_desc, matr)
);

-- TABELA EMP_VENC
CREATE TABLE emp_venc(
	cod_venc integer NOT NULL, 
	matr integer NOT NULL,
	PRIMARY KEY(cod_venc, matr)
);

--3. definição de chaves estrangeiras. Considere que todas as ações de remoção resultam em propagação.


ALTER TABLE divisao 
	ADD CONSTRAINT departamento_divisao FOREIGN KEY (cod_dep) REFERENCES departamento(cod_dep);

ALTER TABLE empregado 
	ADD CONSTRAINT empregado_departamento FOREIGN KEY (gerencia_cod_dep) REFERENCES departamento (cod_dep),

ALTER TABLE empregado
	ADD CONSTRAINT empregado_divisao FOREIGN KEY (gerencia_div) REFERENCES divisao (cod_divisao);

ALTER TABLE emp_desc
	ADD CONSTRAINT emp_desc_desconto FOREIGN KEY (cod_desc) REFERENCES desconto (cod_desc);

ALTER TABLE emp_desc
	ADD CONSTRAINT emp_desc_empregado FOREIGN KEY (matr) REFERENCES empregado (matr);

ALTER TABLE emp_venc
	ADD CONSTRAINT emp_venc_vencimento FOREIGN KEY (cod_venc) REFERENCES vencimento (cod_venc);
	
ALTER TABLE emp_venc
	ADD CONSTRAINT emp_venc_empregado FOREIGN KEY (matr) REFERENCES empregado (matr);

ALTER TABLE dependente 
	ADD CONSTRAINT dependente_empregado FOREIGN KEY (matr) REFERENCES empregado(matr);
	

--4. Adicione (utilizando alter table) a coluna sexo na tabela dependente, char(1), para possuir os valores 'M' ou 'F'
ALTER TABLE dependente ADD COLUMN sexo char(1);

ALTER TABLE dependente ADD CHECK(sexo IN('M','F'));
