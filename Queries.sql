-- CREATE DATABASE DBDesenvolvedorIO

use DBDesenvolvedorIO
go

------------------------ COMANDOS DDL e DML----------------------------

-- DROP DATABASE DBDesenvolvedorIO


/*-- Cria o banco de dados, mais o arquivo do banco de dados e o arquivo de log:
CREATE DATABASE DBDesenvolvedorIO
ON (Name = 'Dev_mdf', FILENAME = 'D:\CURSOS E FORMA��ES Desenvolvedor.io\SQL para Desenvolvedores\BANCO DE DADOS\teste.mdf')
LOG ON (Name = 'Dev_log', FILENAME = 'D:\CURSOS E FORMA��ES Desenvolvedor.io\SQL para Desenvolvedores\BANCO DE DADOS\teste.ldf')
*/

/* -- Criando tabela
CREATE TABLE ALUNOS(
id int PRIMARY KEY IDENTITY,
nome VARCHAR(80) NOT NULL,
cpf CHAR(11) NOT NULL,
data_nascimento DATE,
ativo bit DEFAULT 1
)*/

/*-- Inserindo registros
INSERT INTO ALUNOS (nome,cpf,data_nascimento,ativo) VALUES ('Celio','12345678989', GETDATE(),0)*/

/*-- Inserindo registros em 1 �nico insert
INSERT INTO ALUNOS (nome,cpf,data_nascimento,ativo)
VALUES
('Edaurdo','55545678989', GETDATE(),0),
('Ana','55588889892', GETDATE(),0);
*/


/*-- Consultando registros
SELECT * FROM ALUNOS

SELECT nome as Nome_Aluno,cpf FROM ALUNOS
*/


/*-- Atualizando registros, podendo concatenar
UPDATE ALUNOS
SET nome = 'Celio' + ' Augusto'
WHERE nome = 'Celio'


UPDATE ALUNOS SET data_nascimento = GETDATE() , ativo = 1;
*/


/*Deletando registros
-- DELETE FROM ALUNOS;

-- Mais perform�tico, apagando todos os registros.
-- TRUNCATE TABLE ALUNOS

-- exclui os dois primeiro registros da tabela, de acordo com a ordem do id.
DELETE TOP(2) FROM ALUNOS;
*/


/*-- Criando tabela novamente, porem diferente.
CREATE TABLE Alunos(
id int PRIMARY KEY IDENTITY,
nome VARCHAR(80) NOT NULL,
cidade char(60) NOT NULL,
estado char(2) NOT NULL,
cpf CHAR(11) NOT NULL,
data_nascimento DATE,
ativo bit DEFAULT 1
)*/



/*CREATE TABLE Categorias(
id int PRIMARY KEY IDENTITY,
descricao VARCHAR(80) NOT NULL,
cadastrado_em DATETIME DEFAULT GETDATE()
)*/


/*CREATE TABLE Cursos(
id int PRIMARY KEY IDENTITY,
categoria_id INT NOT NULL,
descricao VARCHAR(80) NOT NULL,
total_horas INT NOT NULL,
valor DECIMAL (12,2) NOT NULL DEFAULT 0,
cadastrado_em DATETIME DEFAULT GETDATE(),
ativo bit DEFAULT 1,
CONSTRAINT fx_categoria_id FOREIGN KEY (categoria_id) REFERENCES Categorias(id)
)*/


-- Relacionamento N:N, ent�o criada da tabela com chave composta  (aluno_id, curso_id)
/*CREATE TABLE Alunos_Cursos(
aluno_id  INT NOT NULL,
curso_id  INT NOT NULL,
cadastrado_em DATETIME DEFAULT GETDATE(),
CONSTRAINT pk_alunos PRIMARY KEY (aluno_id, curso_id),
CONSTRAINT fk_aluno_id FOREIGN KEY (aluno_id) REFERENCES Alunos(id),
CONSTRAINT fk_cursos_id FOREIGN KEY (curso_id) REFERENCES Cursos (id) 
)*/



/*INSERT INTO Alunos (nome, cpf, cidade, estado, data_nascimento) VALUES 
('Rafael','00000000001','Aracaju','SE','2000-01-01'),
('Eduardo','00000000002','S�o Paulo','SP','2000-02-02'),
('Bruno','00000000003','S�o Paulo','SP','2000-03-03'),
('Tiago','00000000004','Rio de Janeiro','RJ','2000-04-04'),
('Heloysa','00000000005','Aracaju','SE','2000-05-05');
*/


