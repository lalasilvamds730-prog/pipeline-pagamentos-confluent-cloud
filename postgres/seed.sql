
-- Clientes fictícios para teste
INSERT INTO customers (name, email) VALUES
('Ana Silva', 'ana.teste@example.com'),
('Bruno Santos', 'bruno.teste@example.com'),
('Carla Souza', 'carla.teste@example.com');

-- Contas vinculadas aos clientes
INSERT INTO accounts (customer_id, account_status, balance) VALUES
(1, 'ACTIVE', 1500.00),
(2, 'ACTIVE', 2300.00),
(3, 'ACTIVE', 800.00);

-- Cartões vinculados às contas
INSERT INTO cards (account_id, card_status) VALUES
(1, 'ACTIVE'),
(2, 'ACTIVE'),
(3, 'ACTIVE');

-- Estabelecimentos fictícios
INSERT INTO merchants (merchant_name, category) VALUES
('Loja Central', 'VAREJO'),
('Mercado Bom Preco', 'ALIMENTACAO'),
('Posto Avenida', 'COMBUSTIVEL');

-- Pagamentos de teste.
-- Os três primeiros usam o cartão 1 em uma janela de 20 segundos.
INSERT INTO transactions
(card_id, merchant_id, amount, transaction_time, status) VALUES
(1, 1, 120.00, CURRENT_TIMESTAMP - INTERVAL '20 seconds', 'APPROVED'),
(1, 2, 85.50, CURRENT_TIMESTAMP - INTERVAL '10 seconds', 'APPROVED'),
(1, 3, 250.00, CURRENT_TIMESTAMP, 'APPROVED'),
(2, 2, 200.00, CURRENT_TIMESTAMP, 'APPROVED'),
(3, 3, 150.00, CURRENT_TIMESTAMP, 'APPROVED');
