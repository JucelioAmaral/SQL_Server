--CREATE DATABASE DBDesenvolvedorIO

use DBDesenvolvedorIO
go

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

----------------------------------------------------
