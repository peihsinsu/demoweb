var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

router.all('/test', function(req, res, next){
    res.send({
        url: req.url,
		    remote_url: req.connection.remoteAddress,
        method: req.method,
		    header: req.headers,
        body: req.body,
        q: req.query
    })
});

module.exports = router;
