
-- Pipeline de pagamentos: consultas de referência para Flink SQL.
-- Pré-requisito: criar a tabela transactions conectada ao tópico Kafka.
-- transaction_time deve estar disponível como TIMESTAMP.
-- A configuração do Kafka e das credenciais será feita no ambiente Flink.

-- 1. Consultar os pagamentos recebidos.
SELECT
    transaction_id,
    card_id,
    merchant_id,
    amount,
    transaction_time,
    status
FROM transactions;

-- 2. Identificar cartões com 3 ou mais pagamentos
-- dentro de uma janela deslizante de 60 segundos.
SELECT
    window_start,
    window_end,
    card_id,
    COUNT(*) AS total_transacoes,
    SUM(amount) AS valor_total
FROM TABLE(
    HOP(
        TABLE transactions,
        DESCRIPTOR(transaction_time),
        INTERVAL '10' SECOND,
        INTERVAL '60' SECOND
    )
)
GROUP BY
    window_start,
    window_end,
    card_id
HAVING COUNT(*) >= 3;
