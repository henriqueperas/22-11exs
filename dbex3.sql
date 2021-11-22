CREATE DATABASE bdex3
GO
USE bdex3

CREATE TABLE tbpaciente(
CPF			BIGINT	NOT NULL,
nome		VARCHAR(80),
rua			VARCHAR(80),
numero		INT	,
bairro		VARCHAR(80)	,
telefone	INT	,
data_nasci	DATE,
PRIMARY KEY(CPF)
)

CREATE TABLE tbmedico(
codigo			INT	NOT NULL,
nome			VARCHAR(80),
especialista	VARCHAR(80),
PRIMARY KEY(codigo)
)

CREATE TABLE tbprontuario(
data			DATE	NOT NULL,
CPF_paciente	BIGINT		NOT NULL,
codigo_medico	INT		NOT NULL,
diagnostico		VARCHAR(80),
medicamento		VARCHAR(80),
PRIMARY KEY(CPF_paciente, codigo_medico, data),
FOREIGN KEY (CPF_paciente) REFERENCES tbpaciente(CPF),
FOREIGN KEY (codigo_medico) REFERENCES tbmedico(codigo)
)
GO

INSERT INTO tbpaciente (CPF, nome, rua, numero, bairro, telefone, data_nasci) 
VALUES (35454562890,	'José Rubens',	'Campos Salles',	2750,	'Centro',	21450998,	'1954-10-18'),
(29865439810,	'Ana Claudia',	'Sete de Setembro',	178,	'Centro',	97382764,	'1960-05-29'),
(82176534800,	'Marcos Aurélio',	'Timóteo Penteado',	236,	'Vila Galvão',	68172651,	'1980-09-24'),
(12386758770,	'Maria Rita',	'Castello Branco',	7765,	'Vila Rosália',	NULL,	'1975-03-30'),
(92173458910,	'Joana de Souza',	'XV de Novembro',	298,	'Centro',	21276578,	'1944-04-24')
GO 

INSERT INTO tbmedico (codigo, nome, especialista) 
VALUES (1,	'Wilson Cesar',	'Pediatra'),
(2,	'Marcia Matos',	'Geriatra'),
(3,	'Carolina Oliveira',	'Ortopedista'),
(4,	'Vinicius Araujo',	'Clínico Geral')
GO 

INSERT INTO tbprontuario (data, CPF_paciente, codigo_medico, diagnostico, medicamento) 
VALUES ('2020-09-10',	35454562890,	2,	'Reumatismo',	'Celebra'),
('2020-09-10',	92173458910,	2,	'Renite, Alérgica',	'Allegra'),
('2020-09-12',	29865439810,	1,	'Inflamação de garganta',	'Nimesulida'),
('2020-09-13',	35454562890,	2,	'H1N1',	'Tamiflu'),
('2020-09-15',	82176534800,	4,	'Gripe',	'Resprin'),
('2020-09-15',	12386758770,	3,	'Braço Quebrado',	'Dorflex + Gesso')
GO 

SELECT nome, rua, numero, bairro FROM tbpaciente WHERE YEAR(data_nasci) > 1971;
SELECT especialista FROM tbmedico WHERE nome = 'Carolina Oliveira';
SELECT medicamento FROM tbprontuario WHERE diagnostico = 'Reumatismo';

SELECT tbprontuario.diagnostico, tbprontuario.medicamento FROM tbprontuario, tbpaciente WHERE tbpaciente.CPF = tbprontuario.CPF_paciente AND tbpaciente.nome = 'José Rubens';
SELECT tbmedico.nome, CONCAT(SUBSTRING(tbmedico.especialista,1,3),'.') FROM tbmedico, tbpaciente, tbprontuario WHERE tbpaciente.CPF = tbprontuario.CPF_paciente AND tbmedico.codigo = tbprontuario.codigo_medico AND
tbpaciente.nome = 'José Rubens';
SELECT tbpaciente.nome, tbpaciente.rua, tbpaciente.numero, tbpaciente.bairro, tbpaciente.telefone, tbpaciente.CPF FROM tbmedico, tbpaciente, tbprontuario WHERE tbmedico.nome = 'Vinicius Araujo' AND
tbmedico.codigo = tbprontuario.codigo_medico AND tbpaciente.CPF = tbprontuario.CPF_paciente;
SELECT DATEDIFF(DAY, tbprontuario.data, GETDATE()) FROM tbpaciente, tbprontuario WHERE tbpaciente.CPF = tbprontuario.CPF_paciente AND tbpaciente.nome = 'Maria Rita';