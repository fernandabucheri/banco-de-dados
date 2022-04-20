CREATE DATABASE RODOVIARIA;

/* Rodoviária ( IDRodoviaria , nome , CNPJ ) */
CREATE TABLE Rodoviaria (
	IDRodoviaria INTEGER,
	nome VARCHAR(30),
	CNPJ DOUBLE,
	PRIMARY KEY (IDRodoviaria)
	);

/* Passageiro ( IDPassageiro , CPF , nome ) */
CREATE TABLE Passageiro (
	IDPassageiro INTEGER,
	CPF DOUBLE,
	nome VARCHAR(25),
	PRIMARY KEY (IDPassageiro)
	);

/* Bagagem ( IDBagagem , # IDPassageiro ) */
CREATE TABLE Bagagem (
	IDBagagem INTEGER,
	IDPassageiro INTEGER,
	PRIMARY KEY (IDBagagem),
	FOREIGN KEY (IDPassageiro) REFERENCES Passageiro(IDPassageiro)
	);

/* EmpresaOnibus ( IDEmpresa , nome , CNPJ ) */
CREATE TABLE EmpresaOnibus (
	IDEmpresa INTEGER,
	nome VARCHAR(25),
    CNPJ DOUBLE,
	PRIMARY KEY (IDEmpresa)
	);

/* Onibus ( IDOnibus , modelo , capacidadeMax , # IDempresa ) */
CREATE TABLE Onibus (
	IDOnibus INTEGER,
	modelo VARCHAR(25),
	capacidadeMax INTEGER,
	IDempresa INTEGER,
	PRIMARY KEY (IDOnibus),
	FOREIGN KEY (IDempresa) REFERENCES EmpresaOnibus(IDEmpresa)
	);

/* Motorista ( IDMotorista , nome , CNH) */
CREATE TABLE Motorista (
	IDMotorista INTEGER,
	nome VARCHAR(25),
	CNH DOUBLE,
	PRIMARY KEY (IDMotorista)
	);

/* Viagem ( IDViagem , origem , destino , horarioEmbarque , horarioDesembarque , # IDonibus , # IDmotorista , # IDRodoviaria_Partida , # IDRodoviaria_Chegada ) */
CREATE TABLE Viagem (
	IDViagem INTEGER,
	origem VARCHAR(30),
	destino VARCHAR(30),
	horarioEmbarque TIME,
	horarioDesembarque TIME,
	IDonibus INTEGER,
	IDmotorista INTEGER,
	IDRodoviaria_Partida INTEGER,
	IDRodoviaria_Chegada INTEGER,
	PRIMARY KEY (IDViagem),
	FOREIGN KEY (IDonibus) REFERENCES Onibus(IDonibus),
	FOREIGN KEY (IDmotorista) REFERENCES Motorista(IDmotorista),
	FOREIGN KEY (IDRodoviaria_Partida) REFERENCES Rodoviaria(IDRodoviaria),
	FOREIGN KEY (IDRodoviaria_Chegada) REFERENCES Rodoviaria(IDRodoviaria)
	);

/* Loja ( IDLoja, nome, CNPJ, segmento ) */
CREATE TABLE Loja (
	IDLoja INTEGER,
	nome VARCHAR(30),
	CNPJ DOUBLE,
	segmento VARCHAR(30),
	PRIMARY KEY (IDLoja)
	);

/* Lojas_Rodoviaria (#IDLoja , #IDRodoviaria ) */
CREATE TABLE Lojas_Rodoviaria (
	IDLoja INTEGER,
	IDRodoviaria INTEGER,
	PRIMARY KEY (IDLoja, IDRodoviaria),
	FOREIGN KEY (IDLoja) REFERENCES Loja(IDLoja),
	FOREIGN KEY (IDRodoviaria) REFERENCES Rodoviaria(IDRodoviaria)
	);

/* Equipe ( IDEquipe , função, # IDRodoviaria ) */
CREATE TABLE Equipe (
	IDEquipe INTEGER,
	função VARCHAR(40),
	IDRodoviaria INTEGER,
	PRIMARY KEY (IDEquipe),
	FOREIGN KEY (IDRodoviaria) REFERENCES Rodoviaria(IDRodoviaria)
	);

