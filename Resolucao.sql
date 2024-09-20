-- DESAFIO #1:

-- Criação do database da empresa fictícia 
create database GlowPixel;
-- apontando uso do database
use glowpixel;

-- Criação da tabela funcionários
CREATE TABLE Funcionario (
    IdFuncionario INT PRIMARY KEY,
    Nome VARCHAR(100),
    Cargo VARCHAR(100),
    Departamento VARCHAR(100)
);

-- Criação da tabela projeto
CREATE TABLE Projeto (
    IdProjeto INT PRIMARY KEY,
    Nome_do_Projeto VARCHAR(100),
    DataInicio DATE,
    DataFim DATE
);

-- Criação do tabela(Relacionamento/Entidade) atribução
CREATE TABLE Atribuicao (
    fk_Funcionario_IdFuncionario INT,
    fk_Projeto_IdProjeto INT,
    HorasTrabalhadas FLOAT
);
 
 -- Adicionando a coluna IdFuncionario como chave estrangeira
ALTER TABLE Atribuicao ADD CONSTRAINT FK_Atribuicao_1
    FOREIGN KEY (fk_Funcionario_IdFuncionario)
    REFERENCES Funcionario (IdFuncionario)
    ON DELETE RESTRICT;
 
 -- Adicionando a coluna IdProjeto como chave estrangeira, formando a chave composta da tabela Atribuição 
ALTER TABLE Atribuicao ADD CONSTRAINT FK_Atribuicao_2
    FOREIGN KEY (fk_Projeto_IdProjeto)
    REFERENCES Projeto (IdProjeto)
    ON DELETE RESTRICT;
    
    -- Testes no banco 
    insert into Projeto (IdProjeto, Nome_do_Projeto, DataInicio, DataFim) values ('1', 'Interface', '2024-09-15', '2024-09-19');
    
    select * from projeto;

    -- DESAFIO #2:

-- Criação da tabela funcionários

    CREATE TABLE Funcionarios (
    IdFuncionario INT PRIMARY KEY,
    Nome VARCHAR(100),
    Salario float
);

-- Criação da tabela projetos
CREATE TABLE Projetos (
    IdProjeto INT PRIMARY KEY,
    Nome_Projeto VARCHAR(100)
);

-- Criação da tabela Horas Trabalhadas
CREATE TABLE HorasTrabalhadas (
    fk_IdFuncionario INT,
    fk_IdProjeto INT,
    Horas FLOAT
);
 
 -- Adicionando a coluna IdFuncionario como chave estrangeira

ALTER TABLE HorasTrabalhadas ADD CONSTRAINT FK_HorasTrabalhadas_1
    FOREIGN KEY (fk_IdFuncionario)
    REFERENCES Funcionarios(IdFuncionario)
    ON DELETE RESTRICT;
 
 -- Adicionando a coluna IdProjeto como chave estrangeira, formando a chave composta da tabela HorasTrabalhadas
ALTER TABLE HorasTrabalhadas ADD CONSTRAINT FK_HorasTrabalhadas_2
    FOREIGN KEY (fk_IdProjeto)
    REFERENCES Projetos (IdProjeto)
    ON DELETE RESTRICT;
  
  -- Inserindo dados ficticios para teste
  insert into funcionarios (IdFuncionario, Nome, Salario) values ('1','Guilherme','3.500');
  insert into projetos (IdProjeto, Nome_Projeto) values('2','Subir Firewall');
  insert into HorasTrabalhadas (fk_Idfuncionario, fk_idprojeto,horas) values('1','2','10.5');
  
select * from horastrabalhadas;

-- Alterando o delimitador
DELIMITER $$

-- Criando procedimento
CREATE PROCEDURE FuncionarioInfo(
    IN PIdFuncionario INT
)
BEGIN
    -- Declarando as variáveis para armazenar os dados
    DECLARE VNomeFuncionario VARCHAR(100);
    DECLARE VTotalHoras FLOAT DEFAULT 0;

    -- Buscando o nome do funcionário e armazenando na variavel VNomeFuncionario
    SELECT Nome INTO VNomeFuncionario
    FROM Funcionarios
    WHERE IdFuncionario = PIdFuncionario;

    -- Exibindo o nome do funcionário com concatenação entre o texto e a variavel 
    SELECT CONCAT('Nome do Funcionário: ', VNomeFuncionario) AS Funcionario;

    -- Exibindo os projetos e as horas trabalhadas usando a junção dos dados contidos na tabela projetos e HorasTrabalhadas
    SELECT P.Nome_Projeto, H.Horas
    FROM Projetos
    JOIN HorasTrabalhadas H ON P.IdProjeto = H.fk_IdProjeto
    WHERE H.fk_IdFuncionario = p_IdFuncionario;

    -- Calculando o total de horas trabalhadas com a função soma(sum) e colocando retorno = 0 caso a linha esteja nula
    SELECT IFNULL(SUM(Horas), 0) INTO v_TotalHoras
    FROM HorasTrabalhadas
    WHERE fk_IdFuncionario = p_IdFuncionario;

    -- Exibindo o total de horas
    SELECT CONCAT('Total de Horas Trabalhadas: ', v_TotalHoras) AS TotalHoras;

END$$
-- Retornando o delimitador ao padrão
DELIMITER ;

-- Chamando função para teste
call funcionarioinfo(1);

-- DESAFIO #3:
/* Banco de dados relacionais seguem um modelo fixo de armazenar dados somente em tabelas
usando linhas, colunas e relacionamentos, com o uso exclusivo da linguagem SQL para gerenciar o banco e seus dados.

Banco de dados não relacionais ou NoSQL, tem diferentes tipos de modelos para armazenar dados 
como por exemplo: Documentos, grafos, chaves, pares, entre outros. 
Não usam necessariamente a linguagem SQL para gerenciamento, alguns SGBDs NoSQL possuem linguagem propria, com algumas proximidades ao SQL.
Em um cenario com grande volume de dados de diferentes formatos e sem necessidade de muitos relacionamentos, é mais viavel a utilização do NoSQL.
*/

-- DESAFIO #4: 
-- Ainda não possuo conhecimento em Oracle Forms e Reports


