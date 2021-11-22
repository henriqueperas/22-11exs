
USE bdex2

CREATE TABLE tbcliente(

cliente_nome	VARCHAR(80),
logradouro		VARCHAR(80),
numero			INT	,
abairro			VARCHAR(80)	,
telefone		INT	,
carro			VARCHAR(80)NOT NULL
PRIMARY KEY(carro)

)

CREATE TABLE tbcarro(

placa	VARCHAR(80)NOT NULL,
marca	VARCHAR(80),
modelo	VARCHAR(80),
cor		VARCHAR(80),
ano		INT,
PRIMARY KEY(placa),

)

CREATE TABLE tbpecas(

cod_pecas	INT NOT NULL,
nome		VARCHAR(80),
valor		INT,
PRIMARY KEY(cod_pecas)

)

CREATE TABLE servico(

carro		VARCHAR(80)			NOT NULL,
peca		INT	NOT NULL,
quantidade	VARCHAR(80),
valor		VARCHAR(80),
data		DATETIME,
PRIMARY KEY(carro, peca),
FOREIGN KEY (carro) REFERENCES tbcliente(carro),
FOREIGN KEY (peca) REFERENCES tbpecas(cod_pecas)

)

GO


INSERT INTO tbcliente (cliente_nome, logradouro, numero, abairro, telefone, carro) 
VALUES ('João Alves',	'R. Pereira Barreto',	1258,	'Jd. Oliveiras',	21549658,	'DXO9876'),
('Ana Maria',	'R. 7 de Setembro',	259,	'Centro',	96588541,	'LKM7380'),
('Clara Oliveira',	'Av. Nações Unidas',	10254,	'Pinheiros',	24589658,	'EGT4631'),
('José Simões',	'R. XV de Novembro',	36,	'Água Branca',	78952459,	'BCD7521'),
('Paula Rocha',	'R. Anhaia',	548,	'Barra Funda',	69582548,	'AFT9087')
GO 

INSERT INTO tbcarro (placa, marca, modelo, cor, ano) 
VALUES ('AFT9087',	'VW',	'Gol',	'Preto',	2007),
('DXO9876',	'Ford',	'Ka',	'Azul',	2000),
('EGT4631',	'Renault',	'Clio',	'Verde',	2004),
('LKM7380',	'Fiat',	'Palio',	'Prata',	1997),
('BCD7521',	'Ford',	'Fiesta',	'Preto',	1999)
GO 

INSERT INTO tbpecas (cod_pecas, nome, valor) 
VALUES (1,	'Vela',	70),
(2,	'Correia Dentada',	125),
(3,	'Trambulador',	90),
(4,	'Filtro de Ar',	30)
GO 

INSERT INTO servico (carro, peca, quantidade, valor, data) 
VALUES ('DXO9876',	1,	4,	280,	'01/08/2020'),
('DXO9876',	4,	1,	30,	'01/08/2020'),
('EGT4631',	3,	1,	90,	'02/08/2020'),
('DXO9876',	2,	1,	125,	'07/08/2020')

GO 

SELECT tbcliente.telefone FROM tbcliente, tbcarro WHERE tbcarro.placa = tbcliente.carro AND tbcarro.modelo = 'Ka' AND tbcarro.cor = 'Azul' ;
SELECT tbcliente.logradouro, tbcliente.numero, tbcliente.abairro FROM tbcliente, servico WHERE servico.carro = tbcliente.carro AND servico.data = '02/08/2020';
SELECT placa FROM tbcarro WHERE ano < 2001;
SELECT marca, modelo, cor FROM tbcarro WHERE ano > 2005;
SELECT cod_pecas, nome FROM tbpecas WHERE valor < 80;