/* FuncionarioLoja ( IDFuncionarioLoja , #IDloja , nome , CPF , salario , fun ção) */
CREATE TABLE FuncionarioLoja (
	IDFuncionarioLoja INTEGER,
	IDLoja INTEGER,
	nome VARCHAR(25),
	CPF DOUBLE,
	salario FLOAT,
	função VARCHAR(30),
	PRIMARY KEY (IDFuncionarioLoja),
	FOREIGN KEY (IDLoja) REFERENCES Loja(IDLoja)
	);

/* FuncionarioEquipe ( IDFuncionarioEquipe , nome , CPF , salario , # IDEquipe ) */
CREATE TABLE FuncionarioEquipe (
	IDFuncionarioEquipe INTEGER,
	nome VARCHAR(25),
	CPF DOUBLE,
	salario FLOAT,
	IDEquipe INTEGER,
	PRIMARY KEY (IDFuncionarioEquipe),
	FOREIGN KEY (IDEquipe) REFERENCES Equipe(IDEquipe)
	);

/* Atendimentos ( IDAtendimento , dataAtendimento , # IDFuncionario ) */
CREATE TABLE Atendimentos (
	IDAtendimento INTEGER,
	dataAtendimento DATE,
	IDFuncionario INTEGER,
	PRIMARY KEY (IDAtendimento),
	FOREIGN KEY (IDFuncionario) REFERENCES FuncionarioEquipe(IDFuncionarioEquipe)
	);

/* Passagem ( IDPassagem , # IDViagem , # IDPassageiro , poltrona , # IDAtendimento ) */
CREATE TABLE Passagem (
	IDPassagem INTEGER,
	IDViagem INTEGER,
	IDPassageiro INTEGER,
	poltrona INTEGER,
	IDAtendimento INTEGER,
	PRIMARY KEY (IDPassagem),
	FOREIGN KEY (IDViagem) REFERENCES Viagem(IDViagem),
	FOREIGN KEY (IDPassageiro) REFERENCES Passageiro(IDPassageiro),
	FOREIGN KEY (IDAtendimento) REFERENCES Atendimentos(IDAtendimento)
	);
    
/* Cadastro de informações */
/* Rodoviária ( IDRodoviaria , nome , CNPJ ) */
INSERT INTO Rodoviaria VALUES 
	(1, 'RodoviariaSP', 61007184751), 
	(2, 'RodoviariaSJC', 38236015844), 
    (3, 'RodoviariaCaragua', 43775503653), 
    (4, 'RodoviariaRJ', 08764288267), 
    (5, 'RodoviariaTaubate', 34145254005), 
    (6, 'RodoviariaJau', 50758625262), 
    (7, 'RodoviariaSãoCarlos', 47414266618), 
    (8, 'RodoviariaBauru', 36837884825), 
    (9, 'RodoviariaAraraquara', 68624250480), 
    (10, 'RodoviariaSantos', 17431182445);

/* Passageiro ( IDPassageiro , CPF , nome ) */
INSERT INTO Passageiro VALUES 
	(1, 45461125720, 'Maria'), 
	(2, 55621067606, 'Lilian'), 
	(3, 42245256247, 'Gustavo'), 
	(4, 76788217266, 'Marcos'), 
	(5, 11170544787, 'Magno'), 
	(6, 28227750612, 'Melissa'), 
	(7, 60730724620, 'Fernanda'), 
	(8, 25550745515, 'Tiago'), 
	(9, 28344143780, 'Flávia'), 
	(10, 87666156440, 'Pedro'), 
	(11, 67014532135, 'Aaron');

/* Bagagem ( IDBagagem , # IDPassageiro ) */
INSERT INTO Bagagem VALUES 
	(1, 1), 
	(2, 1), 
	(3, 2), 
	(4, 3), 
	(5, 4), 
	(6, 5), 
	(7, 6), 
	(8, 6), 
	(9, 7), 
	(10, 8), 
	(11, 8), 
	(12, 9), 
	(13, 10), 
	(14, 11), 
	(15, 11);

