# Demoweb

Server start init delay: 
```
export DELAY=3000
npm start
```

Reqest test
```
curl $SERVER_IP/test
```

Reqest test with delay
```
curl $SERVER_IP/test?delay=3000&random=true
```


Request with error rate simulate
```
curl $SERVER_IP/test?simulate5xx=true&errrate=0.3
```


