http = require('http')
mongo = require('mongoskin')

http.createServer((req, res)->

  conn = mongo.db(process.env.MONGOHQ_URL)
  conn.collection('system.users').find({}).toArray (err, items)->
    throw err if err
    
    res.writeHead 200, {'Content-Type': 'text/plain'}
    res.end JSON.stringify(items)

).listen(process.env.PORT, "0.0.0.0")
console.log "Server running on port #{process.env.PORT}"
