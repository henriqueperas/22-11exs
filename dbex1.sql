/*
CREATE DATABASE bdex1
GO
USE bdex1
CREATE TABLE tbaluno(

RA				INT			NOT NULL,
aluno_nome		VARCHAR(80)	NOT NULL,
aluno_sobrenome	VARCHAR(80)	NOT NULL,
rua				VARCHAR(80)	NOT NULL,
numero			INT			NOT NULL,
aluno_bairro	VARCHAR(80)	NOT NULL,
CEP				INT			NOT NULL,
telefone		INT			,
PRIMARY KEY(RA)

)

CREATE TABLE tbcurso(

cod_curso		INT			NOT NULL,
curso_nome		VARCHAR(80)	NOT NULL,
curso_horarios	VARCHAR(80)	NOT NULL,
turno			VARCHAR(80)	NOT NULL,
PRIMARY KEY(cod_curso)

)

CREATE TABLE tbdisiplina(

cod_disiplina		INT			NOT NULL,
disiplina_nome		VARCHAR(80)	NOT NULL,
disiplina_horarios	VARCHAR(80)	NOT NULL,
turno				VARCHAR(80)	NOT NULL,
semestre			INT,
PRIMARY KEY(cod_disiplina)

)

GO
*/
INSERT INTO tbaluno (RA, aluno_nome, aluno_sobrenome, rua, numero, aluno_bairro, CEP, telefone) 
VALUES (12345, 'José', 'Silva', 'Almirante Noronha', 236, 'Jardim São Paulo1',	1589000, 69875287),
(12346,	'Ana', 'Maria', 'Bastos	Anhaia', 1568, 'Barra Funda', 3569000,	25698526),
(12347,	'Mario', 'Santos', 'XV de Novembro', 1841, 'Centro', 1020030, NULL),
(12348,	'Marcia', 'Neves', 'Voluntários da Patria', 225, 'Santana', 2785090, 78964152)
GO 



INSERT INTO tbcurso (cod_curso, curso_nome, curso_horarios, turno) 
VALUES (1, 'Informática', 2800, 'Tarde'),
(2, 'Informática', 2800, 'Noite'),
(3, 'Logística', 2650, 'Tarde'),
(4, 'Logística', 2650, 'Noite'),
(5, 'Plásticos', 2500, 'Tarde'),
(6, 'Plásticos', 2500, 'Noite')
GO 



INSERT INTO tbdisiplina (cod_disiplina, disiplina_nome, disiplina_horarios, turno, semestre) 
VALUES (1, 'Informática',	4,	'Tarde',	1),
(2,	'Informática',	4,	'Noite',	1),
(3,	'Quimica', 4,	'Tarde',	1),
(4,	'Quimica', 4,	'Noite',	1),
(5,	'Banco de Dados I', 2,	'Tarde',	3),
(6,	'Banco de Dados I', 2,	'Noite',	3),
(7,	'Estrutura de Dados',	4,	'Tarde',	4),
(8,	'Estrutura de Dados',	4,	'Noite',	4)
GO 



SELECT aluno_nome, aluno_sobrenome FROM tbaluno;
SELECT rua, numero, aluno_bairro, CEP FROM tbaluno WHERE telefone IS NULL;
SELECT telefone FROM tbaluno WHERE RA = 12348;
SELECT curso_nome, turno FROM tbcurso WHERE curso_horarios = 2800;
SELECT semestre FROM tbdisiplina WHERE disiplina_nome = 'Banco de Dados I' AND turno = 'Noite';
