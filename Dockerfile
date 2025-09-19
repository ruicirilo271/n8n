# Use a imagem oficial do Node.js como base
FROM node:20-slim

# Setar diretório de trabalho
WORKDIR /app

# Copiar package.json e package-lock.json primeiro para cache do Docker
COPY package*.json ./

# Instalar dependências
RUN npm install --production

# Copiar todo o resto do projeto
COPY . .

# Expor a porta que o n8n usará
EXPOSE 5678

# Definir variáveis de ambiente do n8n
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=ruicirilo1980@gmail.com
ENV N8N_BASIC_AUTH_PASSWORD=19725735aA?
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=http

# Comando para iniciar o n8n
CMD ["npx", "n8n", "start"]
