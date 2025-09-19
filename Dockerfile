# Usa a imagem oficial do n8n
FROM n8nio/n8n:latest

# Define a pasta de trabalho
WORKDIR /data

# Define variáveis de ambiente mínimas para produção
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=ruicirilo1980@gmail.com
ENV N8N_BASIC_AUTH_PASSWORD=19725735aA?
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV NODE_ENV=production

# Expõe a porta
EXPOSE 5678

# Comando de arranque
CMD ["n8n", "start"]
