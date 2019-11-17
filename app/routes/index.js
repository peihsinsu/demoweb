var express = require('express');
var router = express.Router();
var os = require('os');

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

router.all('/test', function(req, res, next){
   var t = 0;
   if(req.query.delay)
     t = parseInt(req.query.delay);
   if(req.query.random)
     t = t * Math.random();

   var simulate_err = false;
   if(req.query.simulate5xx && req.query.errrate) {
     var r = Math.random();
     console.log('Got random:%s, rate: %s', r, parseFloat(req.query.errrate));
     
     if(r < parseFloat(req.query.errrate)) {
       simulate_err = true;
     }
   }

   var statusCode = simulate_err ? 500 : 200;
   var output = { 
        url: req.url,
        remote_url: req.connection.remoteAddress,
	version: process.env.VERSION,
	host: os.hostname(),
        method: req.method,
        header: req.headers,
        body: req.body,
        q: req.query,
	delay: t,
	statusCode: statusCode
    };
   
   console.log(output);
   setTimeout(function(){
     res.status(statusCode).send(output);
   }, t);
});

module.exports = router;
