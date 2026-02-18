-- Template: Schema da Tabela [Nome]
-- 
-- Descrição: [Uma linha descrevendo o propósito da tabela]
-- Formato: [Parquet, CSV, etc]
-- Localização S3: [s3://bucket/path/...]
-- Atualização: [Diária, Horária, etc]

CREATE TABLE IF NOT EXISTS [schema_name].[table_name] (
    -- Identificadores
    id STRING COMMENT 'ID único do registro',
    
    -- Métrica Principal
    metric_value DECIMAL(15,2) COMMENT 'Valor da métrica principal',
    metric_name STRING COMMENT 'Nome/tipo da métrica',
    
    -- Dimensões
    dimension_1 STRING COMMENT 'Primeira dimensão de agrupamento',
    dimension_2 STRING COMMENT 'Segunda dimensão de agrupamento',
    
    -- Timestamps
    timestamp_utc TIMESTAMP COMMENT 'Momento do evento em UTC',
    created_at TIMESTAMP COMMENT 'Quando o registro foi criado',
    
    -- Metadados
    source STRING COMMENT 'Fonte dos dados (ex: API, Database, etc)',
    data_version STRING COMMENT 'Versão dos dados'
)
COMMENT 'Descrição completa da tabela'
PARTITIONED BY (
    year INT COMMENT 'Ano da partição',
    month INT COMMENT 'Mês da partição',
    day INT COMMENT 'Dia da partição'
)
STORED AS PARQUET
LOCATION 's3://seu-bucket/seu-caminho/tabela/'
TBLPROPERTIES (
    'classification' = 'parquet',
    'compressionType' = 'snappy'
);
