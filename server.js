(function() {
  var WebSocket, WebSocketServer, http, wss;

  http = require('http');

  WebSocket = require('ws');

  WebSocketServer = require('ws').Server;

  wss = new WebSocketServer({
    port: 80
  });

  wss.on('connection', function(ws) {
    ws.on('message', function(msg) {
      return console.log('received: ' + msg);
    });
    return ws.send('something');
  });

}).call(this);
