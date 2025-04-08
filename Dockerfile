FROM node:13-alpine

WORKDIR /home

COPY package.json ./

RUN npm install

COPY . .

CMD ["npm", "start"]

EXPOSE 3000