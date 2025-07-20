FROM node:18-alpine AS builder

ENV NODE_ENV=production
WORKDIR /app

COPY package*.json ./
COPY vite.config.ts .
RUN npm ci --silent

COPY . .

RUN npm run dev