/*INSERT INTO Categorias (descricao) VALUES ('Acesso a dados'),('Seguran�a'),('WEB');*/


/*INSERT INTO Cursos (descricao, categoria_id, total_horas, valor) VALUES
('EF Core',1,17,300),
('SQL Server',1,5,200),
('ASP.NET Core Enterprise',3,5,200),
('Fundamentos de IdentyServer4',2,5,200)*/



/*INSERT INTO Alunos_Cursos (aluno_id, curso_id) VALUES
(1,1),
(1,2),
(2,3),
(3,1),
(4,4),
(5,1),
(5,2),
(5,3);*/




------------------------ COMANDOS ----------------------------
-- DISTINCT
/*SELECT DISTINCT cidade, estado FROM Alunos*/



-- ORDER BY
/*SELECT * FROM Alunos
ORDER BY nome*/



-- TOP
/*SELECT TOP 4 * FROM Alunos ORDER BY id;*/


-- PERCENT
/*SELECT TOP 10 PERCENT * FROM Alunos ORDER BY id;*/


--OFFSET / FETCH> Pagina��o ou limita��o da quantidaded de retorno da tabela
/*SELECT * FROM Alunos ORDER BY id
OFFSET 2 ROWS
FETCH FIRST 2 ROWS ONLY;*/


--WHERE
/*SELECT * FROM Alunos WHERE nome = 'Rafael'*/
/*SELECT * FROM Alunos WHERE id >= 3*/


--AND/OR
/*SELECT * FROM Alunos WHERE id >= 3 AND Nome = 'Bruno'*/
/*SELECT * FROM Alunos WHERE id >= 3 AND (Nome = 'Bruno' OR Nome = 'Heloysa')*/


-- LIKE
/*SELECT * FROM Alunos WHERE Nome LIKE 'Rafael'*/
/*SELECT * FROM Alunos WHERE Nome LIKE 'Ra%'*/  -- Consulta pelos caracteres iniciais
/*SELECT * FROM Alunos WHERE Nome LIKE '%o'*/  -- Consulta pelos caracteres finais
/*SELECT * FROM Alunos WHERE Nome LIKE '%u%'*/  -- Consulta pelos caracteres no meio
/*SELECT * FROM Alunos WHERE Nome LIKE 'R%l'*/  -- Consulta pelos caracteres que inicia e finaliza com tais caracteres




-- MAX/ MIN
/*SELECT MAX(id) FROM Alunos*/
/*SELECT MIN(id) FROM Alunos*/
/*SELECT * FROM Alunos WHERE id = (SELECT MAX(id) FROM Alunos)*/


-- COUNT / SUM
/*SELECT * FROM Cursos*/
/*SELECT COUNT(*), SUM(total_horas), SUM(valor) FROM Cursos*/



-- GROUP BY
/*SELECT cidade, estado, COUNT(*) FROM Alunos GROUP BY cidade, estado*/


-- HAVING 
/*SELECT cidade, estado, COUNT(*)Total FROM Alunos
GROUP BY cidade, estado
HAVING COUNT(*) < 2*/



-- Operador IN
/*SELECT * FROM Alunos WHERE id IN (2,4)*/
/*SELECT * FROM Alunos WHERE id IN (SELECT id FROM Alunos)*/



-- Operador BETWEEN
/*SELECT * FROM Alunos WHERE id BETWEEN 2 AND 4*/



--------  JOIN -------

-- INNER JOIN
/*SELECT * FROM Categorias
SELECT * FROM Cursos*/

/*SELECT * FROM  Cursos cr
INNER JOIN Categorias ca ON ca.id = cr.categoria_id*/

/*SELECT cu.descricao Curso, ca.descricao Categoria
FROM  Cursos cu
INNER JOIN Categorias ca ON ca.id = cu.categoria_id*/



-- LEFT JOIN > D� prioridade aos registros da tabela que est� a esquerda do comando LEFT
/*INSERT INTO Categorias(descricao)VALUES('Categoria test')*/ -- inserido para testar o LEFT JOIN
/*SELECT ca.descricao Categoria, cu.descricao Curso
FROM  Categorias  ca
LEFT JOIN Cursos cu ON cu.categoria_id = ca.id*/ 



