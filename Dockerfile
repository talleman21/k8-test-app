FROM node:18
ENV PORT 80
EXPOSE 80

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY package.json .
RUN npm install
COPY . .

CMD ["npm", "start"]
