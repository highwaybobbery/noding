http = require 'http'

exports.start = (route)->
  onRequest = (request, response)->
    route(request, response)


  server = http.createServer onRequest
  server.listen(8888)

  console.log 'server started'
