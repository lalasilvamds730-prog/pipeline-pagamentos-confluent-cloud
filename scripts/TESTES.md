
# Guia de Testes Locais

## 1. Pré-requisitos

- Python 3 instalado para gerar o CSV.
- PostgreSQL instalado e funcionando para testar os arquivos SQL.
- Não é necessário conectar ao Confluent Cloud nesta etapa.

## 2. Gerar pagamentos fictícios

Na pasta principal do projeto, execute:

```bash
python scripts/generate_data.py
```

O comando deverá criar o arquivo `pagamentos_teste.csv`.

Para gerar 100 pagamentos:

```bash
python scripts/generate_data.py --output pagamentos.csv --count 100
```

O CSV inclui três pagamentos do mesmo cartão em 20 segundos. O script gera somente o arquivo CSV; ele não envia os dados ao PostgreSQL nem ao Kafka.

## 3. Criar as tabelas no PostgreSQL

Crie um banco vazio chamado `pagamentos` e execute:

```bash
psql -U usuario_local -d pagamentos -f postgres/init.sql
psql -U usuario_local -d pagamentos -f postgres/seed.sql
```

Substitua `usuario_local` pelo nome do usuário configurado no seu PostgreSQL.

**Importante:** execute o `seed.sql` somente uma vez em um banco vazio, pois ele pressupõe que os IDs comecem em 1.

## 4. Consultar os pagamentos

```bash
psql -U usuario_local -d pagamentos -f postgres/queries.sql
```

A consulta dos últimos 60 segundos depende do horário atual do banco. Se os dados forem inseridos há mais tempo, o resultado pode não mostrar as transações de teste.

## 5. O que ainda falta validar

- Gerar o CSV e conferir seu conteúdo.
- Executar os scripts SQL no PostgreSQL.
- Configurar e testar o CDC.
- Criar os tópicos no Confluent Cloud.
- Registrar e validar os esquemas.
- Configurar e testar as consultas Flink SQL.
- Guardar evidências reais dos testes.

## 6. Segurança

- Não publicar senhas, tokens ou chaves reais.
- Conferir os custos antes de criar recursos na nuvem.
- Excluir recursos de teste quando não forem mais necessários.
