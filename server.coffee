# Ding Server
# 2015 Francisco Gómez <espectalll123@kydara.com>
# All rights reversed

http = require 'http'
WebSocket = require 'ws'

WebSocketServer = require('ws').Server
wss = new WebSocketServer({ port: 80 });

wss.on 'connection', (ws) ->
  ws.on 'message', (msg) ->
    console.log 'received: ' + msg
  ws.send('something');
