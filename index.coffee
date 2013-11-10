server = require './server'
router = require './router'
broadcast = require './broadcast'


console.log 'packages loaded'

server.start(8888, router.route)
broadcast.start(7000)

console.log 'bootstrap complete'
