# Usar Node.js LTS
FROM node:24-bullseye-slim

# Diretório de trabalho
WORKDIR /app

# Copiar package.json e package-lock.json
COPY package*.json ./

# Instalar apenas dependências de produção
RUN npm install --production

# Copiar todo o código
COPY . .

# Porta padrão do n8n
EXPOSE 5678

# Variável de ambiente para produção
ENV NODE_ENV=production

# Comando para iniciar o n8n com túnel
CMD ["npx", "n8n", "start", "--tunnel"]