-- RIGHT JOIN > D� prioridade aos registros da tabela que est� a direito do comando RIGHT
/*SELECT cu.descricao Curso, ca.descricao Categoria
FROM  Cursos cu
RIGHT JOIN Categorias ca ON ca.id = cu.categoria_id*/



-- FULL JOIN > Jun��o do LEFT JOIN e RIGHT JOIN
/*SELECT cu.descricao Curso, ca.descricao Categoria
FROM  Cursos cu
FULL JOIN Categorias ca ON ca.id = (cu.categoria_id + 4)-- Somado 4 para simular o erro do id + 4, ou seja, n�o existir� esses ids.
*/



-------- UNION & UNION ALL -------

/*SELECT * FROM Cursos WHERE id = 1
UNION
SELECT * FROM Cursos WHERE id = 2*/


-- UNION > Faz a distin��o, elimina a duplicida
/*SELECT descricao FROM Cursos WHERE id = 1
UNION
SELECT descricao FROM Categorias WHERE id = 2
UNION
SELECT 'Valor dinamico'*/


-- UNION ALL > Mostra tudo, n�o faz a distin��o, n�o elimina a duplicida.
/*SELECT descricao FROM Cursos WHERE id = 1
UNION ALL
SELECT descricao FROM Categorias WHERE id = 2
UNION ALL
SELECT 'Valor dinamico'
UNION ALL
SELECT 'Valor dinamico'*/



--------  TRANSA��ES -------

/*SELECT * FROM Categorias

BEGIN TRANSACTION
UPDATE Categorias SET descricao = UPPER(descricao) WHERE id>0
GO
DELETE Categorias WHERE id = 1002
GO

/*ROLLBACK*/

/*COMMIT*/

*/


--------  SAVE POINT -------
-- Utiliza pontos de marca��o para salva��o e pode fazer rollback a partir do ponto de marca��o dentro da Transa��o.
/*
SELECT * FROM Categorias

BEGIN TRANSACTION
INSERT INTO Categorias (descricao, cadastrado_em) VALUES('Categoria Nova 1', GETDATE());
INSERT INTO Categorias (descricao, cadastrado_em) VALUES('Categoria Nova 2', GETDATE());
GO
SAVE TRANSACTION AtualizacaoPoint
UPDATE Categorias SET descricao = 'Aplicacao WEB' WHERE descricao = 'WEB'
GO

SELECT * FROM Categorias

ROLLBACK TRANSACTION AtualizacaoPoint

SELECT * FROM Categorias

COMMIT
*/





--------  FUN��ES -------

-- left() > retorna os 4 primeiros caracteres de cada string
/*SELECT left(descricao,4) descricao FROM Categorias*/

-- right() > retorna os 4 �ltimo caracteres de cada string
/*SELECT right(descricao,4) descricao FROM Categorias*/



-- substring() > Retornar valores dentro de um intervalo. NO BANCO DE DADO O �NDICE COME�A PELO 1 E N�O 0.
/*SELECT substring(descricao,2,5), descricao FROM Categorias*/


-- CONCATENA��O > concatena strings
/*SELECT 'Rafael' + 'Almeida' + NULL*/

/*SELECT CONCAT('Rafael', ' Almeida', ' Santos')*/

/*SELECT CONCAT( descricao, ' Teste') from Categorias*/


-- ISNULL > Se encontrar NULL na celula, retorna o valor que descreveu do lado direito.
/*SELECT ISNULL(descricao, 'SEM DESCRI��O') FROM Categorias*/


-- IIF > valida o que est� antes da primeira virgula
/*SELECT IIF( -1 > 0, 'MAIOR QUE ZERO','MENOR QUE ZERO')*/

/*SELECT descricao, IIF(LEN(descricao) > 5, 'MAIOR QUE 5','MENOR QUE 5') FROM Categorias*/

/*SELECT CAST(GETDATE() AS DATE), CAST(GETDATE() AS TIME)*/



-------- CRIANDO FUN��ES -------

