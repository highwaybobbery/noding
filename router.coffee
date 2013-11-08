url = require 'url'
root_controller = require './root_controller'

exports.route = (request, response)->
  pathname = url.parse(request.url).pathname
  if routes[pathname]
    console.log "routing request for #{pathname}"
    routes[pathname](request, response)
  else
    console.log "no route for #{pathname}"
    response.writeHead 404
    response.end()

routes =
  '/' : root_controller.index
  '/favicon.ico' : root_controller.favicon
