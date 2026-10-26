
# Processamento com Flink SQL

Esta pasta documenta o processamento dos pagamentos em tempo real.

## Objetivos

- Enriquecer transações com informações das contas.
- Analisar transações por cartão.
- Identificar possíveis comportamentos suspeitos.
- Encaminhar alertas para um tópico específico.

## Regra de detecção

A regra planejada é detectar três ou mais transações do mesmo cartão dentro de uma janela de 60 segundos.

## Enriquecimento

As transações serão combinadas com os dados de contas por meio de consultas temporais, conforme a configuração dos tópicos e seus esquemas.

## Status

Documentação inicial. As consultas Flink SQL ainda precisam ser implementadas e testadas no ambiente Confluent Cloud.
