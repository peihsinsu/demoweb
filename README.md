# Just for Demo

## Clone me to CloudShell

[![button(http://gstatic.com/cloudssh/images/open-btn.png)](https://console.cloud.google.com/cloudshell/open?git_repo=https://github.com/peihsinsu/demoweb&working_dir=app&page=shell&tutorial=README.md)


## Test from local

start at local

```
cd $project/app
export PORT=3000
npm install && npm start
```

do curl test

```
curl -X POST 'localhost:3000/test?t=1' -d test=1
```
