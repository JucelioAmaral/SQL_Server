-- CREATE DATABASE DBDesenvolvedorIO

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