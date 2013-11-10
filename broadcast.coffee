net = require 'net'

highest_subscriber_index = -1
subscribers = []
subscriberCount = 0

exports.start = (port)->
  server = net.createServer(onNewSubscriber)
  server.listen(port)
  setInterval ->
    server.getConnections(console.log)
    send('hey you guys!\n')
  , 1000

exports.send = send = (message)->
  for index, subscriber of subscribers
    console.log "Writing to: #{subscriber.subscriber_index}"
    subscriber.write(message) 

onNewSubscriber = (stream)->
  console.log 'connection incoming!'
  stream.setTimeout(0)
  stream.setEncoding('utf8')

  subscribe(stream)

  stream.write("~~~ WELCOME TO THE TIME SERVER ~~~\n")
  stream.write("You are subscriber ##{subscribers.length}\n")
  stream.write("\n\n")
  console.log('New subscriber: ' + subscribers.length + " total.\n")

  stream.on 'end', ->
    unsubscribe(stream)
    stream.end()
    stream.destroy()
    console.log('Subscriber left: ' + subscribers.length + " total.\n")

  stream.on 'error', ->
    console.log "error writing to stream: #{stream.subscriber_index}"
    stream.emit('end')

nextSubscriberIndex = ->
  highest_subscriber_index += 1

subscribe = (stream)->
  stream.subscriber_index = nextSubscriberIndex()
  console.log "subscribe: #{stream.subscriber_index}"
  subscribers[stream.subscriber_index] = stream
  subscriberCount += 1

unsubscribe = (stream)->
  console.log "unsubscribe: #{stream.subscriber_index}"
  delete subscribers[stream.subscriber_index]
  subscriberCount -= 1



