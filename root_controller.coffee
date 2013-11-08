fs = require 'fs'

exports.index = (request, response)->
  response.writeHead 200, 'Content-Type': 'text/plain'
  response.end 'hi bob'

exports.favicon = (request, response)->
  image = fs.readFileSync './favicon.ico'
  response.writeHead 200, 'Content-Type': 'image/x-icon'
  response.end image, 'binary'
