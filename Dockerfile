From node

WORKDIR /app
ADD ./app /app

RUN npm install

CMD ["npm","start"]