/* EmpresaOnibus ( IDEmpresa , nome , CNPJ ) */
INSERT INTO EmpresaOnibus VALUES 
	(1, 'EmpresaUm', 38703781326), 
	(2, 'EmpresaDois', 71815874501), 
	(3, 'EmpresaTres', 24607003586), 
	(4, 'EmpresaQuatro', 37611384754), 
	(5, 'EmpresaCinco', 34503326463), 
	(6, 'EmpresaSeis', 41777761350), 
	(7, 'EmpresaSete', 51206117853), 
	(8, 'EmpresaOito', 13502370746), 
	(9, 'EmpresaNove', 55444688560), 
	(10, 'EmpresaDez', 03463527151);

/* Onibus ( IDOnibus , modelo , capacidadeMax , # IDempresa ) */
INSERT INTO Onibus VALUES 
	(1, 'Mercedes Benz', 50, 1), 
    (2, 'Volkswagen', 60, 10), 
    (3, 'Marcopolo', 45, 7), 
    (4, 'Iveco', 50, 6), 
    (5, 'Volvo', 47, 5), 
    (6, 'Agrale', 50, 3), 
    (7, 'Scania', 60, 2), 
    (8, 'Jimbei', 55, 4), 
    (9, 'International', 57, 8), 
    (10, 'Versatile', 50, 9);

/* Motorista ( IDMotorista , nome , CNH) */
INSERT INTO Motorista VALUES 
	(1, 'Bernardo', 08442668378), 
    (2, 'Luis', 27820286075), 
    (3, 'Guilherme', 45806147888), 
    (4, 'Nathalia', 30188617372), 
    (5, 'Vitor', 61708774725), 
    (6, 'Luísa', 33514184155), 
    (7, 'Alberto', 42501358068), 
    (8, 'Bruna', 26563335726), 
    (9, 'Renata', 58735100121), 
    (10, 'Tereza', 64360646752);

/* Viagem ( IDViagem , origem , destino , horarioEmbarque , horarioDesembarque , #IDonibus , #IDmotorista , # IDRodoviaria_Partida ,# IDRodoviaria_Chegada */
INSERT INTO Viagem VALUES 
	(1, 'São Paulo', 'São José dos Campos', 140000, 153000, 1, 1, 1, 2), 
    (2, 'Rio de Janeiro', 'São Paulo', 071500, 131500, 2, 2, 4, 1), 
    (3, 'Santos', 'Bauru', 160000, 231000, 3, 3, 10, 8), 
    (4, 'Taubate', 'Araraquara', 081000, 153000, 4, 4, 5, 9), 
    (5, 'Caraguatatuba', 'São Paulo', 064000, 094000, 5, 5, 3, 1), 
    (6, 'São Carlos', 'Araraquara', 151000, 160000, 6, 6, 7, 9), 
    (7, 'Jau', 'Bauru', 094000, 105000, 7, 7, 6, 8), 
    (8, 'Araraquara', 'Santos', 072000, 140000, 8, 8, 9, 10), 
    (9, 'São José dos Campos', 'Taubate ', 094500, 104500, 9, 9, 2, 5), 
    (10, 'São Carlos', 'São Paulo', 125000, 170500, 10, 10, 7, 1);

/* Loja ( IDLoja , nome , CNPJ , segmento ) */
INSERT INTO Loja VALUES 
	(1, 'LanchoneteUm', 18002343233, 'Alimentação'),
	(2, 'LanchoneteDois', 00217685101, 'Alimentação'), 
    (3, 'LanchoneteTres', 24780088551, 'Alimentação') ,
	(4, 'LanchoneteQuatro', 74581772262, 'Alimentação'), 
	(5, 'LanchoneteCinco', 00865504573, 'Alimentação') ,
	(6, 'LanchoneteSeis', 76532126784, 'Alimentação'), 
	(7, 'LanchoneteSete', 18051327482, 'Alimentação') ,
	(8, 'LanchoneteOito', 61036438156, 'Alimentação'), 
	(9, 'LanchoneteNove', 57766571514, 'Alimentação') ,
	(10, 'LanchoneteDez', 63727065471, 'Alimentação'), 
	(11, 'LanchoneteOnze', 16514014087, 'Alimentação') ,
	(12, 'LanchoneteDoze', 83465705652, 'Alimentação');

