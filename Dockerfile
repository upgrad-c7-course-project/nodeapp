FROM node:alpine
MAINTAINER syedanees85@gmail.com

WORKDIR /app
COPY package*.json server.js ./
COPY . .

RUN npm install
EXPOSE 8080

CMD ["node", "server.js"]



