FROM node:20.11.1-bookworm-slim

WORKDIR /app

RUN apt-get update && \
    apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    build-essential \
    python3 \
    && rm -rf /var/lib/apt/lists/*

COPY package*.json ./
RUN npm install --include=dev

COPY . .

CMD ["npm", "run", "dev"]