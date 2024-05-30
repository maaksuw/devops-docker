FROM node:16.8.0-alpine as build-stage

WORKDIR /usr/src/app

COPY . .

RUN npm install && \
    npm run build


FROM node:16.8.0-alpine

COPY --from=build-stage /usr/src/app/build /build

EXPOSE 5000 

RUN npm install -g serve && \
    adduser -D frontuser && \
    chown frontuser .

USER frontuser

CMD ["serve", "-s", "-l", "5000", "build"]
