-- CRIAÇÃO DE DATABASE
CREATE DATABASE Empresa

USE Empresa

DROP DATABASE Empresa


-- CRIAÇÃO DA TABELA DEPARTAMENTOS
CREATE TABLE Departamentos (
    Codigo_depto INT NOT NULL,
    NomeDepto VARCHAR(50) NOT NULL
	primary key (Codigo_depto) 
)

-- INSERT DEPARTAMENTOS
INSERT INTO Departamentos (Codigo_depto, NomeDepto)
VALUES (1, 'TI'),
       (2, 'Marketing'),
       (3, 'Vendas');

-- CRIAÇÃO DA TABELA FUNCIONARIO
CREATE TABLE Funcionarios (
    Codigo_func int identity NOT NULL,
    NomeFunc VARCHAR(50) NOT NULL,
    SobreNome VARCHAR(50) NOT NULL,
    DataNasci DATE NOT NULL,
    CPF VARCHAR(11) NOT NULL,
    RG VARCHAR(20) NOT NULL,
    Endereco VARCHAR(100) NOT NULL,
    CEP VARCHAR(20) NOT NULL,
    Cidade VARCHAR(50) NOT NULL,
    Fone VARCHAR(20) NOT NULL,
    Codigo_depto INT NOT NULL,
    Funcao VARCHAR(50) NOT NULL,
    Salario FLOAT NOT NULL,
    primary key (Codigo_func), 
	FOREIGN KEY (Codigo_depto) REFERENCES Departamentos(Codigo_depto)
)

-- INSERT FUNCIONARIOS
INSERT INTO Funcionarios (NomeFunc, SobreNome, DataNasci, CPF, RG, Endereco, CEP, Cidade, Fone, Codigo_depto, Funcao, Salario) 
VALUES	('João', 'Silva', '1990-05-15', '12345678900', '12345678', 'Rua A, 123', '12345-678', 'São Paulo', '(11) 1234-5678', 1, 'Analista', 5000.00),
		('Maria', 'Souza', '1995-10-10', '09876543210', '87654321', 'Rua B, 456', '12345-678', 'Rio de Janeiro', '(21) 9876-5432', 2, 'Coordenador', 7000.00),
		('Pedro', 'Santos', '1985-01-01', '45678912300', '45678912', 'Rua C, 789', '12345-678', 'Belo Horizonte', '(31) 4567-8901', 1, 'Programador', 3500.00),
		('Ana', 'Oliveira', '1988-03-22', '78912345600', '78912345', 'Rua D, 1010', '12345-678', 'Curitiba', '(41) 7890-1234', 3, 'Vendedor', 2500.00),
		('Carlos', 'Ferreira', '1992-07-05', '01234567890', '01234567', 'Rua E, 1313', '12345-678', 'São Paulo', '(11) 4321-5678', 2, 'Analista', 5500.00),
		('Luciana', 'Gomes', '1980-12-12', '13579024680', '13579024', 'Rua F, 1515', '12345-678', 'São Paulo', '11987654321', 1, 'Analista de Sistemas', 4500.00),
		('Pedro', 'Silva', '1990-05-25', '24680246800', '24680246', 'Rua G, 2020', '12345-678', 'São Paulo', '11986543210', 2, 'Assistente Administrativo', 2800.00),
		('Amanda', 'Santos', '1985-09-05', '11111111111', '11111111', 'Rua H, 3030', '12345-678', 'São Paulo', '11981234567', 2, 'Assistente Financeiro', 3000.00),
		('Bruno', 'Oliveira', '1987-03-15', '22222222222', '22222222', 'Rua I, 4040', '12345-678', 'São Paulo', '11987654321', 1, 'Analista de Suporte', 3800.00),
		('Mariana', 'Ferreira', '1992-11-02', '33333333333', '33333333', 'Rua J, 5050', '12345-678', 'São Paulo', '11981234567', 3, 'Gerente de Vendas', 5500.00),
		('Roberto', 'Souza', '1988-08-20', '44444444444', '44444444', 'Rua K, 6060', '12345-678', 'São Paulo', '11986543210', 1, 'Desenvolvedor Full Stack', 5000.00),
		('Larissa', 'Pereira', '1995-06-10', '55555555555', '55555555', 'Rua L, 7070', '12345-678', 'São Paulo', '11981234567', 3, 'Coordenador de Marketing', 6000.00),
		('Fernanda', 'Carvalho', '1991-04-22', '66666666666', '66666666', 'Rua M, 8080', '12345-678', 'São Paulo', '11987654321', 2, 'Assistente de RH', 2500.00),
		('Felipe', 'Mendes', '1989-02-18', '77777777777', '77777777', 'Rua N, 9090', '12345-678', 'São Paulo', '11986543210', 1, 'Analista de Banco de Dados', 4200.00),
		('Natália', 'Lima', '1993-07-08', '88888888888', '88888888', 'Rua O, 1010', '12345-678', 'São Paulo', '11981234567', 3, 'Supervisor de Vendas', 4800.00);


