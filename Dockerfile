# Usar Node.js oficial
FROM node:24-slim

# Diretório de trabalho
WORKDIR /app

# Copiar package.json e package-lock.json para cache
COPY package*.json ./

# Instalar dependências de produção
RUN npm install --production

# Copiar todo o restante do projeto
COPY . .

# Expor a porta padrão do n8n
EXPOSE 5678

# Variáveis de ambiente padrão
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=http
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=ruicirilo1980@gmail.com
ENV N8N_BASIC_AUTH_PASSWORD=19725735aA?


# Comando para iniciar o n8n
CMD ["npx", "n8n", "start"]