-- retorna um varchar
/*CREATE FUNCTION Mascarar(@data VARCHAR(255), @quantidadeCaracteres int)
RETURNS VARCHAR(255)
AS
BEGIN
	RETURN LEFT (@data,@quantidadeCaracteres) + '**** ****'
END

SELECT dbo.Mascarar('Rafael Almeida',4)
SELECT dbo.Mascarar(descricao, 4) FROM Categorias
*/



/*--nova fun��o - Retorna valor inteiro
CREATE FUNCTION ContarRegistros()
RETURNS INT
AS
BEGIN
	RETURN ( SELECT COUNT(*) FROM Categorias)
END

SELECT dbo.ContarRegistros()
*/



--nova fun��o - Retorna tabela (registro completo da tabela)
/*CREATE FUNCTION GetCategoriaById(@id int)
RETURNS TABLE
AS
RETURN ( SELECT * FROM Categorias WHERE id = @id)

SELECT * FROM dbo.GetCategoriaById(1)
SELECT * FROM dbo.GetCategoriaById(2)
*/





--------  PROCEDURE -------

/*
CREATE PROCEDURE PesquisarCategoriaPorId(@id int)
AS
BEGIN 
	SELECT * FROM  Categorias WHERE id = @id
END


-- Comando para executar um "select" � usar o EXEC ou EXECUTE.
EXECUTE dbo.PesquisarCategoriaPorId 1
EXECUTE dbo.PesquisarCategoriaPorId @id = 1
EXECUTE dbo.PesquisarCategoriaPorId @id = 2
*/




-- Podemos tamb�m persistir dados
/*CREATE PROCEDURE PersistirDadosEmCategorias(@descricao VARCHAR(255))
AS
BEGIN 
	IF(@descricao IS NULL)
	BEGIN 
		RAISERROR('Descri��o n�o � valida', 16,1) -- 16 e 1 s�o severidades do SQL server, state error
		RETURN
	END
	INSERT INTO Categorias(descricao, cadastrado_em) VALUES (@descricao, GETDATE())
END


EXEC dbo.PersistirDadosEmCategorias @descricao='Categoria Procedure'-- Exibe mensagem "Descri��o n�o � valida"
EXEC dbo.PersistirDadosEmCategorias @descricao= null
SELECT * FROM  Categorias
*/




--------  VIEW -------

-- Examinando as tabela para criar a view
/*SELECT * FROM  Cursos
SELECT * FROM  Categorias*/


--Criando uma VIEW
/*CREATE VIEW vwCursos
AS
SELECT cu.descricao, ca.descricao Categoria
FROM  Cursos cu 
INNER JOIN Categorias ca
ON cu.categoria_id = ca.id

SELECT * FROM vwCursos
SELECT * FROM vwCursos WHERE descricao = 'EF Core'
*/


--para apagar a view
/*DROP VIEW vwCursos*/


--Alterar a estrutura de uma view (mais a coluna cadastrado_em)
/*ALTER VIEW vwCursos
AS
SELECT cu.descricao, ca.descricao Categoria, cu.cadastrado_em
FROM  Cursos cu 
INNER JOIN Categorias ca
ON cu.categoria_id = ca.id 


SELECT * FROM vwCursos
*/




--------  SEQU�NCIA -------

--Criando uma sequencia
/*CREATE SEQUENCE MinhaSequencia
AS INT
START WITH 6 --exemplo
INCREMENT BY 1 --incrementa de 1 em 1
MINVALUE 6 -- Minimo de valores
MAXVALUE 1000 -- M�ximo de valores
NO CYCLE -- sem ciclo


SELECT NEXT VALUE FOR MinhaSequencia
-- out= 6
SELECT NEXT VALUE FOR MinhaSequencia
-- out= 7
*/


--EXEMPLO criando uma tabela e populando
/*CREATE TABLE TabelaTeste
(
	id int DEFAULT NEXT VALUE FOR MinhaSequencia,
	descricao VARCHAR (20)
)

INSERT INTO TabelaTeste(descricao) VALUES ('Teste 1')
INSERT INTO TabelaTeste(descricao) VALUES ('Teste 2')

SELECT * FROM TabelaTeste
*/



--------  ADICIONANDO NOVO CAMPO NUMA TABELA -------

/*ALTER TABLE Categorias ADD Teste VARCHAR (100) DEFAULT 'Teste'

SELECT * FROM Categorias
*/




