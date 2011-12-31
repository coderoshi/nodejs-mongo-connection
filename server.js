var http = require('http'),
   mongo = require('mongoskin');

var MHQ_URL = process.env.MONGOHQ_URL;
var PORT = process.env.PORT;

http.createServer(function (req, res) {

  var conn = mongo.db(MHQ_URL);
  conn.collection('system.users').find({}).toArray(function(err, items){
    if(err) throw err;
    
    res.writeHead(200, {'Content-Type': 'text/plain'});
    res.end(JSON.stringify(items));
  });

}).listen(PORT, "0.0.0.0");
console.log('Server running on port ' + PORT);
