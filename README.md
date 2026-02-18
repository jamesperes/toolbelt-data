# 🦇 Tollbelt-Data

**O cinto de ferramentas do Batman para análise de dados**

---

## 📖 PARTE 1: GUIA PARA HUMANOS

### 🎯 O que é?

Tollbelt-Data é um projeto que utiliza Inteligência Artificial para democratizar a análise de dados. O objetivo é permitir que qualquer pessoa (mesmo sem conhecimento avançado em SQL) possa explorar métricas e gerar queries no AWS Athena através de playbooks que ensinam à IA como entender sua estrutura de dados.

### ✨ Recursos Principais

- **Playbooks de IA**: Guias estruturados que ensinam à IA sobre seus dados
- **Geração Automática de SQL**: A IA gera queries Athena baseado em seus dados
- **Análise de Métricas**: Suporte a análise de métricas de diferentes fontes
- **Exemplos CSV**: A IA aprende com exemplos reais de seus dados

### 🚀 Como Começar

#### Pré-requisitos
- AWS Athena configurado
- Acesso aos dados em métricas
- (Opcional) Modelo de IA configurado (Claude, ChatGPT, etc)

#### Estrutura de Pastas

**Raiz do Projeto:**
```
tollbelt-data/
├── README.md                    # Este arquivo (visão geral)
├── AI_QUICK_REFERENCE.md        # Referência para IAs
├── projects/                    # Pasta com todos os projetos de dados
│   ├── exemplo_demo/            # Projeto de demonstração
│   ├── seu_projeto_1/           # Seu projeto aqui
│   └── seu_projeto_2/           # Próximo projeto aqui
```

**Cada Projeto (ex: `projects/exemplo_demo/`):**
```
seu_projeto/
├── README.md            # Documentação do projeto
├── playbooks/           # Guias de negócio específicas do projeto
├── schemas/             # Tabelas deste projeto
├── examples/            # Exemplos de dados deste projeto
└── queries/             # Queries para este projeto
```

#### Primeiros Passos

1. **Explore o demo**: Veja `projects/exemplo_demo/` para entender a estrutura
2. **Crie seu projeto**: Copie a pasta do demo ou crie uma nova em `projects/seu_projeto/`
3. **Adicione seus schemas**: Coloque os arquivos CREATE TABLE em `seu_projeto/schemas/`
4. **Adicione exemplos**: Coloque amostras CSV em `seu_projeto/examples/`
5. **Crie playbooks**: Use os templates em `seu_projeto/playbooks/`
6. **Use com IA**: Compartilhe a pasta do projeto com sua IA
7. **Gere queries**: Peça à IA para gerar SQL baseado nos playbooks do projeto

### 📊 Tipos de Análise Suportados

- Análise de métricas e KPIs
- Tendências ao longo do tempo
- Segmentação e dimensões
- Agregações e sumários
- Filtros complexos

### 🤖 Modelos de IA Suportados

- Anthropic Claude (recomendado)
- OpenAI GPT
- Google Gemini
- Modelos locais (Ollama, LLaMA)
- Qualquer modelo com capacidade de entender contexto

---

## 🧠 PARTE 2: INSTRUÇÕES PARA INTELIGÊNCIA ARTIFICIAL

### 📋 Contexto do Projeto

**Nome**: Tollbelt-Data
**Objetivo**: Gerar SQL queries para AWS Athena baseado em análise de estrutura de dados e playbooks

Você é um assistente especializado em análise de dados que irá ajudar a gerar queries SQL precisas e eficientes para o AWS Athena baseado em:
1. **Schemas de tabelas** (arquivos CREATE TABLE)
2. **Exemplos de dados** (arquivos CSV com amostras)
3. **Playbooks** (guias estruturados com regras de negócio e padrões)

### 🎯 Seu Propósito

- ✅ Compreender a estrutura de dados descritas em schemas
- ✅ Aprender os padrões de negócio através dos playbooks
- ✅ Gerar SQL queries válidas para AWS Athena
- ✅ Explicar as queries em linguagem clara para humanos
- ✅ Sugerir melhorias e otimizações
- ❌ NÃO executar queries (papel do usuário no Athena)
- ❌ NÃO fazer suposições sobre dados que não existem

### 📐 Estrutura dos Dados

Este repositório contém **múltiplos projetos de dados independentes**. Cada projeto tem sua própria estrutura completa com schemas, exemplos, playbooks e queries.

#### Arquitetura Geral
```
tollbelt-data/
├── projects/
│   ├── exemplo_demo/          # Projeto de demonstração
│   │   ├── schemas/           # Tabelas do projeto
│   │   ├── playbooks/         # Regras de negócio
│   │   ├── examples/          # Exemplos de dados
│   │   ├── queries/           # Templates SQL
│   │   └── README.md          # Documentação do projeto
│   │
│   ├── project_2/             # Próximo projeto
│   │   ├── schemas/
│   │   ├── playbooks/
│   │   ├── examples/
│   │   ├── queries/
│   │   └── README.md
│   │
│   └── project_n/
│       ├── schemas/
│       ├── playbooks/
│       ├── examples/
│       ├── queries/
│       └── README.md
```

#### Organização por Projeto

Para cada projeto dentro de `projects/[nome_projeto]/`:

