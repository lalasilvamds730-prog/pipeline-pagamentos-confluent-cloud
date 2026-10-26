# Processamento com Flink SQL

Esta pasta armazenará as consultas SQL utilizadas para processar os eventos de pagamentos em tempo real.

O processamento previsto inclui:

- Enriquecimento das transações com informações de contas.
- Identificação de possíveis pagamentos suspeitos.
- Regra de alerta para três transações no mesmo cartão em um intervalo de 60 segundos.

As consultas serão adicionadas e testadas durante a implementação do pipeline.
