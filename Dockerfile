From node

WORKDIR /app
ADD ./app /app

RUN npm install

EXPOSE 3000
EXPOSE 80

CMD ["npm","start"]
