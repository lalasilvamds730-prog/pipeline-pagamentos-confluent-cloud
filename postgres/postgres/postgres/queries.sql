
-- Consultar os pagamentos registrados
SELECT
    transaction_id,
    card_id,
    merchant_id,
    amount,
    transaction_time,
    status
FROM transactions
ORDER BY transaction_time DESC;

-- Consultar pagamentos com valor elevado
SELECT
    transaction_id,
    card_id,
    amount,
    transaction_time
FROM transactions
WHERE amount >= 1000
ORDER BY amount DESC;

-- Contar pagamentos por cartão
SELECT
    card_id,
    COUNT(*) AS total_transacoes,
    SUM(amount) AS valor_total
FROM transactions
GROUP BY card_id
ORDER BY total_transacoes DESC;
