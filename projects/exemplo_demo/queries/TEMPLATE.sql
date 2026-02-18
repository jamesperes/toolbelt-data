-- Query Template: [Nome Descritivo]
-- 
-- Propósito: [O que esta query faz]
-- Playbook: [Referência ao playbook, se houver]
-- Data: [YYYY-MM-DD]
-- Autor: [seu nome]
-- 
-- Parámetros (se houver):
-- - year: Ano da análise (default: 2024)
-- - month: Mês da análise (default: 1)
-- - region: Região a filtrar (default: REGION_US)

-- ============================================
-- EXEMPLO 1: Agregação Simples
-- ============================================

SELECT 
    year,
    month,
    metric_name,
    dimension_1,
    SUM(metric_value) as total_value,
    COUNT(DISTINCT id) as count_records,
    AVG(metric_value) as avg_value
FROM schema_name.table_name
WHERE year = 2024
  AND month = 1
  AND dimension_1 = 'REGION_US'
GROUP BY 
    year,
    month,
    metric_name,
    dimension_1
ORDER BY 
    total_value DESC;


-- ============================================
-- EXEMPLO 2: Comparação com Período Anterior
-- ============================================

WITH current_month AS (
    SELECT 
        metric_name,
        dimension_1,
        SUM(metric_value) as current_value
    FROM schema_name.table_name
    WHERE year = 2024 AND month = 1
    GROUP BY metric_name, dimension_1
),
previous_month AS (
    SELECT 
        metric_name,
        dimension_1,
        SUM(metric_value) as previous_value
    FROM schema_name.table_name
    WHERE year = 2023 AND month = 12
    GROUP BY metric_name, dimension_1
)
SELECT 
    cm.metric_name,
    cm.dimension_1,
    current_value,
    previous_value,
    ROUND(((current_value - previous_value) / previous_value * 100), 2) as pct_change
FROM current_month cm
LEFT JOIN previous_month pm 
    ON cm.metric_name = pm.metric_name 
    AND cm.dimension_1 = pm.dimension_1
ORDER BY pct_change DESC;


-- ============================================
-- EXEMPLO 3: Ranking (Top 10)
-- ============================================

SELECT 
    dimension_1,
    dimension_2,
    SUM(metric_value) as total,
    RANK() OVER (PARTITION BY metric_name ORDER BY SUM(metric_value) DESC) as rank
FROM schema_name.table_name
WHERE year = 2024 AND month = 1
GROUP BY metric_name, dimension_1, dimension_2
QUALIFY rank <= 10
ORDER BY rank;
