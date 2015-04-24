var httpProxy = require('http-proxy');

var server = httpProxy.createServer({
     router: {
         'dubdiff.com': '172.17.42.1:8081',
         'mysite2.com': '172.17.42.1:8082',
         'mysite3.com': '172.17.42.1:8083'
     }
});

server.listen(process.env.PORT);
