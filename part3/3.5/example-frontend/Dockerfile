FROM node:16.8.0

EXPOSE 5000

WORKDIR /usr/src/app

COPY . .

#npm commands

RUN npm install

#RUN REACT_APP_BACKEND_URL=http://localhost:8080 npm run build

RUN npm run build

RUN npm install -g serve

#Change user

RUN useradd -m frontuser

RUN chown frontuser .

USER frontuser

#Actual command

CMD ["serve", "-s", "-l", "5000", "build"]
