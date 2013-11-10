http = require 'http'

exports.start = (port, route)->
  onRequest = (request, response)->
    route(request, response)

  server = http.createServer onRequest
  server.listen(port)

  console.log 'server started'
