
INSERT INTO customers (name, email) VALUES
('Ana Silva', 'ana.teste@example.com'),
('Bruno Santos', 'bruno.teste@example.com'),
('Carla Souza', 'carla.teste@example.com');

INSERT INTO accounts (customer_id, account_status, balance) VALUES
(1, 'ACTIVE', 1500.00),
(2, 'ACTIVE', 2300.00),
(3, 'ACTIVE', 800.00);

INSERT INTO cards (account_id, card_status) VALUES
(1, 'ACTIVE'),
(2, 'ACTIVE'),
(3, 'ACTIVE');

INSERT INTO merchants (merchant_name, category) VALUES
('Loja Central', 'VAREJO'),
('Mercado Bom Preco', 'ALIMENTACAO'),
('Posto Avenida', 'COMBUSTIVEL');

INSERT INTO transactions
(card_id, merchant_id, amount, status) VALUES
(1, 1, 120.00, 'APPROVED'),
(1, 2, 85.50, 'APPROVED'),
(2, 2, 200.00, 'APPROVED'),
(3, 3, 150.00, 'APPROVED');
