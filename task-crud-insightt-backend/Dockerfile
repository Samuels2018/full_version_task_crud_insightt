FROM node:23
WORKDIR /app
COPY package.json ./
COPY package-lock.json ./
RUN npm install
COPY . .
RUN npx sequelize-cli db:migrate
CMD ["npx", "ts-node", "server.ts"]