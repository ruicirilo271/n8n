# Dockerfile para n8n no Render

# 1. Escolher a imagem oficial do Node.js
FROM node:24-bullseye-slim

# 2. Diretório de trabalho
WORKDIR /app

# 3. Copiar package.json e package-lock.json
COPY package*.json ./

# 4. Instalar dependências
RUN npm install --production

# 5. Copiar todo o código da aplicação
COPY . .

# 6. Expor a porta padrão do n8n
EXPOSE 5678

# 7. Definir a variável de ambiente para produção
ENV NODE_ENV=production

# 8. Comando para iniciar o n8n
CMD ["npx", "n8n", "start", "--tunnel"]
