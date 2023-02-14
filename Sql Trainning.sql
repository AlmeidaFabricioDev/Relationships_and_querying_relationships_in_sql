CREATE DATABASE DESPESAS;

USE DESPESAS;

CREATE TABLE CATEGORIA(
	IDCATEGORIA INT PRIMARY KEY IDENTITY,
	CATEGORIA VARCHAR(45) NOT NULL

);

SELECT * FROM CATEGORIA;

CREATE TABLE DESPESAS(
	IDDESPESAS INT PRIMARY KEY IDENTITY,
	DESPESA VARCHAR(45) NOT NULL,
	VALOR DECIMAL(10,2),
	DIA DATETIME,
	CATEGORIA_IDCATEGORIA INT FOREIGN KEY REFERENCES CATEGORIA (IDCATEGORIA)
);


INSERT INTO CATEGORIA(CATEGORIA)
VALUES('Automoveis');
INSERT INTO CATEGORIA(CATEGORIA)
VALUES('Tecnologia');
INSERT INTO CATEGORIA(CATEGORIA)
VALUES('Smartphones');


SELECT * FROM CATEGORIA;
SELECT * FROM DESPESAS;
INSERT INTO DESPESAS (DESPESA, VALOR, DIA, CATEGORIA_IDCATEGORIA)
VALUES('Notebook', 1500.00, '2020-08-02', 2);

INSERT INTO DESPESAS (DESPESA, VALOR, DIA, CATEGORIA_IDCATEGORIA)
VALUES('Corolla', 90000.00, '2022-12-14', 1);

INSERT INTO DESPESAS (DESPESA, VALOR, DIA, CATEGORIA_IDCATEGORIA)
VALUES('iPhone 14', 7500.00, '2023-02-08 14:35:12:01', 3);

SELECT C.CATEGORIA AS [NOME DA CATEGORIA], C.IDCATEGORIA AS [IDENTIFICADOR DA CATEGORIA],
D.DESPESA AS [PRODUTO COMPRADO], D.VALOR AS [VALOR DO PRODUTO]
FROM
CATEGORIA C
INNER JOIN
DESPESAS D
ON C.IDCATEGORIA = D.CATEGORIA_IDCATEGORIA
ORDER BY C.IDCATEGORIA, C.CATEGORIA ;

INSERT INTO DESPESAS (DESPESA, VALOR, DIA, CATEGORIA_IDCATEGORIA)
VALUES('PC GAMER', 2500.00, '2021-08-02', 2);

INSERT INTO DESPESAS (DESPESA, VALOR, DIA, CATEGORIA_IDCATEGORIA)
VALUES('Honda CIVIC', 80000.00, '2020-12-14', 1);

INSERT INTO DESPESAS (DESPESA, VALOR, DIA, CATEGORIA_IDCATEGORIA)
VALUES('Samsung Galaxy S22', 5500.00, '2021-02-08 14:35:12:01', 3);

SELECT C.CATEGORIA, D.CATEGORIA_IDCATEGORIA, SUM(D.VALOR) AS TOTAL_PRODUTO_COMPRADO
FROM CATEGORIA C
INNER JOIN DESPESAS D
ON C.IDCATEGORIA = D.CATEGORIA_IDCATEGORIA
GROUP BY C.CATEGORIA, D.CATEGORIA_IDCATEGORIA;
