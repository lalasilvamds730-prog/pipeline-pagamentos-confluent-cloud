
# Scripts de Configuração e Execução

Esta pasta será utilizada para os scripts que automatizam a preparação e a execução do pipeline.

## Scripts planejados

- `setup.sh`: preparar os recursos necessários para o ambiente.
- `generate_data.py`: gerar dados sintéticos para testes.
- `teardown.sh`: orientar a limpeza dos recursos criados.

## CDC

O conector de Change Data Capture (CDC) deverá capturar inserções, atualizações e exclusões no PostgreSQL e publicar os eventos nos tópicos configurados.

## Segurança

- Utilizar variáveis de ambiente para credenciais.
- Não publicar tokens, senhas ou chaves no GitHub.
- Não executar scripts que criem recursos pagos sem verificar previamente os custos.

## Status

Os scripts de execução ainda não foram implementados nem testados.
