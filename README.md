# Pipeline Real-Time End-to-End com Confluent Cloud

## Objetivo

Desenvolver um pipeline de pagamentos em tempo real, integrando PostgreSQL, captura de alterações de dados (CDC), Confluent Cloud e processamento com Flink SQL.

O projeto faz parte do desafio de projeto da DIO no bootcamp IBM Confluent — Dados em Tempo Real para Agentes de IA.

## Arquitetura planejada

1. **Foundation:** preparação do ambiente e controle de acesso.
2. **Contract:** definição e evolução dos schemas dos eventos.
3. **Ingestion:** captura de alterações do PostgreSQL por CDC.
4. **Processing:** enriquecimento de transações e identificação de possíveis fraudes com Flink SQL.
5. **Operations:** observabilidade, permissões e controle de custos.

## Estrutura do projeto

- `postgres/` — configurações e scripts do PostgreSQL.
- `schemas/` — contratos e schemas dos eventos.
- `flink/` — consultas SQL de processamento.
- `scripts/` — scripts auxiliares.
- `evidencias/` — capturas de tela e resultados dos testes.

## Status

Projeto em fase de preparação. As etapas serão documentadas conforme forem implementadas e testadas.

## Segurança

Credenciais, senhas, tokens e chaves de acesso não devem ser publicados neste repositório.
