FROM node:alpine

WORKDIR /app

COPY . /app

RUN npm install
RUN node ace build --production

COPY .env ./build

RUN cd build && npm ci --production

EXPOSE 8080

ENTRYPOINT ["node", "build/server.js"]
