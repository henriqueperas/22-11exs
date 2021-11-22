CREATE DATABASE bdex4
GO
USE bdex4

CREATE TABLE tbcliente(
CPF			BIGINT	NOT NULL,
telefone	INT	,
nome		VARCHAR(80),
PRIMARY KEY(CPF)
)

CREATE TABLE tbfornecedor(
ID			INT	NOT NULL,
nome		VARCHAR(80),
lagradouro	VARCHAR(80),
numero		INT,
complemento	VARCHAR(80),
cidade		VARCHAR(80),
PRIMARY KEY(ID)
)
GO

CREATE TABLE tbproduto(
codigo		INT	NOT NULL,
descricao	VARCHAR(500),
fornecedor	INT,
preco		DECIMAL(10,2),
PRIMARY KEY(codigo),
FOREIGN KEY (fornecedor) REFERENCES tbfornecedor(ID)
)
GO

CREATE TABLE tbvenda(
codigo			INT	NOT NULL,
codigo_produto	INT		NOT NULL,
CPF				BIGINT	NOT NULL,
quantidade		INT,
preco			DECIMAL(10,2),
data			DATE,
PRIMARY KEY(codigo, codigo_produto, CPF),
FOREIGN KEY (codigo_produto) REFERENCES tbproduto(codigo),
FOREIGN KEY (CPF) REFERENCES tbcliente(CPF)
)
GO

INSERT INTO tbcliente (CPF, nome, telefone) 
VALUES (34578909290,	'Julio Cesar',	'82736541'),
(25186533710,	'Maria Antonia',	'87652314'),
(87627315416,	'Luiz Carlos',	'61289012'),
(79182639800,	'Paulo Cesar',	'90765273')
GO 


INSERT INTO tbfornecedor(ID, nome, lagradouro, numero, complemento, cidade) 
VALUES (1,	'LG',	'Rod. Bandeirantes',	70000,	'Km 70',	'Itapeva'),
(2,	'Asus',	'Av. Nações Unidas',	10206,	'Sala 225',	'São Paulo'),
(3,	'AMD',	'Av. Nações Unidas',	10206,	'Sala 1095',	'São Paulo'),
(4,	'Leadership',	'Av. Nações Unidas',	10206,	'Sala 87',	'São Paulo'),
(5,	'Inno',	'Av. Nações Unidas',	10206,	'Sala 34',	'São Paulo')
GO 

INSERT INTO tbproduto(codigo, descricao, fornecedor, preco) 
VALUES (1,	'Monitor 19 pol.',	1,	449.99),
(2,	'Netbook 1GB Ram 4 Gb HD',	2,	699.99),
(3,	'Gravador de DVD - Sata',	1,	99.99),
(4,	'Leitor de CD',	1,	49.99),
(5,	'Processador - Phenom X3 - 2.1GHz',	3,	349.99),
(6,	'Mouse',	4,	19.99),
(7,	'Teclado',	4,	25.99),
(8,	'Placa de Video - Nvidia 9800 GTX - 256MB/256 bits',	5,	599.99)
GO 

INSERT INTO tbvenda(codigo, codigo_produto, CPF, quantidade, preco, data) 
VALUES (1,	1,	25186533710,	1,	449.99,	'03-09-200'),
(1,	4,	25186533710,	1,	49.99,	'03-09-2009'),
(1,	5,	25186533710,	1,	349.99,	'03-09-2009'),
(2,	6,	79182639800,	4,	79.96,	'06-09-2009'),
(3,	8,	87627315416,	1,	599.99,	'06-09-2009'),
(3,	3,	87627315416,	1,	99.99,	'06-09-2009'),
(3,	7,	87627315416,	1,	25.99,	'06-09-2009'),
(4,	2,	34578909290,	2,	1399.98,	'08-09-2009')
GO 

SELECT * FROM tbcliente
SELECT * FROM tbfornecedor
SELECT * FROM tbproduto
SELECT * FROM tbvenda