# Playbook Template: [Nome da Métrica/Análise]

## 📋 Informações Básicas

- **Nome**: [Nome descritivo]
- **Descrição**: [Uma linha sobre o que é]
- **Data de Criação**: [YYYY-MM-DD]
- **Última Atualização**: [YYYY-MM-DD]
- **Responsável**: [Seu nome/time]

---

## 📖 Contexto do Negócio

[Explique o contexto de negócio desta métrica. Por exemplo:]
- Qual é o propósito?
- Por que é importante?
- Quem usa?

---

## 🗂️ Schema de Dados

### Tabela Principal
```
Nome: [tabela]
Descrição: [breve descrição]
```

### Colunas Relevantes
| Coluna | Tipo | Descrição | Notas |
|--------|------|-----------|-------|
| campo1 | STRING | Descrição | [Se há algo especial] |
| campo2 | DECIMAL | Descrição | [Se há algo especial] |

### Partições
- `PARTITIONED BY [listagem das partições]`

---

## 📐 Regras de Cálculo

### Filtros Obrigatórios
1. [Filtro 1 - explicação]
2. [Filtro 2 - explicação]

### Tratamentos Especiais
- [ ] Remover duplicatas? Como?
- [ ] Descartar nulos ou substituir por 0?
- [ ] Há períodos com dados faltantes?
- [ ] Há lógica de negócio especial?

---

## 💡 Exemplos de SQL

### Exemplo 1: [Descrição]
```sql
[Query SQL aqui]
```

### Exemplo 2: [Descrição]
```sql
[Query SQL aqui]
```

---

## 🚨 Gotchas e Cuidados

- ⚠️ [Cuidado importante 1]
- ⚠️ [Cuidado importante 2]
- ⚠️ [Cuidado importante 3]

---

## 🔗 Referências

- [Link documentação interna]
- [Link dashboard BI]
- [Outros playbooks relacionados]

---

## 📞 Sugestões para o Playbook

[Deixe espaço para feedback e melhorias]