/* Lojas_Rodoviaria (# IDLoja ,# IDRodoviaria ) */
INSERT INTO Lojas_Rodoviaria VALUES 
	(1, 1), 
    (2, 2), 
    (3, 3), 
    (4, 4), 
    (5, 5), 
    (6, 6), 
    (7, 7), 
    (8, 8), 
    (9, 9), 
    (10, 10), 
    (11, 7), 
    (12, 6);

/* Equipe ( IDEquipe , fun ção, # IDRodoviaria ) */
INSERT INTO Equipe VALUES 
	(1, 'Atendimento ao cliente', 1), 
    (2, 'Atendimento ao cliente', 2), 
    (3, 'Atendimento ao cliente', 3), 
    (4, 'Atendimento ao cliente', 4), 
    (5, 'Atendimento ao cliente', 5), 
    (6, 'Atendimento ao cliente', 6), 
    (7, 'Atendimento ao cliente', 7), 
    (8, 'Atendimento ao cliente', 8), 
    (9, 'Atendimento ao cliente', 9), 
    (10, 'Atendimento ao cliente', 10), 
    (11, 'Limpeza', 1), 
    (12, 'Limpeza', 2), 
    (13, 'Limpeza', 3), 
    (14, 'Limpeza', 4), 
    (15, 'Limpeza', 5), 
    (16, 'Limpeza', 6), 
    (17, 'Limpeza', 7), 
    (18, 'Limpeza', 8), 
    (19, 'Limpeza', 9), 
    (20, 'Limpeza', 10);

/* FuncionarioLoja ( IDFuncionarioLoja , # IDloja , nome , CPF , salario , fun ção) */
INSERT INTO FuncionarioLoja VALUES 
	(1, 1, 'Olivia', 20223047248, 1000.00, 'Atendimento'), 
	(2, 2, 'Nubia', 58533683060, 1000.00, 'Atendimento'), 
	(3, 3, 'Gabriel', 51311016782, 1000.00, 'Atendimento'), 
	(4, 4, 'Lucas', 31328070422, 1000.00, 'Atendimento'), 
	(5, 5, 'Renata', 86375044540, 1000.00, 'Atendimento'), 
	(6, 6, 'Helena', 46637308730, 1000.00, 'Atendimento'), 
	(7, 7, 'Bruna', 45522771060, 1000.00, 'Atendimento'), 
	(8, 8, 'Camilla', 46476845107, 1000.00, 'Atendimento'), 
	(9, 9, 'Marcela', 44804065580, 1000.00, 'Atendimento'), 
	(10, 10, 'Marcell', 08183175218, 1000.00, 'Atendimento'), 
	(11, 11, 'Rafael', 35032770208, 1000.00, 'Atendimento'), 
	(12, 12, 'Alice', 32831162370, 1000.00, 'Atendimento'), 
	(13, 1, 'Jonathan', 32845846804, 1000.00, 'Cozinheiro (a)') ,
	(14 , 2, 'Gilberto', 43252507745 , 1000.00, 'Cozinheiro(a)'), 
	(15, 3, 'Julio', 63682262646, 1000.00, 'Cozinheiro (a)') ,
	(16 , 4, 'Alessandra', 62752451076 , 1000.00, 'Cozinheiro(a)'), 
	(17, 5, 'Renato', 80756245125, 1000.00, 'Cozinheiro (a)') ,
	(18 , 6, 'Luan', 14861663345 , 1000.00, 'Cozinheiro(a)'), 
	(19, 7, 'Vanessa', 43770746713, 1000.00, 'Cozinheiro (a)') ,
	(20 , 8, 'Veronica', 31215527400 , 1000.00, 'Cozinheiro(a)'), 
	(21, 9, 'João', 21106188677 , 1000.00, 'Cozinheiro(a)');

