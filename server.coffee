# Ding Server
# 2015 Francisco Gómez <espectalll123@kydara.com>
# All rights reversed

http = require 'http'
WebSocket = require 'ws'

sockets = {}
phones = []
count = 0

WebSocketServer = require('ws').Server
wss = new WebSocketServer
    host: process.env.OPENSHIFT_NODEJS_IP || '0.0.0.0'
    port: process.env.OPENSHIFT_NODEJS_PORT || 80

wss.on 'connection', (ws) ->
  id = count
  count++
  sockets[id] = ws
  ws.on 'message', (msg) ->
    if msg.substr(0, 6) == "phone "
      phones[id] = msg.substr(6)
    if msg.substr(0, 5) == "ding "
      phoneId = phones.indexOf(msg.substr 5)
      if phoneId != -1
        sockets[phoneId].send("Ding!")
      else
        sockets[id].send("Failed :(")
  ws.on 'close', ->
    phones.splice(id, 1)
