#!/bin/sh
set -e

# Configura variáveis mínimas para produção
: "${N8N_BASIC_AUTH_ACTIVE:=true}"
: "${N8N_BASIC_AUTH_USER:=ruicirilo1980@gmail.com}"
: "${N8N_BASIC_AUTH_PASSWORD:=19725735aA?}"
: "${N8N_HOST:=0.0.0.0}"
: "${N8N_PORT:=5678}"
: "${NODE_ENV:=production}"

# Executa o n8n
exec n8n "$@"