/* FuncionarioEquipe ( IDFuncionarioEquipe , nome , CPF , salario , # IDEquipe ) */
INSERT INTO FuncionarioEquipe VALUES 
	(1, 'Suellen', 10123755624, 1000.00, 1), 
    (2, 'Lucas', 87762730387, 1000.00, 2), 
    (3, 'Nathan', 46832020722, 1000.00, 3), 
    (4, 'Flávia', 00645316503, 1000.00, 4), 
    (5, 'Ellen', 26857576746, 1000.00, 5), 
    (6, 'Roberta', 81010634255, 1000.00, 6), 
    (7, 'Tiago', 72672440468, 1000.00, 7), 
    (8, 'Mateus', 67020520734, 1000.00, 8), 
    (9, 'Julio', 10235820204, 1000.00, 9), 
    (10, 'Marlene', 57205804167, 1000.00, 10), 
    (11, 'Caio', 24536843280, 1000.00, 11), 
    (12, 'Priscila', 87483286734, 1000.00, 12), 
    (13, 'Nadir', 28262863783, 1000.00, 13), 
    (14, 'Roberto', 10780063544, 1000.00, 14), 
    (15, 'Luis', 40843384153, 1000.00, 15), 
    (16, 'Renata', 37245025684, 1000.00, 16), 
    (17, 'Rebeca', 62767816401, 1000.00, 17), 
    (18, 'Mario', 41552576521, 1000.00, 18), 
    (19, 'Vagner', 62804161040, 1000.00, 19),
    (20, 'Gabriela', 48445021814, 1000.00, 20);

/* Atendimentos ( IDAtendimento , dataAtendimento , # IDFuncionario ) */
INSERT INTO Atendimentos VALUES 
	(1, '2020-11-01', 1), 
    (2, '2020-11-03', 2), 
    (3, '2020-11-04', 3), 
    (4, '2020-11-05', 4), 
    (5, '2020-10-12', 5), 
    (6, '2020-10-19', 6), 
    (7, '2020-10-20', 7), 
    (8, '2020-10-21', 8), 
    (9, '2020-10-31', 9), 
    (10, '2020-12-09', 10), 
    (11, '2020-12-15', 4), 
    (12, '2020-12-18', 4), 
    (13, '2021-01-09', 1), 
    (14, '2021-01-17', 3), 
    (15, '2021-01-21', 7), 
    (16, '2021-01-22', 8), 
    (17, '2021-02-09', 8), 
    (18, '2021-02-10', 7), 
    (19, '2021-02-17', 10);

/* Passagem ( IDPassagem , # IDViagem , # IDPassageiro , poltrona , # IDAtendimento ) */
INSERT INTO Passagem VALUES 
	(1, 1, 10, 5, 1), 
    (2, 2, 9, 8, 2), 
    (3, 3, 8, 9, 3), 
    (4, 4, 7, 5, 4), 
    (5, 5, 6, 1, 5), 
    (6, 6, 5, 15, 6), 
    (7, 7, 4, 7, 7), 
    (8, 8, 3, 12, 8),
    (9, 9, 2, 4, 9), 
    (10, 10, 1, 18, 10);

/* Consultas */
/* Exibir o nome do funcionário , o número da equipe que ele pertence e qual a sua função */
SELECT nome, FuncionarioEquipe.IDEquipe, função
FROM FuncionarioEquipe, Equipe
WHERE FuncionarioEquipe.IDEquipe = Equipe.IDEquipe;

/* Exibir o ID das passagens que foram compradas em 2020 na rodoviariaSãoCarlos */
SELECT IDPassagem
FROM Passagem, Viagem, Atendimentos
WHERE Passagem.IDViagem = Viagem.IDViagem
	AND Viagem.IDRodoviaria_Partida = 7
	AND Atendimentos.IDAtendimento = Passagem.IDAtendimento
	AND YEAR(Atendimentos.dataAtendimento) = '2020';

/* Exibir o nome do funcionário, a função dele, a loja que ele trabalha e o segmento */
SELECT FuncionarioLoja.nome, FuncionarioLoja.função, Loja.nome, Loja.segmento
FROM FuncionarioLoja, Loja
WHERE FuncionarioLoja.IDloja = Loja.IDLoja;

