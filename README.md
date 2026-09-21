# ⛽ AOP2 — Banco de Dados de Preços de Combustíveis

Projeto desenvolvido para a disciplina de **Banco de Dados — ADS UVV**, dando continuidade à AOP1.

> 🗄️ **SGBD:** PostgreSQL  
> 👨‍💻 **Aluno:** Gustavo Ferreira de Carvalho  
> 📍 **Região dos dados:** Serra/ES

---

## 📌 Sobre o trabalho

Na AOP1 foi desenvolvido o **diagrama conceitual** do banco de preços de combustíveis.

Nesta etapa, o modelo foi convertido para o **modelo lógico** e implementado de fato no **PostgreSQL**, utilizando dados reais coletados na região de Serra/ES.

Além do banco, os resultados das consultas foram organizados em uma planilha para facilitar a divulgação dos preços.

---

## 📂 Arquivos

| Arquivo | Descrição |
|---|---|
| `AOP2_PostgreSQL.sql` | 🐘 Script principal do banco. Cria as tabelas, insere os dados e executa as 4 consultas do trabalho. |
| `AOP2_Resultados_Consultas.xlsx` | 📊 Planilha com os resultados das consultas, organizada em abas. |

---

## 🚀 Como executar

É necessário ter o **PostgreSQL** instalado.

### 1. Criar o banco

```sql
CREATE DATABASE precos_combustiveis;
```

### 2. Executar o script

Pelo terminal:

```bash
psql -U seu_usuario -d precos_combustiveis -f AOP2_PostgreSQL.sql
```

Depois disso, o banco estará criado com suas tabelas, dados e consultas.

---

## 🗃️ Estrutura do banco

O banco possui **3 tabelas**, seguindo o modelo desenvolvido na AOP1.

### ⛽ `combustivel`

Armazena os tipos de combustível monitorados:

- Gasolina comum
- Gasolina aditivada
- Etanol
- Diesel

A ideia é evitar repetir o nome do combustível em cada registro de preço.

### 🏪 `posto`

Armazena os dados dos postos:

- Razão social
- Nome fantasia
- CNPJ
- Bandeira
- Endereço completo

### 📈 `coleta`

É a tabela principal do banco.

Cada registro representa um **preço coletado**, relacionando:

- Data da coleta
- Combustível
- Posto
- Preço

A tabela se relaciona com `posto` e `combustivel` através das chaves estrangeiras `id_posto` e `id_combustivel`.

### 🔐 Integridade dos dados

Foram utilizadas:

- 🔑 Chaves primárias nas 3 tabelas
- 🔗 Chaves estrangeiras entre `coleta`, `posto` e `combustivel`
- ✅ Campos obrigatórios com `NOT NULL`
- 🆔 `UNIQUE` no CNPJ dos postos

---

## 📊 Dados utilizados

Os preços foram obtidos diretamente da **base aberta da ANP**.

O recorte final possui:

- 🏪 **5 postos**
- 📍 **4 bairros diferentes de Serra**
- ⛽ **4 tipos de combustível**
- 📅 **5 datas de coleta** para cada combinação de posto e combustível
- 📦 **100 registros** no total

Um dos postos inicialmente selecionados, **Marlim Branco**, foi retirado do recorte final porque possuía apenas 2 registros na base, enquanto o mínimo necessário era 5.

Também foram agrupados **Diesel S10** e **Diesel S500** como um único tipo de **Diesel**, seguindo os 4 tipos de combustível definidos no enunciado.

---

## 🔎 Consultas

O script possui 4 consultas principais:

### 1️⃣ Menor e maior preço

Mostra o **menor e o maior preço de cada combustível**, incluindo:

- Posto
- Endereço
- Bairro
- Data da coleta

Em caso de empate, mais de uma linha pode ser retornada.

### 2️⃣ Média por posto e combustível

Mostra, para cada posto e combustível:

- Quantidade de coletas
- Preço médio

### 3️⃣ Preço mais recente

Mostra o registro mais recente de cada combustível em cada posto, representando o **preço atual dentro dos dados utilizados no projeto**.

### 4️⃣ Evolução do preço

Mostra a evolução do preço ao longo do tempo para um combustível específico em um posto específico, ordenada por data.

No script existe um exemplo com:

```text
Gasolina comum
Auto Posto Lucas
```

Os valores podem ser alterados diretamente no `WHERE` da consulta.

---

## 📊 Resultados e divulgação

Os resultados das consultas também foram disponibilizados em:

`AOP2_Resultados_Consultas.xlsx`

A planilha possui **uma aba para cada consulta**, facilitando a visualização dos dados fora do banco.

A partir desses resultados também foram montados os **gráficos de evolução de preços**, utilizados na etapa de divulgação do projeto.

---

## 🛠️ Tecnologias

- 🐘 PostgreSQL
- 🧮 SQL
- 📊 Microsoft Excel
- 📋 Dados abertos da ANP

---

> 📚 Projeto acadêmico desenvolvido para a disciplina de Banco de Dados — ADS UVV.
