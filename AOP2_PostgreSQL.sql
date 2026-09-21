-- AOP2 — Projeto Lógico e Físico em PostgreSQL
-- Projeto: Preços de Combustíveis
-- Aluno: Gustavo Ferreira de Carvalho
--
-- Recorte da Planilha5:
-- Foram usados os 5 postos que possuem pelo menos 5 coletas.
-- O posto Marlim Branco possui somente 2 registros e foi excluído para
-- cumprir a regra mínima de 5 coletas por posto.
-- Os 4 tipos pedidos são: Gasolina Comum, Gasolina Aditivada, Etanol e Diesel.
-- DIESEL S10/S500 foi consolidado no tipo DIESEL.
-- Quando a fantasia não foi informada na fonte, a razão social foi usada
-- como valor de carga porque FANTASIA é NOT NULL no modelo.
-- CNPJ/CEP são armazenados sem pontuação e ESPIRITO SANTO como ES.

DROP TABLE IF EXISTS coleta;
DROP TABLE IF EXISTS posto;
DROP TABLE IF EXISTS combustivel;

CREATE TABLE combustivel (
    id_combustivel SERIAL PRIMARY KEY,
    tipo VARCHAR(30) NOT NULL,
    unidade_medida VARCHAR(10) NOT NULL
);

CREATE TABLE posto (
    id_posto SERIAL PRIMARY KEY,
    razao_social VARCHAR(150) NOT NULL,
    fantasia VARCHAR(150) NOT NULL,
    cnpj CHAR(14) NOT NULL UNIQUE,
    bandeira VARCHAR(50) NULL,
    logradouro VARCHAR(150) NOT NULL,
    numero VARCHAR(10) NULL,
    complemento VARCHAR(100) NULL,
    bairro VARCHAR(80) NOT NULL,
    municipio VARCHAR(80) NOT NULL,
    estado CHAR(2) NOT NULL,
    cep CHAR(8) NOT NULL
);

CREATE TABLE coleta (
    id_coleta SERIAL PRIMARY KEY,
    preco NUMERIC(6,3) NOT NULL,
    data_coleta DATE NOT NULL,
    id_posto INTEGER NOT NULL,
    id_combustivel INTEGER NOT NULL,
    CONSTRAINT fk_coleta_posto FOREIGN KEY (id_posto) REFERENCES posto(id_posto),
    CONSTRAINT fk_coleta_combustivel FOREIGN KEY (id_combustivel) REFERENCES combustivel(id_combustivel)
);

-- DADOS DE DOMÍNIO
INSERT INTO combustivel (id_combustivel, tipo, unidade_medida) VALUES (1, 'Gasolina Comum', 'R$/litro');
INSERT INTO combustivel (id_combustivel, tipo, unidade_medida) VALUES (2, 'Gasolina Aditivada', 'R$/litro');
INSERT INTO combustivel (id_combustivel, tipo, unidade_medida) VALUES (3, 'Etanol', 'R$/litro');
INSERT INTO combustivel (id_combustivel, tipo, unidade_medida) VALUES (4, 'Diesel', 'R$/litro');

-- DADOS DOS POSTOS
INSERT INTO posto (id_posto, razao_social, fantasia, cnpj, bandeira, logradouro, numero, complemento, bairro, municipio, estado, cep) VALUES (1, 'AUTO POSTO LUCAS - EPP.', 'AUTO POSTO LUCAS - EPP.', '17375525000104', 'ALE', 'AVENIDA ROMULO CASTELLO', '791', 'LOTES 20 A 23', 'CASTELANDIA', 'SERRA', 'ES', '29172620');
INSERT INTO posto (id_posto, razao_social, fantasia, cnpj, bandeira, logradouro, numero, complemento, bairro, municipio, estado, cep) VALUES (2, 'CENTRAL COMERCIO DE COMBUSTIVEIS LTDA', 'CENTRAL COMERCIO DE COMBUSTIVEIS LTDA', '22356015000120', 'IPIRANGA', 'AVENIDA ELDES SCHERRER SOUZA', '2100', ': POSTO;', 'CIVIT II', 'SERRA', 'ES', '29168060');
INSERT INTO posto (id_posto, razao_social, fantasia, cnpj, bandeira, logradouro, numero, complemento, bairro, municipio, estado, cep) VALUES (3, 'GEGEL AUTO POSTO LTDA', 'POSTO METRÓPOLES', '05738923000169', 'RAIZEN', 'AVENIDA CENTRAL B', 'S/N', 'QUADRAEC VII', 'CIVIT II', 'SERRA', 'ES', '29168071');
INSERT INTO posto (id_posto, razao_social, fantasia, cnpj, bandeira, logradouro, numero, complemento, bairro, municipio, estado, cep) VALUES (4, 'POSTO METROPOLITANO LTDA', 'POSTO TIMS', '01823633000162', 'IPIRANGA', 'VIA DOIS', '226', 'ANEXO QUADRA 03 MODULO 03', 'TIMS', 'SERRA', 'ES', '29161373');
INSERT INTO posto (id_posto, razao_social, fantasia, cnpj, bandeira, logradouro, numero, complemento, bairro, municipio, estado, cep) VALUES (5, 'REDE DE POSTOS SAGUI LTDA', 'REDE DE POSTOS SAGUI LTDA', '10197775000152', 'ATLÂNTICA', 'RUA EUCLIDES DA CUNHA', '421', NULL, 'SAO DIOGO I', 'SERRA', 'ES', '29163265');

