
-- CONSULTAS DE REFERÊNCIA PARA FLINK SQL
-- Pré-requisito: criar a tabela `transactions` no Flink
-- apontando para o tópico Kafka de pagamentos, com os campos:
-- transaction_id, card_id, merchant_id, amount,
-- transaction_time e status.
--
-- A coluna transaction_time deve estar configurada como
-- atributo de tempo de evento, com WATERMARK.

-- 1. Consultar pagamentos aprovados
SELECT
    transaction_id,
    card_id,
    merchant_id,
    amount,
    transaction_time,
    status
FROM transactions
WHERE status = 'APPROVED';

-- 2. Detectar 3 ou mais transações do mesmo cartão
-- em janelas móveis de 60 segundos.
-- Esta consulta pressupõe que transaction_time é
-- um atributo de tempo de evento válido no Flink.

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
        INTERVAL '1' SECOND,
        INTERVAL '60' SECOND
    )
)
GROUP BY
    window_start,
    window_end,
    card_id
HAVING COUNT(*) >= 3;
