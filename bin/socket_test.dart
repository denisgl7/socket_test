import 'dart:core';
import 'dart:io';

void startServer() {
  print('Start socket test');
  Future<ServerSocket> serverFuture = ServerSocket.bind('127.0.0.1', 55555);
  serverFuture.then((ServerSocket server) {
    server.listen((Socket socket) {
      socket.listen((List<int> data) {
        String result = String.fromCharCodes(data);
        print(result.substring(0, result.length - 1));
      });
    });
  });
}

void main() {
  startServer();
}