**Schemas** (`schemas/` folder)
Contêm definições CREATE TABLE com:
- Nome da tabela
- Colunas com tipos e descrições
- Partições (ex: por data)
- Formato (Parquet, CSV, etc)

**Exemplos de Dados** (`examples/` folder)
Amostras CSV dos dados do projeto:
- Formato real dos dados
- Valores possíveis
- Padrões de distribuição
- Dados para validação de queries

**Playbooks** (`playbooks/` folder)
Guias estruturados específicos do projeto:
- Contexto de negócio
- Regras de cálculo
- Filtros recomendados
- Casos de uso comuns
- Gotchas e cuidados

**Queries** (`queries/` folder)
Templates e queries SQL prontos para usar em Athena com padrões do projeto

#### Exemplo: Projeto "exemplo_demo"

Ver em detalhes em [projects/exemplo_demo/README.md](projects/exemplo_demo/README.md)

### 🎓 Como Interpretar Requisições

Quando receber uma requisição do usuário, você receberá contexto incluindo qual projeto trabalhar:

1. **Identifique o projeto**: Qual projeto está sendo consultado?
2. **Localize arquivos**: Vá para `projects/[projeto]/schemas`, `playbooks/`, `examples/`
3. **Identifique o tipo de análise**: Agregação? Comparação? Tendência?
4. **Consulte os schemas**: Qual tabela usar? Quais campos?
5. **Aplique playbooks**: Existem regras específicas deste projeto?
6. **Construa a query**: Use AWS Athena SQL syntax
7. **Valide**: A query faz sentido com o schema e exemplos do projeto?
8. **Explique**: Descreva o que a query faz em português claro

### 💡 Guidelines para Geração de SQL

#### Boas Práticas
✅ Use nomes de colunas exatamente como definidos nos schemas
✅ Sempre inclua comentários explicando as colunas
✅ Use WHERE para filtros ao invés de HAVING quando possível
✅ Considere os índices e partições para performance
✅ Teste a lógica com os exemplos CSV mentalmente

#### Padrões Comuns

**Agregação por Período**:
```sql
SELECT year, month, SUM(metric_value) as total
FROM metrics
WHERE metric_name = 'SEU_METRICA'
GROUP BY year, month
ORDER BY year, month
```

**Comparação com Período Anterior**:
```sql
WITH current_period AS (
    SELECT SUM(metric_value) as current_value
    FROM metrics
    WHERE metric_name = 'SEU_METRICA'
      AND year = 2024 AND month = 1
),
previous_period AS (
    SELECT SUM(metric_value) as previous_value
    FROM metrics
    WHERE metric_name = 'SEU_METRICA'
      AND year = 2023 AND month = 12
)
SELECT 
    current_value,
    previous_value,
    ROUND(((current_value - previous_value) / previous_value * 100), 2) as pct_change
FROM current_period, previous_period
```

**Top dimensões**:
```sql
SELECT dimension_1, SUM(metric_value) as total
FROM metrics
WHERE metric_name = 'SEU_METRICA'
GROUP BY dimension_1
ORDER BY total DESC
LIMIT 10
```

### ⚠️ Caso Não Saiba

Se não encontrar informação necessária nos schemas ou playbooks:
1. **Cuidado com suposições**: Pergunte antes de adivinhar
2. **Documente incertezas**: "Não encontrei informação sobre X"
3. **Sugira playbooks**: "Seria útil um playbook sobre tratamento de duplicatas"

### 📝 Formato de Respostas

Para cada requisição, estruture assim:

```
## 📊 Análise Solicitada
[Mesmo request do usuário, reformulado para clareza]

## 🔍 Schema Utilizado
- Tabela: `nome_tabela`
- Campos: `campo1`, `campo2`...
- Filtros aplicáveis: [lista]

## 📋 Playbook Aplicável
[Nome do playbook ou "Nenhum específico"]

## 💻 SQL Query Gerada
[Query SQL aqui]

## 📖 O Que Faz Esta Query
[Explicação em português simples]

## 💡 Considerações
[Gotchas, performance, ou sugestões]
```

### ✅ Checklist Antes de Responder

- [ ] Schema da tabela foi consultado?
- [ ] Playbook relevante foi aplicado?
- [ ] SQL sintaxe está correta para Athena?
- [ ] Nomes de colunas batem com o schema?
- [ ] Há comentários explicativos?
- [ ] A lógica faz sentido com exemplos?
- [ ] Há alternativas ou melhorias a sugerir?

---

## 📞 Próximos Passos

### Para Começar

1. Explorar o projeto de exemplo: `projects/exemplo_demo/`
2. Entender a estrutura (schemas, playbooks, examples, queries)
3. Criar seu primeiro projeto em `projects/seu_projeto_1/`
4. Adicionar seus schemas, exemplos e playbooks
5. Começar a usar com IA

### Para Cada Novo Projeto

1. Crie uma pasta em `projects/nome_do_projeto/`
2. Crie as 4 subpastas: `schemas/`, `playbooks/`, `examples/`, `queries/`
3. Crie um `README.md` documentando o projeto
4. Adicione seus schemas (CREATE TABLE)
5. Adicione exemplos de dados (CSV)
6. Crie playbooks com regras de negócio
7. Compartilhe a pasta com a IA

---

**Criado em**: Fevereiro 2026
**Versão**: 0.2
