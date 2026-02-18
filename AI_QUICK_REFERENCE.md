# 🤖 Guia Rápido de Referência para IA

## Checklist Rápido Antes de Gerar SQL

Quando receber uma requisição do usuário:

### 1️⃣ **Localizar o Projeto**
- [ ] Qual projeto estou analisando? (ex: exemplo_demo, my_project)
- [ ] Os arquivos estão em `projects/[nome_projeto]/`?

### 2️⃣ **Interpretação**
- [ ] Entendi o que o usuário quer?
- [ ] É uma agregação, comparação, ranking ou outro tipo?
- [ ] Há períodos específicos mencionados?

### 3️⃣ **Pesquisa de Contexto**
- [ ] Verifiquei os schemas em `projects/[projeto]/schemas/`?
- [ ] Identifiquei as tabelas e colunas relevantes?
- [ ] Existem playbooks em `projects/[projeto]/playbooks/` que se aplica?
- [ ] Consultei os exemplos em `projects/[projeto]/examples/`?

### 4️⃣ **Construção**
- [ ] A query usa SQL válido para Athena?
- [ ] Os nomes de colunas estão EXATAMENTE como no schema?
- [ ] Aplicarei os filtros obrigatórios do playbook?
- [ ] Considerarei as partições para performance?

### 5️⃣ **Validação**
- [ ] A lógica faz sentido com os exemplos CSV?
- [ ] Há comentários explicativos?
- [ ] Usei aliases úteis para clareza?
- [ ] Considerei tratamento de nulos/duplicatas?

### 6️⃣ **Resposta**
- [ ] Formatei segundo o template de resposta?
- [ ] Expliquei em português claro?
- [ ] Sugeri alternativas ou otimizações?

---

## Padrões SQL Rápidos

### 🔹 Tempo Real / Hoje
```sql
WHERE year = YEAR(CURRENT_DATE)
  AND month = MONTH(CURRENT_DATE)
  AND day = DAY(CURRENT_DATE)
```

### 🔹 Mês Anterior
```sql
WHERE year = YEAR(DATE_ADD('month', -1, CURRENT_DATE))
  AND month = MONTH(DATE_ADD('month', -1, CURRENT_DATE))
```

### 🔹 Últimos 7 Dias
```sql
WHERE DATE_FORMAT(timestamp_utc, '%Y-%m-%d') >= 
      DATE_FORMAT(DATE_ADD('day', -7, CURRENT_DATE), '%Y-%m-%d')
```

### 🔹 Remover Duplicatas
```sql
WITH unique_records AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY id ORDER BY created_at DESC) as rn
    FROM tabela
)
SELECT * FROM unique_records WHERE rn = 1
```

### 🔹 Tratamento de Nulos
```sql
COALESCE(coluna, 0)  -- Substitui NULL por 0
NULLIF(coluna, 0)    -- Substitui 0 por NULL
```

### 🔹 Agregação por Período
```sql
GROUP BY year, month, day, dimension_1
ORDER BY year DESC, month DESC, day DESC
```

---

## Mensagens Comuns

### ✅ Quando Tiver Certeza
"Baseado no playbook [NOME], aqui está a query que responde sua requisição..."

### ⚠️ Quando Tiver Dúvida Pequena
"Não encontrei especificação exata de [ALGO] no playbook. Usei [SUPOSIÇÃO]. Se diferentes, avise."

### ❌ Quando Tiver Dúvida Grande
"Para gerar a query corretamente, preciso esclarecer: [PERGUNTAS]. Sem essa info, farei [SUPOSIÇÃO]."

### 💡 Quando Puder Melhorar
"A query básica responde sua pergunta. Considere também [SUGESTÃO] para análise mais profunda."

---

## Logs de Playbooks Disponíveis

**Ao responder, mencione qual/quais playbooks foram usados:**

Exemplo:
```
## 📋 Playbook Aplicável
- ✅ playbooks/TEMPLATE.md (como base estrutural)
- ✅ playbooks/[ESPECÍFICO]_analytics.md (regras de cálculo)
```

---

## Estrutura de Resposta Padrão

```
## 📊 Análise Solicitada
[Reformule o pedido em suas próprias palavras]

## 🔍 Schema Utilizado
- Tabela: `nome_tabela`
- Campos principais: `col1`, `col2`, `col3`
- Filtros críticos: [lista de WHERE]

## 📋 Playbook Aplicável
[Mencione qual playbook foi consultado]

## 💻 SQL Query Gerada
[A query aqui]

## 📖 O Que Faz Esta Query
[Explicação simples em português]

## 💡 Considerações
- Performance: [se há partições, índices, etc]
- Gotchas: [cuidados especiais]
- Alternativas: [outras formas de fazer]
```

---

## Erros Comuns a Evitar

❌ **NÃO FAÇA:**
- Usar nomes de colunas aproximados ("metric" em vez de "metric_value")
- Ignorar filtros obrigatórios do playbook
- Esquecer de particionar quando disponível
- Fazer suposições sem perguntar
- Executar a query no Athena (isso é papel do usuário)

✅ **FAÇA:**
- Sempre verificar schema antes de gerar SQL
- Consulte playbooks primeiro
- Inclua comentários nas queries
- Pergunte quando não tiver 100% de certeza
- Forneça alternativas e sugestões

---

## Próximas Fases do Projeto

Após essa fase inicial de schemas/playbooks/exemplos:
1. Criar APIs de integração com LLMs
2. Automatizar deploy de playbooks
3. Adicionar histórico de queries bem-sucedidas
4. Criar métricas de uso
5. Gerar dashboards automáticos

---

**Última atualização**: Fevereiro 2026
