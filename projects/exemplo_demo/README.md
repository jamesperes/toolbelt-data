# 📊 Projeto: Exemplo Demo

**Projeto de exemplo para demonstrar a estrutura do Tollbelt-Data**

---

## 📋 Informações do Projeto

- **Nome**: Exemplo Demo
- **Descrição**: Projeto de demonstração com estructura completa
- **Status**: ✅ Ativo
- **Responsável**: [Seu nome aqui]
- **Última atualização**: Fevereiro 2026

---

## 📁 Estrutura

```
exemplo_demo/
├── README.md              # Este arquivo
├── playbooks/             # Guias de análise e regras de negócio
├── schemas/               # Definições de tabelas (CREATE TABLE)
├── examples/              # Amostras de dados (CSV)
└── queries/               # Templates e queries SQL
```

---

## 🎯 Objetivo

Este projeto demonstra como organizar dados de métricas para que modelos de IA possam:
- Entender a estrutura dos dados
- Gerar SQL queries válidas no AWS Athena
- Criar análises baseadas em regras de negócio

---

## 📐 Dados Disponíveis

### Tabelas
- **metrics**: Tabela principal com métricas de negócio

### Colunas Principais
| Campo | Tipo | Descrição |
|-------|------|-----------|
| id | STRING | ID único do registro |
| metric_name | STRING | Nome da métrica (revenue, users, etc) |
| metric_value | DECIMAL | Valor da métrica |
| dimension_1 | STRING | Primeira dimensão (region, product, etc) |
| dimension_2 | STRING | Segunda dimensão |
| timestamp_utc | TIMESTAMP | Quando ocorreu o evento |
| year, month, day | INT | Partições para performance |

---

## 📚 Playbooks Disponíveis

### Playbooks em Desenvolvimento

- [ ] `playbook_metricas_basicas.md` - Análise de métricas principais
- [ ] `playbook_comparacoes.md` - Comparações período a período
- [ ] `playbook_tendencias.md` - Tendências e crescimento

Comece duplicando o template `playbooks/TEMPLATE.md` para criar novos playbooks.

---

## 💡 Como Usar Este Projeto

### 1️⃣ Para Humanos

- Abra este README
- Consulte os playbooks em `playbooks/`
- Veja exemplos de SQL em `queries/`
- Compartilhe os playbooks com a IA

### 2️⃣ Para IA (Claude, ChatGPT, etc)

Instrua a IA assim:

```
Você é um assistente especializado em análise de dados.
Antes de gerar SQL queries:

1. Consulte: projects/exemplo_demo/schemas/ (para entender as tabelas)
2. Consulte: projects/exemplo_demo/playbooks/ (para regras de negócio)
3. Consulte: projects/exemplo_demo/examples/ (para exemplos de dados)
4. Use os templates de query em: projects/exemplo_demo/queries/

Siga os guidelines do README principal em relação a formato de resposta e checklist.
```

---

## 📖 Exemplos Rápidos

### Query: Receita por Região
```sql
SELECT 
    dimension_1 as region,
    SUM(metric_value) as total_revenue
FROM metrics
WHERE metric_name = 'revenue'
  AND year = 2024
GROUP BY dimension_1
ORDER BY total_revenue DESC
```

### Query: Top 10 Produtos
```sql
SELECT 
    dimension_2 as product,
    SUM(metric_value) as total
FROM metrics
WHERE metric_name = 'revenue'
  AND year = 2024
GROUP BY dimension_2
ORDER BY total DESC
LIMIT 10
```

---

## 🔄 Workflow Típico

```
1. Humano tem uma pergunta: 
   "Qual foi a receita por região em janeiro?"

2. Consulta os playbooks:
   → Descobre regras (filtros obrigatórios, tratamento de dados)

3. Instrui a IA com:
   - Dados do projeto (schemas, exemplos)
   - O que quer analisar
   - Referência ao playbook

4. IA gera SQL baseado em:
   - Schema (tabelas, colunas)
   - Playbook (regras de negócio)
   - Exemplos (formato real dos dados)

5. Query é executada no Athena
6. Resultado é integrado em dashboard/relatório
```

---

## 🚀 Próximos Passos para Este Projeto

- [ ] Criar playbook_metricas_basicas.md
- [ ] Adicionar mais exemplos em examples/
- [ ] Documentar gotchas e cuidados especiais
- [ ] Validar queries com dados reais
- [ ] Expandir templates de queries

---

## 📞 Como Adicionar Dados

### Novos Schemas
1. Copie `schemas/TEMPLATE.sql`
2. Renomeie para `schemas/sua_tabela.sql`
3. Edite com suas colunas reais

### Novos Playbooks
1. Copie `playbooks/TEMPLATE.md`
2. Renomeie para `playbooks/seu_playbook.md`
3. Preencha com regras específicas

### Novos Exemplos
1. Coloque arquivos CSV em `examples/`
2. Nomeie como `NOME_DESCRITIVO.csv`

### Novas Queries
1. Copie `queries/TEMPLATE.sql`
2. Renomeie para `queries/descricao_query.sql`
3. Customize com sua lógica

---

## 🔗 Referências

- [README Principal](../../README.md) - Visão geral do Tollbelt-Data
- [Guia para IA](../../AI_QUICK_REFERENCE.md) - Referência rápida
- [Documentação AWS Athena](https://docs.aws.amazon.com/athena/)
- [SQL Cheatsheet](https://www.postgresql.org/docs/current/sql.html)

---

**Versão**: 0.1 | **Criado**: Fevereiro 2026