-- SELECT FUNCIONARIOS
SELECT * FROM Funcionarios
Select NomeFunc, SobreNome From Funcionarios ORDER BY SobreNome
Select * From Funcionarios ORDER BY Cidade
Select NomeFunc + ' ' + SobreNome AS NomeCompleto, Salario FROM Funcionarios WHERE Salario > 1000 ORDER BY NomeCompleto ASC
Select DataNasci, NomeFunc FROM Funcionarios ORDER BY DATEPART(YEAR, DataNasci), DATEPART(MONTH, DataNasci), DATEPART(DAY, DataNasci)
Select SobreNome, NomeFunc, Cidade, Endereco, Cidade From Funcionarios
select SUM(Salario) as FolhaDePagamento FROM Funcionarios
Select NomeFunc + ' ' + SobreNome as NomeCompleto, Salario, Funcao FROM Funcionarios ORDER BY Funcao ASC
Select * FROM Funcionarios WHERE Funcao like '%Supervisor%'
Select COUNT(*) as quantidade_de_funcionarios FROM Funcionarios
Select AVG(Salario) AS SalarioMedio FROM Funcionarios
Select NomeFunc + ' ' + SobreNome as NomeCompleto, Cidade, Funcao FROM Funcionarios where Cidade = 'São Paulo' AND Funcao = 'Analista' -- NÃO REGISTREI NINGUEM DE RECIFE E QUE TENHA A FUNÇÃO TELEFONISTA

-- INNER JOIN
-- 1 - Liste o nome completo do funcionário, o nome do departamento e a função de todos os funcionários
SELECT f.NomeFunc + ' ' + f.SobreNome AS NomeCompleto, d.NomeDepto, f.Funcao
FROM Funcionarios f INNER JOIN Departamentos d 
ON f.Codigo_depto = d.Codigo_depto;

-- 2 - Liste os nomes dos departamentos e dos funcionários que têm a função de supervisor
SELECT d.NomeDepto, f.NomeFunc + ' ' + f.SobreNome AS NomeCompleto
FROM Funcionarios f INNER JOIN Departamentos d 
ON f.Codigo_depto = d.Codigo_depto
WHERE f.Funcao = 'Supervisor de Vendas';

-- 3 - Liste o nome do departamento e nome completo do funcionário ordenados por departamento e Sobrenome do funcionário
SELECT d.NomeDepto, f.NomeFunc + ' ' + f.SobreNome AS NomeCompleto
FROM Funcionarios f INNER JOIN Departamentos d 
ON f.Codigo_depto = d.Codigo_depto
ORDER BY d.NomeDepto, f.SobreNome;

-- SUBS-QUERYS
-- 1. (SubQuery) Liste os nomes dos funcionários que trabalham no departamento Pessoal
SELECT d.NomeDepto, f.NomeFunc + ' ' + f.SobreNome AS NomeCompleto
FROM Funcionarios f INNER JOIN Departamentos d 
ON f.Codigo_depto = d.Codigo_depto
WHERE d.NomeDepto = 'TI'; -- Não tenho departamento Pessoal

-- GROUP BY
-- 1. (Group by) Liste o valor da folha de pagamento de cada departamento (nome)
SELECT d.NomeDepto, SUM(f.Salario) AS FolhaDePagamento
FROM Funcionarios f INNER JOIN Departamentos d 
ON f.Codigo_depto = d.Codigo_depto
GROUP BY d.NomeDepto;

-- 2. (Group by) Liste o menor salário pago pela empresa em cada departamento
SELECT d.NomeDepto, MIN(f.Salario) AS MenorSalario
FROM Funcionarios f INNER JOIN Departamentos d 
ON f.Codigo_depto = d.Codigo_depto
GROUP BY d.NomeDepto;