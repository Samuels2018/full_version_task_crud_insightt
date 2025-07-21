FROM node:20.11.1-bookworm-slim

WORKDIR /app

RUN apt-get update && \
    apt-get install -y \
    build-essential \
    python3 \
    && rm -rf /var/lib/apt/lists/*

COPY package*.json ./
RUN npm install

RUN npm install -g sequelize-cli

COPY . .

CMD ["sh", "-c", "sequelize-cli db:migrate && node server.js"]