README - AOP2 Banco de Dados de Precos de Combustiveis

Aluno: Gustavo Ferreira de Carvalho
Disciplina: Banco de Dados - ADS UVV
SGBD usado: PostgreSQL

Sobre o trabalho

Esse trabalho e a continuacao da AOP1, onde fiz o diagrama conceitual do banco de precos de combustiveis. Aqui eu converti esse diagrama pro modelo logico e implementei o banco de verdade no PostgreSQL, com dados reais coletados na regiao de Serra/ES.

Arquivos que estao na entrega

AOP2_PostgreSQL.sql - o script principal. Cria as tabelas, insere os dados e roda as 4 consultas pedidas no trabalho.

AOP2_Resultados_Consultas.xlsx - planilha com o resultado de cada consulta, uma aba pra cada uma. Isso e usado pra divulgar os precos pra comunidade, que e uma parte que o enunciado pede.

Como rodar o script

Precisa ter o PostgreSQL instalado. Primeiro cria um banco vazio:

CREATE DATABASE precos_combustiveis;

Depois roda o script nesse banco, pelo terminal:

psql -U seu_usuario -d precos_combustiveis -f AOP2_PostgreSQL.sql

As tabelas

Fiz 3 tabelas, seguindo o que desenhei no conceitual da AOP1.

combustivel guarda os tipos de combustivel monitorados (gasolina comum, gasolina aditivada, etanol e diesel). E uma tabela pequena, só pra não ficar repetindo o nome do combustivel em cada linha de preço.

posto guarda os dados de cada posto: razao social, nome fantasia, CNPJ, bandeira e o endereço completo.

coleta e a tabela principal. Cada linha ali e um preço que foi coletado, numa data, de um combustivel, em um posto. Ela se liga com as outras duas tabelas atraves de chave estrangeira (id_posto e id_combustivel).

Pra manter a integridade eu usei chave primaria nas 3 tabelas, chave estrangeira ligando coleta com posto e combustivel, campos obrigatorios marcados como NOT NULL, e o CNPJ do posto como UNIQUE (não pode repetir).

Sobre os dados usados

Peguei os precos direto da base aberta da ANP. Fiquei com 5 postos, em 4 bairros diferentes de Serra. São 4 tipos de combustivel e 5 coletas em datas diferentes pra cada combinação de posto e combustivel, dando 100 registros no total.

Um posto que eu tinha pego (Marlim Branco) acabou saindo do recorte final porque só tinha 2 registros na base, e o minimo pedido e 5. Tambem juntei Diesel S10 e Diesel S500 num tipo só de Diesel, pra bater com os 4 tipos que o enunciado pede.

As consultas

Consulta 1 pega o menor e o maior preço de cada combustivel, mostrando o posto, endereço, bairro e data de quando esse preço foi registrado. Se tiver empate no valor, aparece mais de uma linha.

Consulta 2 mostra, pra cada posto e cada combustivel, quantas coletas tem e qual e o preço medio.

Consulta 3 mostra so o preço mais recente de cada combustivel em cada posto, ou seja, o "preço atual".

Consulta 4 mostra a evolução do preço ao longo do tempo pra um combustivel especifico em um posto especifico, ordenado por data. No script deixei um exemplo fixo (gasolina comum no Auto Posto Lucas), mas dá pra trocar o posto e o combustivel direto no WHERE da consulta.

Sobre a planilha

O enunciado pede pra disponibilizar os resultados pra comunidade tambem fora do banco, entao gerei essa planilha com o resultado de cada consulta, cada uma na sua aba. E a partir dela que da pra montar os graficos de evolução de preço pedidos na etapa de divulgação.
