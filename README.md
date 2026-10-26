
# Pipeline Real-Time End-to-End com Confluent Cloud

Projeto desenvolvido para o desafio do bootcamp IBM Confluent — Dados em Tempo Real para Agentes de IA, da DIO.

## Objetivo

Planejar e implementar um pipeline de pagamentos em tempo real utilizando PostgreSQL, captura de alterações (CDC), Confluent Cloud e Flink SQL.

## Arquitetura planejada

PostgreSQL → CDC → Confluent Cloud / Kafka → Flink SQL → Eventos e alertas

## Estrutura do repositório

- `postgres/`: criação das tabelas e consultas SQL.
- `schemas/`: documentação dos contratos de dados.
- `flink/`: documentação do processamento e detecção de transações suspeitas.
- `scripts/`: planejamento dos scripts de configuração e execução.
- `evidencias/`: espaço para evidências reais dos testes.
- `.env.example`: exemplo de variáveis de ambiente, sem credenciais reais.

## Regra de detecção planejada

Identificar três ou mais transações realizadas com o mesmo cartão dentro de uma janela de 60 segundos.

## Segurança

Nenhuma senha, chave de API ou credencial real deve ser publicada no repositório.

## Status atual

A estrutura inicial do repositório e alguns arquivos SQL e de documentação foram criados.

**O pipeline ainda não foi executado.** A conexão com o PostgreSQL, a configuração do CDC, o registro dos esquemas, o processamento no Flink e as evidências de funcionamento ainda precisam ser implementados e testados.

## Próximas etapas

1. Validar o esquema do banco e os dados de teste.
2. Preparar um ambiente PostgreSQL e testar os scripts SQL.
3. Configurar o CDC e os tópicos no ambiente Confluent.
4. Registrar os esquemas e validar sua compatibilidade.
5. Implementar e testar o processamento Flink SQL.
6. Registrar evidências reais e documentar os custos.