-- COLETAS
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (1, 6.780, '2026-07-27', 1, 4);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (2, 6.780, '2026-08-04', 1, 4);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (3, 6.680, '2026-08-10', 1, 4);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (4, 6.680, '2026-08-18', 1, 4);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (5, 6.680, '2026-08-24', 1, 4);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (6, 4.390, '2026-07-27', 1, 3);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (7, 4.390, '2026-08-04', 1, 3);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (8, 4.390, '2026-08-10', 1, 3);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (9, 4.390, '2026-08-18', 1, 3);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (10, 4.390, '2026-08-24', 1, 3);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (11, 6.590, '2026-07-27', 1, 2);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (12, 6.290, '2026-08-04', 1, 2);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (13, 6.490, '2026-08-10', 1, 2);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (14, 6.490, '2026-08-18', 1, 2);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (15, 6.490, '2026-08-24', 1, 2);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (16, 6.390, '2026-07-27', 1, 1);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (17, 6.290, '2026-08-04', 1, 1);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (18, 6.290, '2026-08-10', 1, 1);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (19, 6.290, '2026-08-18', 1, 1);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (20, 6.290, '2026-08-24', 1, 1);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (21, 6.890, '2026-07-28', 2, 4);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (22, 6.890, '2026-08-03', 2, 4);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (23, 6.890, '2026-08-11', 2, 4);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (24, 6.890, '2026-08-17', 2, 4);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (25, 6.890, '2026-08-25', 2, 4);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (26, 4.590, '2026-07-28', 2, 3);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (27, 4.590, '2026-08-03', 2, 3);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (28, 4.590, '2026-08-11', 2, 3);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (29, 4.560, '2026-08-17', 2, 3);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (30, 4.490, '2026-08-25', 2, 3);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (31, 6.690, '2026-07-28', 2, 2);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (32, 6.690, '2026-08-03', 2, 2);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (33, 6.690, '2026-08-11', 2, 2);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (34, 6.690, '2026-08-17', 2, 2);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (35, 6.490, '2026-08-25', 2, 2);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (36, 6.490, '2026-07-28', 2, 1);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (37, 6.490, '2026-08-03', 2, 1);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (38, 6.490, '2026-08-11', 2, 1);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (39, 6.490, '2026-08-17', 2, 1);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (40, 6.290, '2026-08-25', 2, 1);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (41, 6.890, '2026-07-28', 3, 4);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (42, 6.890, '2026-08-03', 3, 4);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (43, 6.890, '2026-08-11', 3, 4);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (44, 6.890, '2026-08-17', 3, 4);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (45, 6.790, '2026-08-25', 3, 4);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (46, 4.690, '2026-07-28', 3, 3);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (47, 4.690, '2026-08-03', 3, 3);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (48, 4.690, '2026-08-11', 3, 3);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (49, 4.690, '2026-08-17', 3, 3);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (50, 4.690, '2026-08-25', 3, 3);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (51, 6.990, '2026-07-28', 3, 2);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (52, 6.990, '2026-08-03', 3, 2);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (53, 6.990, '2026-08-11', 3, 2);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (54, 6.790, '2026-08-17', 3, 2);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (55, 6.790, '2026-08-25', 3, 2);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (56, 6.490, '2026-07-28', 3, 1);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (57, 6.490, '2026-08-03', 3, 1);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (58, 6.490, '2026-08-11', 3, 1);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (59, 6.290, '2026-08-17', 3, 1);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (60, 6.290, '2026-08-25', 3, 1);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (61, 6.590, '2026-07-28', 4, 4);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (62, 6.590, '2026-08-03', 4, 4);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (63, 6.590, '2026-08-11', 4, 4);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (64, 6.590, '2026-08-17', 4, 4);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (65, 6.590, '2026-08-25', 4, 4);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (66, 4.490, '2026-07-28', 4, 3);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (67, 4.390, '2026-08-03', 4, 3);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (68, 4.390, '2026-08-11', 4, 3);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (69, 4.390, '2026-08-17', 4, 3);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (70, 4.390, '2026-08-25', 4, 3);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (71, 6.590, '2026-07-28', 4, 2);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (72, 6.450, '2026-08-03', 4, 2);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (73, 6.450, '2026-08-11', 4, 2);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (74, 6.450, '2026-08-17', 4, 2);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (75, 6.350, '2026-08-25', 4, 2);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (76, 6.390, '2026-07-28', 4, 1);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (77, 6.250, '2026-08-03', 4, 1);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (78, 6.250, '2026-08-11', 4, 1);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (79, 6.250, '2026-08-17', 4, 1);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (80, 6.150, '2026-08-25', 4, 1);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (81, 6.990, '2026-07-27', 5, 4);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (82, 6.990, '2026-08-04', 5, 4);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (83, 6.990, '2026-08-10', 5, 4);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (84, 6.990, '2026-08-18', 5, 4);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (85, 6.990, '2026-08-24', 5, 4);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (86, 4.790, '2026-07-27', 5, 3);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (87, 4.790, '2026-08-04', 5, 3);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (88, 4.790, '2026-08-10', 5, 3);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (89, 4.790, '2026-08-18', 5, 3);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (90, 4.790, '2026-08-24', 5, 3);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (91, 6.590, '2026-07-27', 5, 2);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (92, 6.590, '2026-08-04', 5, 2);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (93, 6.590, '2026-08-10', 5, 2);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (94, 6.490, '2026-08-18', 5, 2);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (95, 6.490, '2026-08-24', 5, 2);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (96, 6.390, '2026-07-27', 5, 1);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (97, 6.390, '2026-08-04', 5, 1);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (98, 6.390, '2026-08-10', 5, 1);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (99, 6.290, '2026-08-18', 5, 1);
INSERT INTO coleta (id_coleta, preco, data_coleta, id_posto, id_combustivel) VALUES (100, 6.290, '2026-08-24', 5, 1);

