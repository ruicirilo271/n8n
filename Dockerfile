# Usa imagem oficial do Node 16 Alpine
FROM node:16-alpine

# Variável de versão do n8n
ARG N8N_VERSION=0.258.0

# Instalando dependências necessárias
RUN apk add --no-cache \
        tini \
        tzdata \
        git \
        graphicsmagick \
        su-exec \
        python3 \
        build-base \
        ca-certificates \
    && npm config set python "$(which python3)" \
    && npm install -g n8n@${N8N_VERSION} full-icu \
    && apk del build-base python3 ca-certificates \
    && rm -rf /tmp/* /var/cache/apk/*

# Instala módulos extras do n8n
RUN npm install -g n8n-nodes-gemini --legacy-peer-deps

# Configuração de ICU (para suporte completo a datas e internacionalização)
ENV NODE_ICU_DATA /usr/local/lib/node_modules/full-icu

# Diretório de trabalho
WORKDIR /data

# Copia entrypoint
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

# Usa tini como entrypoint
ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]

# Exposição da porta padrão do n8n
EXPOSE 5678/tcp





