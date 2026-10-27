
-- Consultar os pagamentos mais recentes
SELECT
    transaction_id,
    card_id,
    merchant_id,
    amount,
    transaction_time,
    status
FROM transactions
ORDER BY transaction_time DESC;

-- Consultar pagamentos de valor elevado
SELECT
    transaction_id,
    card_id,
    amount,
    transaction_time,
    status
FROM transactions
WHERE amount >= 1000
ORDER BY amount DESC;

-- Resumir quantidade e valor total por cartão
SELECT
    card_id,
    COUNT(*) AS total_transacoes,
    SUM(amount) AS valor_total
FROM transactions
GROUP BY card_id
ORDER BY total_transacoes DESC;

-- Identificar cartões com 3 ou mais transações nos últimos 60 segundos
SELECT
    card_id,
    COUNT(*) AS total_transacoes,
    MIN(transaction_time) AS primeira_transacao,
    MAX(transaction_time) AS ultima_transacao
FROM transactions
WHERE transaction_time >= CURRENT_TIMESTAMP - INTERVAL '60 seconds'
GROUP BY card_id
HAVING COUNT(*) >= 3
ORDER BY total_transacoes DESC;

