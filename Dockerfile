From node

WORKDIR /app
ADD . /app

RUN npm install

CMD ["npm","start"]
