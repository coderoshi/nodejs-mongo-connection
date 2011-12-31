http = require('http')
mongo = require('mongoskin')

MHQ_URL = process.env.MONGOHQ_URL
PORT = process.env.PORT

http.createServer((req, res)->

  conn = mongo.db(MHQ_URL)
  conn.collection('system.users').find({}).toArray (err, items)->
    throw err if err
    
    res.writeHead 200, {'Content-Type': 'text/plain'}
    res.end JSON.stringify(items)

).listen(PORT, "0.0.0.0")
console.log "Server running on port #{PORT}"
