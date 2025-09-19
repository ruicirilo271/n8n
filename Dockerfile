FROM node:20-alpine
WORKDIR /home/node

COPY package*.json ./
RUN npm install

COPY . .

RUN npm run build

EXPOSE 5678
CMD ["npm", "run", "start"]

