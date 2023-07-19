-- CREATE DATABASE DBDesenvolvedorIO

use DBDesenvolvedorIO
go

------------------------ COMANDOS DDL e DML----------------------------

-- DROP DATABASE DBDesenvolvedorIO


/*-- Cria o banco de dados, mais o arquivo do banco de dados e o arquivo de log:
CREATE DATABASE DBDesenvolvedorIO
ON (Name = 'Dev_mdf', FILENAME = 'D:\CURSOS E FORMAÇÕES Desenvolvedor.io\SQL para Desenvolvedores\BANCO DE DADOS\teste.mdf')
LOG ON (Name = 'Dev_log', FILENAME = 'D:\CURSOS E FORMAÇÕES Desenvolvedor.io\SQL para Desenvolvedores\BANCO DE DADOS\teste.ldf')
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

/*-- Inserindo registros em 1 único insert
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

-- Mais performático, apagando todos os registros.
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


-- Relacionamento N:N, então criada da tabela com chave composta  (aluno_id, curso_id)
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
('Eduardo','00000000002','São Paulo','SP','2000-02-02'),
('Bruno','00000000003','São Paulo','SP','2000-03-03'),
('Tiago','00000000004','Rio de Janeiro','RJ','2000-04-04'),
('Heloysa','00000000005','Aracaju','SE','2000-05-05');
*/


/*INSERT INTO Categorias (descricao) VALUES ('Acesso a dados'),('Segurança'),('WEB');*/


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


--OFFSET / FETCH> Paginação ou limitação da quantidaded de retorno da tabela
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



-- LEFT JOIN > Dá prioridade aos registros da tabela que está a esquerda do comando LEFT
/*INSERT INTO Categorias(descricao)VALUES('Categoria test')*/ -- inserido para testar o LEFT JOIN
/*SELECT ca.descricao Categoria, cu.descricao Curso
FROM  Categorias  ca
LEFT JOIN Cursos cu ON cu.categoria_id = ca.id*/ 



-- RIGHT JOIN > Dá prioridade aos registros da tabela que está a direito do comando RIGHT
/*SELECT cu.descricao Curso, ca.descricao Categoria
FROM  Cursos cu
RIGHT JOIN Categorias ca ON ca.id = cu.categoria_id*/



-- FULL JOIN > Junção do LEFT JOIN e RIGHT JOIN
/*SELECT cu.descricao Curso, ca.descricao Categoria
FROM  Cursos cu
FULL JOIN Categorias ca ON ca.id = (cu.categoria_id + 4)-- Somado 4 para simular o erro do id + 4, ou seja, não existirá esses ids.
*/



-------- UNION & UNION ALL -------

/*SELECT * FROM Cursos WHERE id = 1
UNION
SELECT * FROM Cursos WHERE id = 2*/


-- UNION > Faz a distinção, elimina a duplicida
/*SELECT descricao FROM Cursos WHERE id = 1
UNION
SELECT descricao FROM Categorias WHERE id = 2
UNION
SELECT 'Valor dinamico'*/


-- UNION ALL > Mostra tudo, não faz a distinção, não elimina a duplicida.
/*SELECT descricao FROM Cursos WHERE id = 1
UNION ALL
SELECT descricao FROM Categorias WHERE id = 2
UNION ALL
SELECT 'Valor dinamico'
UNION ALL
SELECT 'Valor dinamico'*/



--------  TRANSAÇÕES -------

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
-- Utiliza pontos de marcação para salvação e pode fazer rollback a partir do ponto de marcação dentro da Transação.
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





--------  FUNÇÕES -------

-- left() > retorna os 4 primeiros caracteres de cada string
/*SELECT left(descricao,4) descricao FROM Categorias*/

-- right() > retorna os 4 último caracteres de cada string
/*SELECT right(descricao,4) descricao FROM Categorias*/



-- substring() > Retornar valores dentro de um intervalo. NO BANCO DE DADO O ÍNDICE COMEÇA PELO 1 E NÃO 0.
/*SELECT substring(descricao,2,5), descricao FROM Categorias*/


-- CONCATENAÇÃO > concatena strings
/*SELECT 'Rafael' + 'Almeida' + NULL*/

/*SELECT CONCAT('Rafael', ' Almeida', ' Santos')*/

/*SELECT CONCAT( descricao, ' Teste') from Categorias*/


-- ISNULL > Se encontrar NULL na celula, retorna o valor que descreveu do lado direito.
/*SELECT ISNULL(descricao, 'SEM DESCRIÇÃO') FROM Categorias*/


-- IIF > valida o que está antes da primeira virgula
/*SELECT IIF( -1 > 0, 'MAIOR QUE ZERO','MENOR QUE ZERO')*/

/*SELECT descricao, IIF(LEN(descricao) > 5, 'MAIOR QUE 5','MENOR QUE 5') FROM Categorias*/

/*SELECT CAST(GETDATE() AS DATE), CAST(GETDATE() AS TIME)*/



-------- CRIANDO FUNÇÕES -------

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



/*--nova função - Retorna valor inteiro
CREATE FUNCTION ContarRegistros()
RETURNS INT
AS
BEGIN
	RETURN ( SELECT COUNT(*) FROM Categorias)
END

SELECT dbo.ContarRegistros()
*/



--nova função - Retorna tabela (registro completo da tabela)
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


-- Comando para executar um "select" é usar o EXEC ou EXECUTE.
EXECUTE dbo.PesquisarCategoriaPorId 1
EXECUTE dbo.PesquisarCategoriaPorId @id = 1
EXECUTE dbo.PesquisarCategoriaPorId @id = 2
*/




-- Podemos também persistir dados
/*CREATE PROCEDURE PersistirDadosEmCategorias(@descricao VARCHAR(255))
AS
BEGIN 
	IF(@descricao IS NULL)
	BEGIN 
		RAISERROR('Descrição não é valida', 16,1) -- 16 e 1 são severidades do SQL server, state error
		RETURN
	END
	INSERT INTO Categorias(descricao, cadastrado_em) VALUES (@descricao, GETDATE())
END


EXEC dbo.PersistirDadosEmCategorias @descricao='Categoria Procedure'-- Exibe mensagem "Descrição não é valida"
EXEC dbo.PersistirDadosEmCategorias @descricao= null
SELECT * FROM  Categorias
*/