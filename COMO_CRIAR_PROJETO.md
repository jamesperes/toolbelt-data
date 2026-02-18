# 📋 Como Criar um Novo Projeto

Este documento explicar como criar um novo projeto de análise de dados no Tollbelt-Data.

---

## 🎯 Passo a Passo

### 1. Crie a Pasta do Projeto

```bash
mkdir -p projects/seu_projeto_nome
cd projects/seu_projeto_nome
```

### 2. Crie as 4 Subpastas Principais

```bash
mkdir playbooks
mkdir schemas
mkdir examples
mkdir queries
```

**Resultado:**
```
seu_projeto_nome/
├── playbooks/     # Guias de negócio
├── schemas/       # Definições de tabelas
├── examples/      # Exemplos de dados
└── queries/       # Templates de SQL
```

### 3. Crie um README.md para o Projeto

Copie o template de outro projeto ou use este básico:

```markdown
# 📊 Projeto: Seu Nome do Projeto

[Descrição do projeto]

## 📁 Estrutura

```
seu_projeto/
├── README.md
├── playbooks/    # Guias de negócio
├── schemas/      # Tabelas SQL
├── examples/     # Dados de exemplo
└── queries/      # Templates SQL
```

## 📐 Dados Disponíveis

[Descrever quais dados estão disponíveis]

## 📚 Playbooks

[Listar playbooks disponíveis]

## 🚀 Como Usar

[Instruções de uso]
```

Use [projects/exemplo_demo/README.md](exemplo_demo/README.md) como referência completa.

### 4. Adicione seus Schemas

Para cada tabela que você quer documentar:

1. Crie `schemas/nome_tabela.sql`
2. Copie o template de `exemplo_demo/schemas/TEMPLATE.sql`
3. Modifique com suas colunas e partições reais

**Exemplo:**
```sql
-- schemas/vendas.sql
CREATE TABLE vendas (
    id STRING COMMENT 'ID único',
    valor DECIMAL(10,2) COMMENT 'Valor da venda',
    regiao STRING COMMENT 'Região',
    data DATE COMMENT 'Data da venda'
)
PARTITIONED BY (ano INT, mes INT)
STORED AS PARQUET;
```

### 5. Adicione Exemplos de Dados

Para cada tabela, crie um exemplo CSV:

1. Crie `examples/nome_tabela_EXEMPLO.csv`
2. Coloque 5-10 linhas de dados reais (ou similares)
3. Use os mesmos nomes de coluna do schema

**Exemplo:**
```csv
id,valor,regiao,data,ano,mes
V001,1500.50,NORDESTE,2024-01-15,2024,1
V002,2000.00,SUDESTE,2024-01-15,2024,1
V003,1200.75,SUL,2024-01-15,2024,1
```

### 6. Crie Playbooks

Para cada métrica ou análise importante:

1. Crie `playbooks/nome_analise.md`
2. Copie o template de `exemplo_demo/playbooks/TEMPLATE.md`
3. Preencha com suas regras de negócio

**Exemplo:**
```markdown
# Playbook: Análise de Vendas por Região

## Contexto
Vendas por região para acompanhar desempenho geográfico.

## Schema
- Tabela: `vendas`
- Campos: `valor`, `regiao`
- Partições: `ano`, `mes`

## Regras Importantes
1. Sempre filtrar pelos params ano/mes
2. Vendas duplicadas: remover com DISTINCT
3. Nulos: não incluir

## Exemplos
### Total por Região
```sql
SELECT 
    regiao,
    SUM(valor) as total
FROM vendas
WHERE ano = 2024 AND mes = 1
GROUP BY regiao
ORDER BY total DESC
```
```

### 7. Adicione Templates de Queries

1. Crie `queries/descricao_query.sql`
2. Copie o template de `exemplo_demo/queries/TEMPLATE.sql`
3. Customize com suas queries padrão

---

## 📋 Checklist

Antes de compartilhar com a IA:

- [ ] Pasta `projects/seu_projeto/` criada
- [ ] Subpastas criadas: playbooks, schemas, examples, queries
- [ ] README.md preenchido e documentado
- [ ] Pelo menos 1 schema em `schemas/`
- [ ] Exemplo de dados em `examples/` para cada tabela
- [ ] Pelo menos 1 playbook em `playbooks/`
- [ ] Templates básicos em `queries/`

---

## 📝 Estrutura de Nomes de Arquivo

Use nomes descritivos e em português:

✅ **Bom:**
- `playbooks/analise_receita_vendas.md`
- `schemas/tabela_metricas_diarias.sql`
- `examples/metricas_diarias_AMOSTRA.csv`
- `queries/top_10_produtos_por_receita.sql`

❌ **Evitar:**
- `playbooks/pb1.md`
- `schemas/table.sql`
- `examples/data.csv`
- `queries/q1.sql`

---

## 🚀 Compartilhando com IA

Depois de criar seu projeto, compartilhe desta forma:

```
Vou analisar dados de vendas usando o Tollbelt-Data.

Projeto: projects/seu_projeto_nome/

Contexto:
- Schemas: projects/seu_projeto_nome/schemas/
- Playbooks: projects/seu_projeto_nome/playbooks/
- Exemplos: projects/seu_projeto_nome/examples/

Pergunta: [sua pergunta aqui]
```

A IA vai:
1. Ler os schemas para entender a estrutura
2. Consultar playbooks para regras de negócio
3. Verificar exemplos para validar lógica
4. Gerar SQL baseado tudo isso

---

## 💡 Dicas

### Para Múltiplas Tabelas
Crie um playbook unificado que referencia todas:

```markdown
# Playbook: Análise Integrada

## Schema
- Tabela 1: vendas
- Tabela 2: clientes
- Junção: vendas.cliente_id = clientes.id

## Queries de Exemplo
[Exemplos com JOINs]
```

### Para Atualizar Dados
Quando novos dados chegam:
1. Atualize os exemplos CSV
2. Avise a IA sobre mudanças
3. Crie novo playbook se houve mudar de regras

### Para Melhorar Gradualmente
Você não precisa preencher tudo de uma vez:
1. Comece com 1 tabela
2. Crie 1 playbook
3. Teste com IA
4. Expanda conforme necessário

---

**Última atualização**: Fevereiro 2026
