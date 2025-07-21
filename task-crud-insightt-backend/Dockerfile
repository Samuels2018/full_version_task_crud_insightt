FROM node:20-alpine

ENV NODE_ENV=development
ENV PORT=3000

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install --include=dev
RUN npm install -g ts-node typescript

COPY . .

RUN chmod +x entrypoint.sh

EXPOSE ${PORT}

CMD ["./entrypoint.sh"]