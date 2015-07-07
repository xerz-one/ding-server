# Ding Server
# 2015 Francisco Gómez <espectalll123@kydara.com>
# All rights reversed

http = require 'http'
WebSocket = require 'ws'

WebSocketServer = require('ws').Server
wss = new WebSocketServer({
        host: process.env.OPENSHIFT_NODEJS_IP || '0.0.0.0'
        port: process.env.OPENSHIFT_NODEJS_PORT || 80;
});

wss.on 'connection', (ws) ->
  ws.on 'message', (msg) ->
    ws.send msg