--------  REMOVENDO COLUNAS DE UMA TABELA -------

/*ALTER TABLE Categorias DROP COLUMN Teste;
ALTER TABLE Categorias DROP CONSTRAINT DF__Categoria__Teste__4E88ABD4; -- Ao criar com o "DEFAULT" foi gerado uma CONSTRAINT. Para apagar basta executar este comando passando o registro (DF__Categoria__Teste__4E88ABD4) apresentado ao executar o DROP COLUMN acima.

SELECT * FROM Categorias
*/



--------  RENOMEANDO NOMES DE COLUNAS E TABELA -------
/*
ALTER TABLE Categorias ADD Teste VARCHAR (100)

SELECT * FROM Categorias

--Comando para alterar o nome da coluna
EXECUTE sp_rename 'dbo.Categorias.Teste','Observacao','COLUMN'

SELECT * FROM Categorias


--Comando para alterar o nome de uma tabela
EXECUTE sp_rename 'dbo.TabelaTeste','TabelaAlterada'
*/



-------- BACKUP --------

-- Gerando backups de banco de dados. BACKUP FULL
/*BACKUP DATABASE DBDesenvolvedorIO
TO DISK = 'D:/CURSOS E FORMA��ES Desenvolvedor.io/SQL para Desenvolvedores/BANCO DE DADOS/AulaBackup.bak'
WITH INIT,
	NAME = 'Backup do banco de dados'
*/

-- Gerando backups de banco de dados. BACKUP DIFERENCIADO
/*BACKUP DATABASE DBDesenvolvedorIO
TO DISK = 'D:/CURSOS E FORMA��ES Desenvolvedor.io/SQL para Desenvolvedores/BANCO DE DADOS/AulaBackup-01.bak'
WITH DIFFERENTIAL,
	NAME = 'Backup do banco de dados - Diferencial'
*/



-->> RESTAURANDO BACKUP ---

-- Deve-se usar outro banco (master) para conseguir restaurar o que queremos.
/*use master
go

RESTORE DATABASE DBDesenvolvedorIO
FROM DISK = 'D:/CURSOS E FORMA��ES Desenvolvedor.io/SQL para Desenvolvedores/BANCO DE DADOS/AulaBackup.bak'
WITH REPLACE
*/




-------- TIPS & TRICKS --------
--DICAS E TRUQUES


--> Usar o SQL Server Profiler

-- SELECT * FROM Categorias



-->> HINTS SQL
--Recurso que possibilita anota��es

/*SELECT * FROM Categorias

BEGIN TRANSACTION
UPDATE Categorias SET descricao = 'Teste com NOLOCK ' WHERE  id=2004


ROLLBACK

--Use este comando abaixo em outra se��o/aba, assim conseguir ver o registro modificado
SELECT * FROM Categorias WITH (NOLOCK)
*/





-------- �NDICE --------
/*
use DBDesenvolvedorIO;

CREATE TABLE Tabela_Teste
(
  id INT,
  descricao varchar(80)
)

DECLARE @id INT = 1
DECLARE @p1 INT,@p2 INT,@p3 INT,@p4 INT
WHILE @id <= 200000
BEGIN 
  SET @p1=@id+200000
  SET @p2=@id+400000
  SET @p3=@id+600000
  SET @p4=@id+800000
  INSERT INTO Tabela_Teste(id, descricao) 
	VALUES (@id,'Descricao '+cast(@id as varchar(7))),
		   (@p1,'Descricao '+cast(@p1 as varchar(7))),
		   (@p2,'Descricao '+cast(@p2 as varchar(7))),
		   (@p3,'Descricao '+cast(@p3 as varchar(7))),
		   (@p4,'Descricao '+cast(@p4 as varchar(7)));
  SET @id = @id+1
END 


SELECT descricao FROM Tabela_Teste WHERE descricao='DESCRICAO 900000';


-- >> Criando �ndice <<<
CREATE INDEX idx_tabela_teste_descricao ON Tabela_Teste(descricao)

-- Usando Index
SELECT descricao FROM Tabela_Teste WHERE LEFT (descricao,16)= 'DESCRICAO 900000';
SELECT descricao FROM Tabela_Teste WHERE descricao LIKE 'DESCRICAO 900000%'; -- Sinal de percento no final para usar o index de forma acertiva
*/