-- Sincronização das sequências SERIAL
SELECT setval(pg_get_serial_sequence('combustivel','id_combustivel'), (SELECT MAX(id_combustivel) FROM combustivel), true);
SELECT setval(pg_get_serial_sequence('posto','id_posto'), (SELECT MAX(id_posto) FROM posto), true);
SELECT setval(pg_get_serial_sequence('coleta','id_coleta'), (SELECT MAX(id_coleta) FROM coleta), true);

-- CONSULTA I — Menor e maior preço de cada tipo
WITH extremos AS (
    SELECT id_combustivel, MIN(preco) AS menor, MAX(preco) AS maior
    FROM coleta GROUP BY id_combustivel
)
SELECT p.fantasia AS nome_posto,
       CONCAT_WS(', ', p.logradouro, p.numero) AS endereco,
       p.bairro, c.tipo AS tipo_combustivel, co.preco AS valor_combustivel,
       co.data_coleta,
       CASE WHEN co.preco = e.menor THEN 'MENOR'
            WHEN co.preco = e.maior THEN 'MAIOR' END AS tipo_extremo
FROM coleta co
JOIN posto p ON p.id_posto = co.id_posto
JOIN combustivel c ON c.id_combustivel = co.id_combustivel
JOIN extremos e ON e.id_combustivel = co.id_combustivel
WHERE co.preco = e.menor OR co.preco = e.maior
ORDER BY c.tipo, tipo_extremo, co.preco, p.fantasia;

-- CONSULTA II — Quantidade de amostras e preço médio
SELECT p.fantasia AS nome_posto, p.bairro, c.tipo AS tipo_combustivel,
       ROUND(AVG(co.preco), 3) AS preco_medio,
       COUNT(co.id_coleta) AS quantidade_amostras
FROM coleta co
JOIN posto p ON p.id_posto = co.id_posto
JOIN combustivel c ON c.id_combustivel = co.id_combustivel
GROUP BY p.id_posto, p.fantasia, p.bairro, c.id_combustivel, c.tipo
ORDER BY p.fantasia, c.tipo;

-- CONSULTA III — Preço mais recente por posto e combustível
SELECT DISTINCT ON (p.id_posto, c.id_combustivel)
       p.fantasia AS nome_posto, p.bairro, c.tipo AS tipo_combustivel,
       co.preco AS valor_combustivel, co.data_coleta
FROM coleta co
JOIN posto p ON p.id_posto = co.id_posto
JOIN combustivel c ON c.id_combustivel = co.id_combustivel
ORDER BY p.id_posto, c.id_combustivel, co.data_coleta DESC, co.id_coleta DESC;

-- CONSULTA IV — Evolução do preço
-- Exemplo: Gasolina Comum no Auto Posto Lucas
SELECT p.fantasia AS nome_posto, p.bairro, c.tipo AS tipo_combustivel,
       co.preco AS valor_combustivel, co.data_coleta
FROM coleta co
JOIN posto p ON p.id_posto = co.id_posto
JOIN combustivel c ON c.id_combustivel = co.id_combustivel
WHERE p.id_posto = 1 AND c.id_combustivel = 1
ORDER BY co.data_coleta ASC;

-- VALIDAÇÃO
SELECT COUNT(*) AS total_postos FROM posto;
SELECT COUNT(*) AS total_combustiveis FROM combustivel;
SELECT COUNT(*) AS total_coletas FROM coleta;
SELECT p.fantasia AS nome_posto, COUNT(*) AS total_coletas
FROM coleta co JOIN posto p ON p.id_posto = co.id_posto
GROUP BY p.id_posto, p.fantasia ORDER BY p.fantasia;
