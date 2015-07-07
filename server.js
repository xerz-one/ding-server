(function() {
  var WebSocket, WebSocketServer, http, wss;

  http = require('http');

  WebSocket = require('ws');

  WebSocketServer = require('ws').Server;

  wss = new WebSocketServer({
    host: process.env.OPENSHIFT_NODEJS_IP || '0.0.0.0',
    port: process.env.OPENSHIFT_NODEJS_PORT || 80
  });

  wss.on('connection', function(ws) {
    return ws.on('message', function(msg) {
      return ws.send(msg);
    });
  });

}).call(this);
