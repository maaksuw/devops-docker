FROM node:16.8.0-alpine

EXPOSE 5000

WORKDIR /usr/src/app

COPY . .

RUN npm install && \
    npm run build && \
    npm install -g serve && \
    adduser -D frontuser && \
    chown frontuser .

USER frontuser

CMD ["serve", "-s", "-l", "5000", "build"]
