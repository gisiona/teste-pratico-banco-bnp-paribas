GO

--CREATE DATABASE TESTEBNP;

GO
USE TESTEBNP;
GO

-- DROP TABLE PRODUTO
CREATE TABLE PRODUTO
(
	COD_PRODUTO CHAR(04) NOT NULL,
	DES_PRODUTO VARCHAR(30),
	STA_STATUS CHAR(01)
)


ALTER TABLE PRODUTO ADD CONSTRAINT PK_PRODUTO PRIMARY KEY (COD_PRODUTO);

GO

ALTER TABLE PRODUTO ADD CONSTRAINT CHK_PRODUTO_VALOR_STA_STATUS CHECK (STA_STATUS = 'A' OR STA_STATUS = 'I');

GO

INSERT INTO PRODUTO VALUES ('PR01', 'PRODUTO 1', 'A')
INSERT INTO PRODUTO VALUES ('PR02', 'PRODUTO 2', 'A')
INSERT INTO PRODUTO VALUES ('PR03', 'PRODUTO 3', 'A')
INSERT INTO PRODUTO VALUES ('PR04', 'PRODUTO 4', 'A')
INSERT INTO PRODUTO VALUES ('PR05', 'PRODUTO 5', 'A')
SELECT * FROM PRODUTO
GO


 --DROP TABLE PRODUTO_COSIF
 -- PRODUTO COSIF
 CREATE TABLE PRODUTO_COSIF
 (
	COD_COSIF CHAR(11) NOT NULL,
	COD_PRODUTO CHAR(04) NOT NULL,	
	COD_CLASSIFICACAO CHAR(06),
	STA_STATUS CHAR(01)
 )

GO

ALTER TABLE PRODUTO_COSIF ADD CONSTRAINT PK_PRODUTO_COSIF PRIMARY KEY (COD_COSIF);

GO

ALTER TABLE PRODUTO_COSIF ADD CONSTRAINT CHK_PRODUTO_COSIF_VALOR_STA_STATUS CHECK (STA_STATUS = 'A' OR STA_STATUS = 'I');

GO

ALTER TABLE PRODUTO_COSIF ADD CONSTRAINT CHK_PRODUTO_COSIF_VALOR_COD_CLASSIFICACAO CHECK (COD_CLASSIFICACAO = 'NORMAL' OR COD_CLASSIFICACAO = 'MTN');

GO

ALTER TABLE PRODUTO_COSIF ADD CONSTRAINT FK_PRODUTO_COSIF FOREIGN KEY (COD_PRODUTO) REFERENCES PRODUTO(COD_PRODUTO)

GO
 
INSERT INTO PRODUTO_COSIF VALUES('PRODCOSIF01','PR01','NORMAL','A')
INSERT INTO PRODUTO_COSIF VALUES('PRODCOSIF02','PR02','MTN','A')
INSERT INTO PRODUTO_COSIF VALUES('PRODCOSIF03','PR03','NORMAL','A')
INSERT INTO PRODUTO_COSIF VALUES('PRODCOSIF04','PR04','NORMAL','A')
INSERT INTO PRODUTO_COSIF VALUES('PRODCOSIF05','PR05','NORMAL','A')
SELECT * FROM PRODUTO_COSIF

GO

--DROP TABLE MOVIMENTO_MANUAL
-- MOVIMENTO MANUAL
 CREATE TABLE MOVIMENTO_MANUAL
 (
	CODIGO_MOVIMENTO INT NOT NULL IDENTITY(1,1),
	DAT_MES INT NOT NULL ,
	DAT_ANO INT NOT NULL ,
	NUM_LANCAMENTO DECIMAL(18) NOT NULL ,
	COD_PRODUTO CHAR(04) NOT NULL ,
	COD_COSIF CHAR(11) NOT NULL ,
	VAL_VALOR DECIMAL(18,2) NOT NULL ,
	DES_DESCRICAO VARCHAR(50) NOT NULL ,
	DAT_MOVIMENTO SMALLDATETIME NOT NULL,
	COD_USUARIO VARCHAR(15) NOT NULL
)

ALTER TABLE MOVIMENTO_MANUAL ADD CONSTRAINT PK_MOVIMENTO_MANUAL PRIMARY KEY (CODIGO_MOVIMENTO);

GO

ALTER TABLE MOVIMENTO_MANUAL ADD CONSTRAINT FK_MOVIMENTO_MANUAL_PRODUTO_COSIF FOREIGN KEY (COD_COSIF) REFERENCES PRODUTO_COSIF(COD_COSIF)

GO

ALTER TABLE MOVIMENTO_MANUAL ADD CONSTRAINT FK_MOVIMENTO_MANUAL_PRODUTO FOREIGN KEY (COD_PRODUTO) REFERENCES PRODUTO(COD_PRODUTO)

GO

INSERT INTO MOVIMENTO_MANUAL VALUES(01,2019,1,'PR01','PRODCOSIF01', 10,'PRIMEIRO MOVIMENTO MANUAL 1',GETDATE(),'TESTE')
INSERT INTO MOVIMENTO_MANUAL VALUES(02,2019,2,'PR02','PRODCOSIF02', 20,'PRIMEIRO MOVIMENTO MANUAL 2',GETDATE(),'TESTE')
INSERT INTO MOVIMENTO_MANUAL VALUES(03,2019,3,'PR03','PRODCOSIF03', 30,'PRIMEIRO MOVIMENTO MANUAL 3',GETDATE(),'TESTE')
INSERT INTO MOVIMENTO_MANUAL VALUES(04,2019,4,'PR04','PRODCOSIF04', 40,'PRIMEIRO MOVIMENTO MANUAL 4',GETDATE(),'TESTE')
INSERT INTO MOVIMENTO_MANUAL VALUES(05,2019,5,'PR05','PRODCOSIF05', 50,'PRIMEIRO MOVIMENTO MANUAL 5',GETDATE(),'TESTE')
SELECT * FROM MOVIMENTO_MANUAL





