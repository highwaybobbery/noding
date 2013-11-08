server = require './server'
router = require './router'

console.log 'packages loaded'

server.start(router.route)

console.log 'bootstrap complete'