/* Exibir ID da passagem, nome do passageiro que possui essa passagem, origem e o destino da viagem e o nome do atendente que vendeu a passagem 
Serão consideradas apenas as passagens com ID entre 3 e 7*/
SELECT Passagem.IDPassagem, Passageiro.nome, Viagem.origem, Viagem.destino, FuncionarioEquipe.nome
FROM Passagem, Viagem, Passageiro, Atendimentos, FuncionarioEquipe
WHERE Passagem.IDViagem = Viagem.IDViagem
	AND Passagem.IDPassageiro = Passageiro.IDPassageiro
	AND Passagem.IDAtendimento = Atendimentos.IDAtendimento
	AND Atendimentos.IDFuncionario = FuncionarioEquipe.IDFuncionarioEquipe
	AND Passagem.IDPassagem BETWEEN '3'
		AND '7';

/* Exibir a origem e destino* da viagem, nome do motorista, ID do ônibus e o modelo do ônibus que realizou a viagem
*Serão considerados apenas as viagens que tem como destino a cidade de São Paulo */
SELECT Viagem.Origem, Viagem.Destino, Motorista.nome, Onibus.IDOnibus, Onibus.modelo
FROM Viagem, Motorista, Onibus
WHERE Viagem.destino LIKE 'São Paulo'
	AND Viagem.IDMotorista = Motorista.IDMotorista
	AND Viagem.IDOnibus = Onibus.IDOnibus;

/* Exibir o id da passagem do passageiro */
SELECT nome, IDViagem
FROM passageiro
LEFT JOIN passagem ON passageiro.IDPassageiro = passagem.IDPassageiro
ORDER BY passageiro.nome;

/* Exibir o id da bagagem do passageiro */
SELECT nome, IDBagagem
FROM passageiro
LEFT JOIN bagagem ON passageiro.IDPassageiro = bagagem.IDPassageiro
ORDER BY passageiro.nome;

/* Busca pelas empresas cuja soma da capacidade de seus ônibus seja maior que 49 organizadas pelo id da empresa.*/
SELECT empresaonibus.nome, SUM(capacidadeMax)
FROM onibus, empresaonibus
WHERE empresaonibus.IDEmpresa = onibus.IDempresa
GROUP BY empresaonibus.IDEmpresa
HAVING SUM(capacidadeMax) > 49
ORDER BY empresaonibus.IDEmpresa;

/* Busca pelo numero de lojas na rodovi ária , por segmento , cujo número de lojas do ramo seja maior que 2. */
SELECT COUNT(segmento)
FROM loja
GROUP BY segmento
HAVING COUNT(segmento) > 2
ORDER BY segmento;

/* Busca pelas rodoviárias cujo número de lojas é maior que 1 */
SELECT rodoviaria.IDRodoviaria, rodoviaria.nome, COUNT(IDLoja)
FROM lojas_rodoviaria, rodoviaria
WHERE lojas_rodoviaria.IDRodoviaria = rodoviaria.IDRodoviaria
GROUP BY rodoviaria.IDRodoviaria
HAVING COUNT(IDLoja) > 1
ORDER BY rodoviaria.IDRodoviaria;

/* Mostra a soma dos salários dos funcionários das lojas das rodoviárias onde a soma dos salários é acima de 1100. */
SELECT rodoviaria.IDRodoviaria, rodoviaria.nome, SUM(salario)
FROM funcionarioloja, lojas_rodoviaria, rodoviaria
WHERE funcionarioloja.IDLoja = lojas_rodoviaria.IDLoja
	AND lojas_rodoviaria.IDRodoviaria = rodoviaria.IDRodoviaria
GROUP BY rodoviaria.IDRodoviaria
HAVING SUM(salario) > 1100
ORDER BY rodoviaria.IDRodoviaria;

/* Exibir o nome do passageiro (a) que possui mais que 1 bagagem */
SELECT nome
FROM Passageiro, Bagagem
WHERE Bagagem.IDPassageiro = Passageiro.IDPassageiro
GROUP BY nome
HAVING COUNT(Bagagem.IDBagagem) > 1
ORDER BY nome;