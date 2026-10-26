
# Contratos de Dados

Esta pasta documenta os esquemas utilizados no pipeline de pagamentos em tempo real.

## Esquemas planejados

- **Customers:** dados básicos dos clientes.
- **Accounts:** contas vinculadas aos clientes.
- **Cards:** cartões associados às contas.
- **Merchants:** estabelecimentos comerciais.
- **Transactions:** transações financeiras.

## Evolução dos esquemas

A evolução dos contratos será testada adicionando campos opcionais, preservando a compatibilidade com consumidores existentes.

## Segurança

- Não armazenar senhas, tokens ou chaves neste diretório.
- Utilizar dados fictícios para testes.
- Avaliar a exposição de informações pessoais antes de publicar eventos.

## Status

Documentação inicial. O registro e os testes de compatibilidade no Schema Registry ainda precisam ser implementados.
